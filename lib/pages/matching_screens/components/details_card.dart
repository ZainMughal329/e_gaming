import 'package:e_gamming_matcher/component/style/colors.dart';
import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String rollNo;
  final String phoneNumber;
  final String deptName;
  final String gameName;
  final String semester;
  VoidCallback onTap;

  StudentCard({
    required this.name,
    required this.rollNo,
    required this.phoneNumber,
    required this.deptName,
    required this.gameName,
    required this.semester,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    InkWell(
                      onTap: onTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit,color: AppColors.iconColor,),

                          TextWidget(title: "Edit",textColor: Colors.black,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
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
      ),
    );
  }
}