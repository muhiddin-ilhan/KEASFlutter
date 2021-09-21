import 'package:flutter/material.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/localization/app_localization.dart';

class OrderItemCard extends StatefulWidget {
  final String? itemBrand;
  final String? itemTitle;
  final String? itemCount;
  final String? itemPrice;

  const OrderItemCard({Key? key, this.itemBrand, this.itemTitle, this.itemCount, this.itemPrice}) : super(key: key);

  @override
  _OrderItemCardState createState() => _OrderItemCardState();
}

class _OrderItemCardState extends BaseState<OrderItemCard> {
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
                Expanded(
                  flex: 10,
                  child: Text(
                    widget.itemBrand ?? "-",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 10,
                  child: Text(widget.itemTitle ?? "-"),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 6,
                  child: Text((widget.itemCount ?? "-") + " " + AppLocalizations.getString("piece")),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 6,
                  child: Text((widget.itemPrice ?? "-") + " ₺"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
