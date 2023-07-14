import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcp_test/services/app_style.dart';
import 'package:hcp_test/services/widgets/c_component.dart';

class CContainerInfo extends StatelessWidget {
  final String? date;
  final String? open;
  final String? high;
  final String? low;
  final String? close;
  final String? adjustedClose;
  final String? volume;
  final String? dividendAmount;
  final bool favorite;

  final void Function()? onTap;

  const CContainerInfo({
    Key? key,
    this.date = "",
    this.open = "",
    this.high = "",
    this.low = "",
    this.close = "",
    this.adjustedClose = "",
    this.volume = "",
    this.dividendAmount = "",
    this.onTap,
    this.favorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppStyleColor.colorSecondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppStyleColor.colorSecondary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.date ?? "",
                  style: TextStyle(
                    color: AppStyleColor.colorPrimary,
                  ),
                ),
                InkWell(
                  onTap: this.onTap,
                  child: this.favorite
                      ? Icon(Icons.star)
                      : Icon(Icons.star_border_outlined),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            CComponent(
              title: "Open:",
              value: this.open,
            ),
            CComponent(
              title: "High:",
              value: this.high,
            ),
            CComponent(
              title: "Low:",
              value: this.low,
            ),
            CComponent(
              title: "Close:",
              value: this.close,
            ),
            Visibility(
              visible: this.adjustedClose != "",
              child: CComponent(
                title: "Adjusted Close: ",
                value: this.adjustedClose,
              ),
            ),
            CComponent(
              title: "Volume: ",
              value: this.volume,
            ),
            Visibility(
              visible: this.dividendAmount != "",
              child: CComponent(
                title: "Dividend Amount: ",
                value: this.dividendAmount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
