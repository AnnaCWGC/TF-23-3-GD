import 'package:flutter/material.dart';

import '../app_style.dart';

enum CButtonType { PRIMARY, PRIMARY_DISABLED, OUTLINE, OUTLINE_DISABLED }

class CButton extends StatelessWidget {
  final String label;
  final double height;
  final double width;
  final CButtonType type;
  final void Function() onTap;

  const CButton({
    Key? key,
    this.label = '',
    this.height = 55,
    this.width = double.maxFinite,
    this.type = CButtonType.PRIMARY,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (this.type) {
      case CButtonType.PRIMARY:
        return buttonPrimary();
      case CButtonType.PRIMARY_DISABLED:
        return buttonPrimaryDisable();
      case CButtonType.OUTLINE:
        return buttonOutline();
      case CButtonType.OUTLINE_DISABLED:
        return buttonOutlineDisable();
      default:
        return Container();
    }
  }

  Widget buttonPrimary() {
    return buttonTemplate(
      colorBackground: AppStyleColor.colorPrimary,
      colorBorder: Colors.transparent,
      colorText: AppStyleColor.colorBackground,
    );
  }

  Widget buttonPrimaryDisable() {
    return buttonTemplate(
      colorBackground: AppStyleColor.colorDisable!,
      colorBorder: Colors.transparent,
      colorText: AppStyleColor.colorBackground.withOpacity(0.5),
    );
  }

  Widget buttonOutline() {
    return buttonTemplate(
      colorBackground: Colors.transparent,
      colorBorder: AppStyleColor.colorPrimary,
      colorText: AppStyleColor.colorPrimary,
    );
  }

  Widget buttonOutlineDisable() {
    return buttonTemplate(
      colorBackground: Colors.transparent,
      colorBorder: AppStyleColor.colorDisable!,
      colorText: Colors.black.withOpacity(0.50),
    );
  }

  Widget buttonTemplate({
    required Color colorBackground,
    required Color colorBorder,
    required Color colorText,
  }) {
    return InkWell(
      onTap: [
        CButtonType.PRIMARY_DISABLED,
        CButtonType.OUTLINE_DISABLED,
      ].contains(this.type)
          ? () {}
          : this.onTap,
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          color: colorBackground,
          border: Border.all(color: colorBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Spacer(),
            Text(
              '${this.label}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppStyleFont.xmedium,
                color: colorText,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
