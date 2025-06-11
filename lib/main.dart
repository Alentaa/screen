import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: AttendanceScreen(), debugShowCheckedModeBanner: false),
  );
}

class AttendanceScreen extends StatefulWidget {
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Header
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade800, Colors.green],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('asset/profile.jpeg'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hemant Rangarajan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Full-stack Developer",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),

                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: const Color.fromARGB(255, 239, 239, 240),
                  ),
                  onPressed: () {
                    // Handle notification tap
                  },
                ),

                SizedBox(width: 10),

                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi99uqUK8FwWSrGdEfRnU8vfQrJXoYHRZKOQ&s',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Check-in card
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "“Good Morning,\nHemant Rangarajan”",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Text(
                  "You haven't Checked-in yet",
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.login),
                      label: Text("Check in"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.logout),
                      label: Text("Check out"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Overview
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _overviewCard("20", "Presence", Colors.green),
                _overviewCard("03", "Absence", Colors.red),
                _overviewCard("02", "Leaves", Colors.orange),
              ],
            ),
          ),

          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Dashboard",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(16),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _dashboardItem(
                  Icons.calendar_today,
                  "Attendance",
                  Colors.green.shade100,
                ),
                _dashboardItem(Icons.logout, "Leaves", Colors.orange.shade100),
                _dashboardItem(
                  Icons.pending_actions,
                  "Leave Status",
                  Colors.purple.shade100,
                ),
                _dashboardItem(
                  Icons.holiday_village,
                  "Holiday List",
                  Colors.blue.shade100,
                ),
                _dashboardItem(
                  Icons.receipt_long,
                  "Payslip",
                  Colors.teal.shade100,
                ),
                _dashboardItem(Icons.bar_chart, "Reports", Colors.red.shade100),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Leave"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _overviewCard(String count, String label, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  Widget _dashboardItem(IconData icon, String label, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30),
            SizedBox(height: 5),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
