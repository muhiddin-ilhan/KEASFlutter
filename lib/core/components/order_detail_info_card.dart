import 'package:flutter/material.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/localization/app_localization.dart';

class OrderDetailInfoCard extends StatefulWidget {
  final IconData prefixIcon;
  final String title;
  final String? midText;
  final String? endText;
  final Widget? endWidget;

  const OrderDetailInfoCard({Key? key, required this.prefixIcon, required this.title, this.midText, this.endText, this.endWidget}) : super(key: key);

  @override
  _OrderDetailInfoCardState createState() => _OrderDetailInfoCardState();
}

class _OrderDetailInfoCardState extends BaseState<OrderDetailInfoCard> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(dynamicWidth(0.04)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      widget.prefixIcon,
                      size: 18,
                    ),
                    SizedBox(
                      width: dynamicWidth(0.01),
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (widget.midText != null) Text(widget.midText ?? ""),
                if (widget.endWidget != null) widget.endWidget!,
                if (widget.endText != null) Text(widget.endText ?? ""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
