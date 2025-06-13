import 'package:flutter/material.dart';

class Mytasks extends StatefulWidget {
  const Mytasks({super.key});

  @override
  State<Mytasks> createState() => _MytasksState();
}

class _MytasksState extends State<Mytasks> {
  int selectedTab = 0;
  String sortBy = "Deadline";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tab Selector
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _taskTab("My Tasks", 0),
              SizedBox(width: 8),
              _taskTab("Task Tracker", 1),
              SizedBox(width: 8),
              _taskTab("Ongoing & Pending", 2),
              SizedBox(width: 8),
              _taskTab("Work Summary", 3),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Scrollable Content Area
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._getTaskList(),
                const SizedBox(height: 20),
                if (selectedTab == 3) _buildWorkSummary(),
                const SizedBox(height: 20),
                // _buildSortOptions(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _taskTab(String label, int index) {
    final bool selected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.indigo : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  List<Widget> _getTaskList() {
    switch (selectedTab) {
      case 0:
        return const [
          TaskItem(
            title: "UI/UX Design implementation",
            description:
                "Translating design specifications into functional and visually appealing user interfaces using technologies like HTML, CSS, and JavaScript",
          ),
          TaskItem(
            title: "Responsive Design",
            description:
                "Ensuring that the application adapts seamlessly to different screen sizes and devices",
          ),
          TaskItem(
            title: "Back-end Development",
            description:
                "Creating and managing databases for efficient data storage, retrieval, and processing.",
          ),
          TaskItem(
            title: "Server-side Logic",
            description:
                "Developing and maintaining the logic that runs on the server, handling user requests, processing data, and interacting with databases",
          ),
        ];
      case 1:
        return const [
          TaskItem(
            title: "Responsive Design",
            description: "Progress: 45% • 2 days remaining",
            // icon: Icons.design_services, // or Icons.web for design-related task
          ),
          TaskItem(
            title: "UI/UX Design Implementation",
            description: "Progress: 60% • 2 days remaining",
            // icon: Icons.palette_outlined, // or Icons.brush_outlined
          ),
          TaskItem(
            title: "Back-end Development",
            description: "Progress: 70% • 2 days remaining",
            // icon: Icons.code_outlined, // or Icons.storage for backend
          ),
        ];
      case 2:
        return const [
          TaskItem(title: "UI/UX Design Implementation", description:  "Status: Ongoing Task \n• Start date: 12-06-2025 \n• Expected completion: 12-06-2025"),
           TaskItem(title: "Responsive Design", description:  " Status : Pending Task \n• Start date: 12-06-2025 \n• Expected completion: 12-06-2025"),
          TaskItem(title: "Back-end Development", description: "Status : Pending Task \n• Start date: 12-06-2025 \n• Expected completion: 12-06-2025"),
        ];
      default:
        return [];
    }
  }

  Widget _buildWorkSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Work Summary",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Icon(Icons.calendar_month),Text(" Total working Days 20 "),
        Text("🕒 12 hours tracked"),
        Text("📅 3 deadlines this week"),
      ],
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String description;

  const TaskItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
