import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskTrackerTab extends StatelessWidget {
  const TaskTrackerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Task Tracker Summary",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            TaskTrackerCard(
              title: "Responsive Design",
              progress: 0.45,
              status: "In Progress",
              deadline: "18-06-2025",
              daysRemaining: 2,
              priority: "Medium",
            ),
            Divider(height: 32),
            TaskTrackerCard(
              title: "UI/UX Design Implementation",
              progress: 0.69,
              status: "Completed",
              deadline: "18-06-2025",
              daysRemaining: 2,
              priority: "High",
            ),
            Divider(height: 32),
            TaskTrackerCard(
              title: "Back-end Development",
              progress: 0.75,
              status: "In Progress",
              deadline: "18-06-2025",
              daysRemaining: 2,
              priority: "Low",
            ),
          ],
        ),
      ),
    );
  }
}

class TaskTrackerCard extends StatelessWidget {
  final String title;
  final double progress;
  final String status;
  final String deadline;
  final int daysRemaining;
  final String priority;

  const TaskTrackerCard({
    super.key,
    required this.title,
    required this.progress,
    required this.status,
    required this.deadline,
    required this.daysRemaining,
    required this.priority,
  });

  Color getStatusColor() {
    switch (status.toLowerCase()) {
      case 'not started':
        return Colors.grey;
      case 'in progress':
        return Colors.green;
      case 'completed':
        return Colors.black;
      case 'overdue':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Text(
              "Due Date: $deadline",
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Status
        Row(
          children: [
            const Text("Status: "),
            _statusDot(getStatusColor()),
            const SizedBox(width: 6),
            Text(status, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 12),

        // Progress + Days Remaining + Assigned By
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Progress with Percent Indicator
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 5.0,
              percent: progress,
              center: Text(
                "${(progress * 100).toInt()}%",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              progressColor: progress >= 0.7 ? Colors.green : Colors.orange,
              backgroundColor: Colors.grey.shade300,
            ),
            const SizedBox(width: 16),

            // Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.orange,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "$daysRemaining days remaining",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Row(
                    children: [
                      Icon(
                        Icons.assignment_ind,
                        size: 16,
                        color: Colors.black45,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Assigned By (optional)",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Priority Section
        Row(
          children: [
            const Text("Priority: "),
            _priorityChip("Low", priority == "Low"),
            _priorityChip("Medium", priority == "Medium"),
            _priorityChip("High", priority == "High"),
          ],
        ),
        const SizedBox(height: 12),

        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _plainButton("Start", Colors.black),
            const SizedBox(width: 8),
            _plainButton("Update", Colors.green),
            const SizedBox(width: 8),
            _filledButton("Complete", Colors.green),
          ],
        ),
      ],
    );
  }

  Widget _statusDot(Color color) {
    return Icon(Icons.circle, size: 10, color: color);
  }

  Widget _priorityChip(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.green.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? Colors.black : Colors.black54,
        ),
      ),
    );
  }

  Widget _plainButton(String label, Color borderColor) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: borderColor,
        side: BorderSide(color: borderColor),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(fontSize: 13),
      ),
      child: Text(label),
    );
  }

  Widget _filledButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(fontSize: 13),
      ),
      child: Text(label),
    );
  }
}
