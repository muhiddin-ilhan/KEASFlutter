import 'package:flutter/material.dart';
import 'package:nestle_app/core/base/state/base_state.dart';

class ItemAddDialogItemCard extends StatefulWidget {
  const ItemAddDialogItemCard({Key? key}) : super(key: key);

  @override
  _ItemAddDialogItemCardState createState() => _ItemAddDialogItemCardState();
}

class _ItemAddDialogItemCardState extends BaseState<ItemAddDialogItemCard> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dynamicHeight(0.005)),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: EdgeInsets.symmetric(
              vertical: dynamicHeight(0.005), horizontal: dynamicWidth(0.03)),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  "Erikli",
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              Expanded(
                  flex: 10,
                  child: Text(
                    "Erikli 330 Ml 12 Li",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
              Expanded(
                flex: 3,
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.remove_circle_outline)),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: dynamicHeight(0.05),
                  child: TextFormField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    enabled: false,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.add_circle_outline)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
