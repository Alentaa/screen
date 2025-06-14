import 'package:flutter/material.dart';
import 'package:screenui/view/checkin.dart';
import 'package:screenui/view/dashboardgird.dart';
import 'package:screenui/view/header.dart';
import 'package:screenui/view/overview.dart';
import 'package:screenui/view/task_section.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              HeaderWidget(),
              SizedBox(height: 40),
              Text(
                "Good Morning,\nHemant Rangarajan",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 12),
              Checkin(),
              SizedBox(height: 24),
              Text(
                'Overview',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              OverviewRow(),
              SizedBox(height: 28),
              TaskSection(),
              Divider(thickness: 1,),
              SizedBox(height: 24),
              Text(
                'Dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              DashboardGrid(),
            ],
          ),
        ),
      ),
    );
  }
}