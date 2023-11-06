import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onpress;

  HomeWidget({required this.title, required this.onpress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,


      child: Container(
        height: 180,
        width: 450,
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF283593),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 64.0, color: Colors.white),
              SizedBox(height: 10.0),
              TextWidget(
                title:title,
                fontSize: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
