import 'package:flutter/material.dart';
import 'package:hcp_test/services/app_style.dart';

class CComponent extends StatelessWidget {
  final String? title;
  final String? value;

  const CComponent({
    Key? key,
    this.title = "",
    this.value = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          this.title ?? "",
          style: TextStyle(
            color: AppStyleColor.colorPrimary,
          ),
        ),
        Text(
          this.value ?? "",
          style: TextStyle(
            color: AppStyleColor.colorPrimary,
          ),
        ),
      ],
    );
  }
}
