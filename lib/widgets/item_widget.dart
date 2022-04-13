import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  late final String itemName;
  late final String itemPrice;
  late final String itemImage;
  Function getDescription;
  Color colur;

  ItemWidget(
      {required this.itemName,
      required this.itemImage,
      required this.itemPrice,
      required this.getDescription,
      required this.colur});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
        child: Container(
      height: height * .32,
      width: width * .46,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              getDescription();
            },
            child: Container(
              height: height * .23,
              width: width * .45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: colur),
              child: Center(
                  child: SizedBox(
                      width: width * .4,
                      height: height * .2,
                      child: Image(image: NetworkImage(itemImage)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4, bottom: 2),
            child: Text(
              itemName,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  new String.fromCharCodes(new Runes('\u0024')),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  itemPrice,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
