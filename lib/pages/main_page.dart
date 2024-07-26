import 'package:flutter/material.dart';
import 'package:zc_dodiddone/screens/all_tasks.dart';
import 'package:zc_dodiddone/theme/theme.dart';
import 'package:zc_dodiddone/screens/profile.dart'; // Import profile_page
import 'package:intl/intl.dart'; // Import intl for date formatting

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  DateTime? _selectedDeadline; // Variable to store the selected deadline

  static const List<Widget> _widgetOptions = <Widget>[
    TaskPage(),
    Text('Задачи'),
    Text('Сегодня'),
    // Заменяем Text на ProfilePage
    ProfilePage(),
    Text('Выполнено'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Функция для показа диалогового окна
  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить задачу'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Название задачи',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Описание',
                ),
              ),
              const SizedBox(height: 16),
              // Виджет выбора даты и времени
              ElevatedButton(
                onPressed: () {
                  // Show the date and time picker
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  ).then((pickedDate) {
                    if (pickedDate != null) {
                      // Show the time picker after selecting the date
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((pickedTime) {
                        if (pickedTime != null) {
                          setState(() {
                            _selectedDeadline = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          });
                        }
                      });
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CEB8B), // Green color for the button
                ),
                child: Row(
                  children: [
                    const Text('Дедлайн: '), // Add "Дедлайн: " text
                    const SizedBox(width: 8), // Add spacing
                    Text(
                      _selectedDeadline != null
                          ? DateFormat('dd.MM.yyyy HH:mm').format(_selectedDeadline!)
                          : '', // Empty string if no deadline is selected
                      style: const TextStyle(color: Colors.white), // Set text color to white
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                // Обработка добавления задачи
                // Например, можно добавить задачу в список задач
                print('Задача добавлена!');
                Navigator.of(context).pop();
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'DoDidDone',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Добавляем Container с градиентом
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Меняем цвета местами
            colors: [
              DoDidDoneTheme.lightTheme.colorScheme.secondary,
              DoDidDoneTheme.lightTheme.colorScheme.primary,
            ],
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: DoDidDoneTheme.lightTheme.colorScheme.primary,
        unselectedItemColor: DoDidDoneTheme.lightTheme.colorScheme.secondary,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
