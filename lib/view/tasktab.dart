import 'package:flutter/material.dart';

class TaskMyTab extends StatelessWidget {
  const TaskMyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        TaskListItem(
          title: 'UI/UX Design Implementation',
          description: 'Translating design specifications into functional and visually appealing user interfaces using technologies like HTML, CSS, and JavaScript.',
        ),
        SizedBox(height: 20),
        TaskListItem(
          title: 'Responsive Design',
          description: 'Ensuring that the application adapts seamlessly to different screen sizes and devices.',
        ),
        SizedBox(height: 20),
        TaskListItem(
          title: 'Back-end Development',
          description: 'Creating and managing databases for efficient data storage, retrieval, and processing.',
        ),
      ],
    );
  }
}

class TaskListItem extends StatelessWidget {
  final String title;
  final String description;

  const TaskListItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            )),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Start"),
          ),
        ),
        const Divider(thickness: 0.5),
      ],
    );
  }
}