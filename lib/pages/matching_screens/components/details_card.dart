import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String rollNo;
  final String phoneNumber;
  final String deptName;
  final String gameName;
  final String semester;

  StudentCard({
    required this.name,
    required this.rollNo,
    required this.phoneNumber,
    required this.deptName,
    required this.gameName,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            Text('Phone Number: $phoneNumber',style: TextStyle(fontSize: 20)),
            Text('Roll No: $rollNo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            Text('Department: $deptName',style: TextStyle(fontSize: 20)),
            Text('Semester: $semester',style: TextStyle(fontSize: 20)),
            Text('Game: $gameName',style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}