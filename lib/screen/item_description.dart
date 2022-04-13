import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ItemDescription extends StatefulWidget {
  late final String itemDescriptionImage;
  late final String itemDescriptionName;
  late final String itemDescriptionRate;
  late final String itemDescriptionDetail;
  late final String itemBrand;
  Color colur;

  ItemDescription(
      {required this.itemDescriptionImage,
      required this.itemDescriptionName,
      required this.itemDescriptionRate,
      required this.itemDescriptionDetail,
      required this.itemBrand,
      required this.colur});

  @override
  State<ItemDescription> createState() => _ItemDescriptionState(
      itemDescriptionImage,
      itemDescriptionName,
      itemDescriptionRate,
      itemDescriptionDetail,
      itemBrand,
      colur);
}

class _ItemDescriptionState extends State<ItemDescription> {
  late final String itemDescriptionImage;
  late final String itemDescriptionName;
  late final String itemDescriptionRate;
  late final String itemDescriptionDetail;
  late final String itemBrand;
  Color colur;

  _ItemDescriptionState(
      this.itemDescriptionImage,
      this.itemDescriptionName,
      this.itemDescriptionRate,
      this.itemDescriptionDetail,
      this.itemBrand,
      this.colur);

  int _counter = 1;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  void decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colur,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            )),
        actions: [
          Icon(
            Icons.search_sharp,
            color: Colors.white,
            size: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 10),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: width,
                height: height,
                color: colur,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: height * .55,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
              )),
          Positioned(
              top: height * .14,
              right: 20,
              child: SizedBox(
                  width: width * .5,
                  height: height * .26,
                  child: Image(
                    image: NetworkImage(itemDescriptionImage),
                  ))),
          Positioned(
              top: 2,
              left: 20,
              child: Text(
                itemDescriptionName,
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
          Positioned(
              top: 24,
              left: 20,
              child: Text(
                itemBrand,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              )),
          Positioned(
              top: height * .25,
              left: 20,
              child: Text("Price",
                  style: TextStyle(color: Colors.white, fontSize: 12))),
          Positioned(
              top: height * .265,
              left: 20,
              child: Row(
                children: [
                  Text(
                    new String.fromCharCodes(new Runes('\u0024')),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  Text(itemDescriptionRate,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              )),
          Positioned(
              bottom: 35,
              right: 20,
              child: Container(
                child: Center(
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                width: width * .7,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: colur),
              )),
          Positioned(
              bottom: 35,
              left: 20,
              child: Container(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: colur,
                  size: 30,
                ),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: colur, width: 1)),
              )),
          Positioned(
              bottom: 120,
              left: 20,
              right: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              decrement();
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.grey,
                            ))),
                    width: 45,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey, width: 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Text(
                      "$_counter",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    child: IconButton(
                        onPressed: () {
                          increment();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.grey,
                          size: 20,
                        )),
                    width: 45,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey, width: 1)),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: Colors.orangeAccent,
                  )
                ],
              )),
          Positioned(
            top: height * .5,
            left: 20,
            child: SizedBox(
              width: width * .9,
              height: 200,
              child: Text(
                itemDescriptionDetail,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
