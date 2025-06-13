import 'package:flutter/material.dart';
import 'package:screenui/view/checkin.dart';
import 'package:screenui/view/dashboardgird.dart';
import 'package:screenui/view/header.dart';
import 'package:screenui/view/mytasks.dart';
import 'package:screenui/view/overview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You can add a custom bottom navigation bar if needed
      // bottomNavigationBar: BottomBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const SizedBox(height: 40),

              const Text(
                'Good Morning,\nHemant Rangarajan',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),

              const Checkin(),
              const SizedBox(height: 24),

              const Text(
                'Overview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              const OverviewRow(), // Use this section for compact performance summary

              const SizedBox(height: 28),
              const Text(
                'My Tasks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              const Mytasks(), // This will work if Mytasks uses only Column/ListView, not Expanded directly

              const SizedBox(height: 28),
              const Text(
                'Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              const DashboardGrid(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
