import 'package:flutter/material.dart';

class OngoingPendingTab extends StatelessWidget {
  const OngoingPendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TaskCard(
              title: "UI/UX Design Implementation",
              status: "Ongoing Task",
              statusColor: Colors.blue,
              priority: "High",
              priorityColor: Colors.red,
              progress: 0.8,
              actionText: "Make as Done",
            ),
            Divider(height: 32),
            TaskCard(
              title: "Responsive Design",
              status: "Pending Task",
              statusColor: Colors.orange,
              priority: "Medium",
              priorityColor: Colors.orange,
              progress: 0.45,
              actionText: "Start task",
            ),
            Divider(height: 32),
            TaskCard(
              title: "Back-end Development",
              status: "Ongoing Task",
              statusColor: Colors.blue,
              priority: "Low",
              priorityColor: Colors.green,
              progress: 0.75,
              actionText: "In Progress",
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final String priority;
  final Color priorityColor;
  final double progress;
  final String actionText;

  const TaskCard({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.priority,
    required this.priorityColor,
    required this.progress,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ),
            Text(
              "${(progress * 100).round()}% Done",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: "Status: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text("Assigned date: 12-05-2025"),
        const Text("Due date: 12-06-2025"),
        const SizedBox(height: 4),
        Text.rich(
          TextSpan(
            text: "Priority ",
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: priority,
                style: TextStyle(
                  color: priorityColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2196F3),
              ),
              child: Text(actionText),
            ),
          ],
        ),
      ],
    );
  }
}
