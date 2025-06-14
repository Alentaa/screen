import 'package:flutter/material.dart';
import 'package:screenui/view/mytasks.dart';
import 'package:screenui/view/ongoing.dart';
import 'package:screenui/view/sortfilter.dart';
import 'package:screenui/view/taskbar.dart';
import 'package:screenui/view/tasktracker.dart';
import 'package:screenui/view/worksummary.dart';

class TaskSection extends StatefulWidget {
  const TaskSection({super.key});

  @override
  State<TaskSection> createState() => _TaskSectionState();
}

class _TaskSectionState extends State<TaskSection> {
  int selectedTabIndex = 0;
  int selectedSortIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sort By / Filter Bar
        const SizedBox(height: 12),

        // Task Tab Bar
        TaskTabBar(
          selectedIndex: selectedTabIndex,
          onTabSelected: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
        ),
        const SizedBox(height: 12),
        SortFilterBar(
          selectedSortIndex: selectedSortIndex,
          onSortSelected: (index) {
            setState(() {
              selectedSortIndex = index;
            });
          },
        ),

        SizedBox(
          height: 320,
          child: IndexedStack(
            index: selectedTabIndex,
            children: const [
              TaskMyTab(),
              TaskTrackerTab(),
              OngoingPendingTab(),
              WorkSummaryTab(),
            ],
          ),
        ),
      ],
    );
  }
}
