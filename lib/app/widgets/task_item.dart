import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime deadline;

  const TaskItem({
    Key? key,
    required this.title,
    required this.description,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient for the title
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            decoration: BoxDecoration(
              gradient: getGradientForDeadline(deadline),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for better contrast
                    ),
                  ),
                ),
                // Row with buttons
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8), // Reduced vertical padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the end
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle Edit button press
                          print('Edit button press');
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      const SizedBox(width: 8), // Add spacing between buttons
                      IconButton(
                        onPressed: () {
                          // Handle Delete button press
                          print('Delete button pressed');
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red, // Red color for delete button
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  'Дедлайн: ${DateFormat('dd.MM.yy HH:mm').format(deadline)}', // Format the deadline
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Function to get the gradient based on deadline
  LinearGradient getGradientForDeadline(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now).inDays;

    if (difference <= 2) {
      return const LinearGradient(
        colors: [Colors.red, Colors.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else if (difference <= 3) {
      return const LinearGradient(
        colors: [Colors.yellow, Colors.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else {
      return const LinearGradient(
        colors: [Colors.green, Colors.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    }
  }
}
