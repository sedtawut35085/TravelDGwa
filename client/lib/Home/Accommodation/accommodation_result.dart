import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class AccommodationResult extends StatefulWidget {

  final nameHolder;
  final checkInHolder;
  final checkOutHolder;
  final numberOfPeopleHolder;
  final numberOfRoomsHolder;

  const AccommodationResult({
    Key key,
    @required this.nameHolder,
    this.checkInHolder,
    this.checkOutHolder,
    this.numberOfPeopleHolder,
    this.numberOfRoomsHolder
  }) : super(key: key);

  @override
  State<AccommodationResult> createState() => _AccommodationResultState();
}

class _AccommodationResultState extends State<AccommodationResult> {

  var nameEdit = TextEditingController();
  var checkInEdit = TextEditingController();
  var checkOutEdit = TextEditingController();
  var numberOfPeopleEdit = TextEditingController();
  var numberOfRoomsEdit = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameEdit = TextEditingController(text: widget.nameHolder);
    checkInEdit = TextEditingController(text: widget.checkInHolder);
    checkOutEdit = TextEditingController(text: widget.checkOutHolder);
    numberOfPeopleEdit = TextEditingController(text: widget.numberOfPeopleHolder);
    numberOfRoomsEdit = TextEditingController(text: widget.numberOfRoomsHolder);
  }

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4DC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff1D3557),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Color(0xffECFAFF)),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nameEdit.text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
              IconButton(
                icon: const Icon(
                  Boxicons.bxs_edit_alt,
                  color: Colors.white,
                ),
                onPressed: () {
                  openEditNameDialog(context);
                },
              ),
            ],
          ),

          flexibleSpace: const SizedBox(
            height: 20,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => {
                        openEditCheckInDialog(context)
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        color: const Color(0xff1D3557),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.login_rounded, color: Color(0xffFFF4DC)),
                              const SizedBox(width: 10),
                              Text(
                                checkInEdit.text,
                                style: const TextStyle(
                                  color: Color(0xffFFF4DC),
                                  fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        openEditCheckOutDialog(context)
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        color: const Color(0xff1D3557),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.login_rounded, color: Color(0xffFFF4DC)),
                              const SizedBox(width: 10),
                              Text(
                                checkOutEdit.text,
                                style: const TextStyle(
                                    color: Color(0xffFFF4DC),
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        showMaterialNumberPicker(
                          context: context,
                          title: "จำนวนผู้เข้าพัก",
                          maxNumber: 30,
                          minNumber: 1,
                          selectedNumber: int.parse(numberOfPeopleEdit.text),
                          onChanged: (value) => setState(() => numberOfPeopleEdit.text = value.toString()),
                        )
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        color: const Color(0xff1D3557),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.people_alt_rounded, color: Color(0xffFFF4DC)),
                              const SizedBox(width: 10),
                              Text(
                                numberOfPeopleEdit.text + ' คน',
                                style: const TextStyle(
                                    color: Color(0xffFFF4DC),
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        showMaterialNumberPicker(
                          context: context,
                          title: "จำนวนห้อง",
                          maxNumber: 30,
                          minNumber: 1,
                          selectedNumber: int.parse(numberOfRoomsEdit.text),
                          onChanged: (value) => setState(() => numberOfRoomsEdit.text = value.toString()),
                        )
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        color: const Color(0xff1D3557),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.meeting_room_rounded, color: Color(0xffFFF4DC)),
                              const SizedBox(width: 10),
                              Text(
                                numberOfRoomsEdit.text + ' ห้อง',
                                style: const TextStyle(
                                    color: Color(0xffFFF4DC),
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1.5,
                indent: 20,
                endIndent: 20,
                color: Color(0xff827E7E),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => {

                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xff1D3557),
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            color: const Color(0xffECFAFF),
                            child: Container(
                              width: 200,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(Icons.filter_alt_rounded, color: Color(0xff1D3557)),
                                  SizedBox(width: 5),
                                  Text(
                                    'ตัวกรอง  ',
                                    style: TextStyle(
                                        color: Color(0xff1D3557),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    '(3 ผลลัพธ์)',
                                    style: TextStyle(
                                        color: Color(0xff827E7E),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {

                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xff1D3557),
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            color: const Color(0xffECFAFF),
                            child: Container(
                              width: 150,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(Icons.sort_rounded, color: Color(0xff1D3557)),
                                  SizedBox(width: 5),
                                  Text(
                                    'ราคาต่ำ - สูง',
                                    style: TextStyle(
                                        color: Color(0xff1D3557),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => {

                      },
                      child: GFCard(
                        color: const Color(0xff1D3557),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.zero,
                        showImage: true,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                                alignment: Alignment.bottomRight,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                        child: Image.network(
                                          'https://placeimg.com/640/480/any',
                                          height: 200,
                                          width: MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        height: 30,
                                        color: Colors.transparent,
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                        child: _buildRatingStars(5),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffECFAFF),
                                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                                      border: Border.all(color: const Color(0xff1D3557), width: 3)
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite_rounded,
                                        color: isFavorite ? const Color(0xffC4C4C4) : const Color(0xffE80138),
                                      ),
                                      iconSize: 30,
                                      onPressed: () => {
                                        setState(() => isFavorite = !isFavorite)
                                      },
                                    )
                                  ),
                                ]
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15, bottom: 20, left: 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Cape Dara Resort',
                                        style: TextStyle(
                                          color: Color(0xffFFF4DC),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: const <Widget>[
                                          Text(
                                            'THB ' + '1,100.00',
                                            style: TextStyle(
                                                color: Color(0xffF69B12),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                          ),
                                          Text(
                                            '2,100',
                                            style: TextStyle(
                                              color: Color(0xffFFF4DC),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              decoration: TextDecoration.lineThrough
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Icon(Icons.location_pin, color: Color(0xffFFF4DC),),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'นาจอมเทียน, พัทยา',
                                        style: TextStyle(
                                          color: Color(0xffFFF4DC),
                                          fontSize: 14
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {

                      },
                      child: GFCard(
                        color: const Color(0xff1D3557),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.zero,
                        showImage: true,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                                alignment: Alignment.bottomRight,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                        child: Image.network(
                                            'https://placeimg.com/640/480/any',
                                            height: 200,
                                            width: MediaQuery.of(context).size.width,
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        height: 30,
                                        color: Colors.transparent,
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                        child: _buildRatingStars(5),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffECFAFF),
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          border: Border.all(color: const Color(0xff1D3557), width: 3)
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.favorite_rounded,
                                          color: isFavorite ? const Color(0xffC4C4C4) : const Color(0xffE80138),
                                        ),
                                        iconSize: 30,
                                        onPressed: () => {
                                          setState(() => isFavorite = !isFavorite)
                                        },
                                      )
                                  ),
                                ]
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15, bottom: 20, left: 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Cape Dara Resort',
                                        style: TextStyle(
                                            color: Color(0xffFFF4DC),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: const <Widget>[
                                          Text(
                                            'THB ' + '1,100.00',
                                            style: TextStyle(
                                                color: Color(0xffF69B12),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                          ),
                                          Text(
                                            '2,100',
                                            style: TextStyle(
                                                color: Color(0xffFFF4DC),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                decoration: TextDecoration.lineThrough
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Icon(Icons.location_pin, color: Color(0xffFFF4DC),),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'นาจอมเทียน, พัทยา',
                                        style: TextStyle(
                                            color: Color(0xffFFF4DC),
                                            fontSize: 14
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future openEditNameDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'เลือกสถานที่',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        content: TextFormField(
          autofocus: true,
          controller: nameEdit,
        ),
        actions: [
          TextButton(
              onPressed: () => {
                setState(() {}),
                Navigator.of(context).pop()
              },
              child: const Text('ตกลง'))
        ],
      )
  );

  Future openEditCheckInDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'วันที่เช็คอิน',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        content: TextFormField(
          controller: checkInEdit,
          readOnly: true,
          decoration: const InputDecoration(
              hintText: 'วว-ดด-ปปปป',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffECFAFF))
              ),
              suffixIcon: Icon(Ionicons.calendar_outline, color: Color(0xff1D3557))
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณาระบุวันที่';
            }
            return null;
          },
          onTap: () async {
            DateTime pickedDate = await showDatePicker(
                context: context, initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101)
            );

            if(pickedDate != null ){
              print(pickedDate);
              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
              print(formattedDate);

              setState(() {
                checkInEdit.text = formattedDate;
              });
            }else {
              print("Date is not selected");
            }
          },
        ),
        actions: [
          TextButton(
              onPressed: () => {
                setState(() {}),
                Navigator.of(context).pop()
              },
              child: const Text('ตกลง'))
        ],
      )
  );

  Future openEditCheckOutDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'วันที่เช็คเอาท์',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        content: TextFormField(
          controller: checkOutEdit,
          readOnly: true,
          decoration: const InputDecoration(
              hintText: 'วว-ดด-ปปปป',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffECFAFF))
              ),
              suffixIcon: Icon(Ionicons.calendar_outline, color: Color(0xff1D3557))
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณาระบุวันที่';
            }
            return null;
          },
          onTap: () async {
            DateTime pickedDate = await showDatePicker(
                context: context, initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101)
            );

            if(pickedDate != null ){
              print(pickedDate);
              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
              print(formattedDate);

              setState(() {
                checkOutEdit.text = formattedDate;
              });
            }else {
              print("Date is not selected");
            }
          },
        ),
        actions: [
          TextButton(
              onPressed: () => {
                setState(() {}),
                Navigator.of(context).pop()
              },
              child: const Text('ตกลง'))
        ],
      )
  );
}
