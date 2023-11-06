import 'package:e_gamming_matcher/component/style/colors.dart';
import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final Color color, textcolor, borderColor;
  final VoidCallback onPress;
  final bool loading;

  const RoundButton(
      {super.key,
        required this.title,
        required this.onPress,
        this.textcolor = Colors.white,
        this.borderColor = Colors.white,
        this.color = Colors.green,
        this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.iconColor,
              ),
              child: loading
                  ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                  : Center(
                child: TextWidget(
                  title: title,
                  textColor: AppColors.textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
