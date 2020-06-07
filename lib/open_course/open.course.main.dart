import 'package:flutter/material.dart';
import 'package:hgt/home.dart';
import 'package:hgt/schedule/my_course.dart';
import 'package:hgt/open_course/open.course.body.dart';
import 'package:hgt/review/review.main.dart';

class OpenCourseMainPage extends StatelessWidget {
  final String name, semester, studentID, major;
  OpenCourseMainPage(this.name, this.semester, this.studentID, this.major);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('개설 시간표 조회'),
        centerTitle: true,
      ),
      body: OpenCourseBodyPage(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: <Widget>[
                    /// TODO:: Login System
                    /// TODO:: (May not be implemented in this course)
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/profile.jpg'),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(name,
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home, color: Colors.black,),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(
                                  name: name, semester: semester,
                                  studentID: studentID, major: major
                              )));
                }
            ),
            ListTile(
                title: Text("My Schedule"),
                leading: Image.asset('asset/calendar.jpg',
                  width: 25, height: 25),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyCoursePage(name, semester, studentID, major)));
                }
            ),
            ListTile(
                title: Text("Review"),
                leading: Image.asset('asset/review.png',
                  width: 25, height: 25),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ReviewMainPage(name, semester, studentID, major)));
                }
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}