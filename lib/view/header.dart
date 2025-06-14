import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 78.w, 
          child: Stack(
            children: [
              Container(
                width: 74.w, 
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 6, 104, 42),
                      Colors.green,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(5.w),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                child: Row(
                  children: [
                    Container(
                      height: 6.h,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/profile.jpeg'),
                        radius: 3.h,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hemant Rangarajan",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Full-stack Developer",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 1.h,
                right: 1.w,
                child: CircleAvatar(
                  backgroundImage: AssetImage('asset/ziya academy logo.jpg'),
                  radius: 3.h,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 2.w),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 1.w),
            ],
          ),
          padding: EdgeInsets.all(1.5.w),
          child: Icon(
            Icons.notifications_sharp,
            color: Colors.blue,
            size: 6.w,
          ),
        ),
      ],
    );
  }
}
