import 'package:flutter/material.dart';
import 'package:zc_dodiddone/app/widgets/task_item.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final List<String> tasks = [
    'Купить продукты',
    'Записаться на прием к врачу',
    'Позвонить другу',
    'Сделать уборку',
    'Прочитать книгу',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          title: tasks[index],
          description: 'Описание задачи',
          deadline: DateTime.now(), // You can replace this with your actual deadline
        );
      },
    );
  }
}
