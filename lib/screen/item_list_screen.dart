import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:techworld/screen/item_description.dart';
import 'package:techworld/widgets/item_widget.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late Map mapResponse;
  late List listOfData;
  List<String> itemImage = [
    "https://pngfile.net/public/uploads/preview/ladies-brown-bag-png-free-download-21566926472twrcoo00kw.png",
    "https://www.pngarts.com/files/4/Dior-Bag-PNG-Download-Image.png",
    "https://www.sportiela.com/wp-content/uploads/PINK_38f85483-6cb6-4aa0-8879-292d29cac06e_grande.png",
    "https://vignette3.wikia.nocookie.net/dayz-standalone/images/6/69/Taloon_backpack_orange.png/revision/latest?cb=20140105022002",
    "https://th.bing.com/th/id/R.e120b0df6215fb1b217d2f0679627619?rik=uw9L8EZGaupxBw&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f15%2fShoulder-Black-Handbag-Leather-PNG.png&ehk=CcmG0MmKW3FKfk97QHvK2XtvKhLSvdQN6ZtRuElylgE%3d&risl=&pid=ImgRaw&r=0",
    "https://www.freepngimg.com/thumb/chanel/75707-tote-leather-laptop-bag-black-handbag-chanel.png",
    "https://www.freepngimg.com/thumb/chanel/67498-fashion-leather-bag-black-handbag-chanel.png",
    "https://purepng.com/public/uploads/medium/purepng.com-blue-backpack-transparentbagbackpacksbacksackblueclipart-1421526273717ityio.png",
    "https://i.pinimg.com/originals/16/ae/53/16ae53092c04a2b74568106d24f61ddd.png",
    "https://i.pinimg.com/originals/55/90/f8/5590f81c88cc0ef5dad6989e04fe3ddd.png"
  ];
  List<Color> boxColor = [
    Colors.brown.shade300,
    Colors.grey.shade300,
    Colors.pink.shade50,
    Colors.orange.shade200,
    Colors.black38,
    Colors.black45,
    Colors.blue.shade50,
    Colors.blueAccent,
    Colors.brown.shade300,
    Colors.blue.shade300
  ];

  Future fetchData() async {
    http.Response response;
    response = await http
        .get(Uri.parse("http://174.138.121.52:3009/v1/product/getAllProduct"));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        listOfData = mapResponse["data"];
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.grey,
          size: 35,
        ),
        actions: [
          Icon(
            Icons.search_sharp,
            color: Colors.grey,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 10),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
              size: 35,
            ),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 9 / 12, crossAxisCount: 2),
        itemCount: listOfData.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemWidget(
              colur: boxColor[index],
              getDescription: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDescription(
                            itemDescriptionImage: itemImage[index],
                            itemDescriptionName: listOfData[index]["name"],
                            itemDescriptionRate: listOfData[index]["price"],
                            itemDescriptionDetail: listOfData[index]
                                ["description"],
                            itemBrand: listOfData[index]["brand"],
                            colur: boxColor[index],
                          )),
                );
              },
              itemName: listOfData[index]["name"].toString(),
              itemImage: itemImage[index],
              itemPrice: listOfData[index]["price"]);
        },
      ),
    );
  }
}

// Column(crossAxisAlignment: CrossAxisAlignment.start,
// children: [Padding(
// padding: const EdgeInsets.only(left: 20.0,bottom: 10),
// child: Text("Women",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
// ),
// Container(
// child: mapResponse == null
// ? Container()
//     : MyGridView()
// ),
// ],
// )
