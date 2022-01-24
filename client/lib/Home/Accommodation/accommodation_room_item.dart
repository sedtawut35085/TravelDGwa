import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';

import 'accommodation_detail.dart';

class RoomItem extends StatefulWidget {
  final roomData;
  const RoomItem({Key key, @required this.roomData})
      : super(key: key);
  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  var data;

  @override
  void initState() {
    super.initState();

    data = widget.roomData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: NeverScrollableScrollPhysics()),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => {
              },
              child: GFCard(
                elevation: 8,
                color: const Color(0xff1D3557),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.zero,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(alignment: Alignment.bottomRight, children: <Widget>[
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.network('${data[index]['image']}',
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xffECFAFF),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                  color: const Color(0xff1D3557), width: 3)),
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite_rounded,
                              color:
                              // data.isFavorite
                              // ? Color(0xffE80138)
                              Color(0xffC4C4C4),
                            ),
                            iconSize: 30,
                            onPressed: () => {
                              // setState(() => data.isFavorite = !data.isFavorite)
                            },
                          )),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15, bottom: 15, left: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  data[index]['name'],
                                  style: const TextStyle(
                                      color: Color(0xffFFF4DC),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.32,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'THB ' + '${data[index]['price']}',
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          color: Color(0xffF69B12),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const Text(
                                      '2,000.00',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xffFFF4DC),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          decoration:
                                          TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Icon(
                                Icons.location_pin,
                                color: Color(0xffFFF4DC),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                data[index]['location'],
                                style: const TextStyle(
                                    color: Color(0xffFFF4DC), fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
