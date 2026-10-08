import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:offline_app/data/database.dart';

class Home extends StatefulWidget {
  final AppDatabase database;

  const Home({super.key, required this.database});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _addTask() async {
    final title = _titleController.text.trim();
    if (title.length < 6 || title.length > 32) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task names must be 6 to 32 characters.')),
      );
      return;
    }

    try {
      await widget.database
          .into(widget.database.todoItems)
          .insert(
            TodoItemsCompanion.insert(
              title: title,
              content: '',
              createdAt: Value(DateTime.now()),
            ),
          );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not save this task.')),
      );
      return;
    }

    _titleController.clear();
    await _showCatFact();
  }

  Future<void> _setTaskCompleted(TodoItem task, bool completed) async {
    try {
      await widget.database
          .update(widget.database.todoItems)
          .replace(task.copyWith(isCompleted: completed));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not update this task.')),
      );
      return;
    }

    await _showCatFact();
  }

  Future<void> _showCatFact() async {
    try {
      final fact = await widget.database.fetchAndSaveCatFact();
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Cat fact: $fact')));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task saved, but could not load a cat fact.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TodoItem>>(
      stream: widget.database.select(widget.database.todoItems).watch(),
      builder: (context, snapshot) {
        final tasks = snapshot.data;
        final completedCount =
            tasks?.where((task) => task.isCompleted).length ?? 0;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your day, in order.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF25382F),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  tasks == null
                      ? 'Loading your tasks'
                      : '${tasks.length - completedCount} to do  ·  $completedCount done',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF68756D),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.done,
                        maxLength: 32,
                        onSubmitted: (_) => _addTask(),
                        decoration: InputDecoration(
                          hintText: 'Add a task (6-32 characters)',
                          counterText: '',
                          prefixIcon: const Icon(Icons.edit_outlined),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFDCE3DD),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFDCE3DD),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFF39745B),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 54,
                      width: 54,
                      child: IconButton.filled(
                        tooltip: 'Add task',
                        onPressed: _addTask,
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'TASKS',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: const Color(0xFF68756D),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(child: _buildTaskList(snapshot, tasks)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTaskList(
    AsyncSnapshot<List<TodoItem>> snapshot,
    List<TodoItem>? tasks,
  ) {
    if (snapshot.hasError) {
      return const Center(child: Text('Could not load tasks.'));
    }
    if (tasks == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (tasks.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.checklist, size: 42, color: Color(0xFF85958A)),
            SizedBox(height: 10),
            Text('No tasks yet'),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 4),
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              if (value != null) _setTaskCompleted(task, value);
            },
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              color: task.isCompleted ? const Color(0xFF87918A) : null,
            ),
          ),
          subtitle: task.content.isEmpty ? null : Text(task.content),
        );
      },
    );
  }
}
