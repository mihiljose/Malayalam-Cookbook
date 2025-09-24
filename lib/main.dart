import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'recipepage.dart';

/*const String testDevice = '';

String appId = "ca-app-pub-9815982880222619~9585398795";
String adUnitId = "ca-app-pub-9815982880222619/5112689367";*/



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return new BannerAd(
        adUnitId: adUnitId,
        size: AdSize.banner,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Banned Event: $event");
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: appId);
    _bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bannerAd?.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //drawer: myDrawer(),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                color: Colors.green,
              ),
              Positioned(
                  top: 70.0,
                  right: 0.0,
                  child: Image.asset(
                    'assets/art.png',
                    height: 300.0,
                    width: 140.0,
                  )),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            contentPadding:
                                EdgeInsets.only(left: 15.0, top: 15.0),
                            hintText: 'പാചകക്കുറിപ്പുകൾക്കായി തിരയുക',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.orange,
                                  style: BorderStyle.solid,
                                  width: 3.0))),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("ഈ മാസം ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              Text('പരീക്ഷിക്കാൻ',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0, left: 0.0),
                    height: 125.0,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        _foodCard("Butter ചിക്കൻ","വിഭവം","https://upload.wikimedia.org/wikipedia/commons/3/3c/Chicken_makhani.jpg",1),
                        SizedBox(width: 10.0),
                        _foodCard("സാമ്പാർ","വിഭവം","https://live.staticflickr.com/1655/23623430193_3b305aa3be_b.jpg",2),
                        SizedBox(width: 10.0),
                        _foodCard("ബിരിയാണി","വിഭവം","https://live.staticflickr.com/8086/29372046950_bf222e5dac_b.jpg",3),
                        SizedBox(width: 10.0),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 15.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'ജൂലൈ',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),

          SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => recipePage(
                    nof: 3,
                    collname: "ingredients",
                  )));
            },
            child: Stack(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: StreamBuilder(
                            stream: Firestore.instance
                                .collection('ingredients')
                                .snapshots(),
                            builder: (context, snapshot) {
                              String titleImage =
                                  snapshot.data.documents[3]['titleimage'];
                              return Image(image: NetworkImage("$titleImage"));
                            }),
                      ),
                    )),
                Positioned(
                  top: MediaQuery.of(context).size.width / 2,
                  left: MediaQuery.of(context).size.width / 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.0),
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection('ingredients')
                            .snapshots(),
                        builder: (context, snapshot) {
                          String title = snapshot.data.documents[3]['title'];
                          return Text(
                            "$title",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),

          //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'ബ്രേക്ക് ഫാസ്റ്റ് ',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0),
            ),
          ),

          StreamBuilder(
              stream: Firestore.instance.collection('ingredients').snapshots(),
              builder: (context, snapshot) {
                String img0 = snapshot.data.documents[0]['titleimage'];
                String name0 = snapshot.data.documents[0]['title'];
                String img1 = snapshot.data.documents[1]['titleimage'];
                String name1 = snapshot.data.documents[1]['title'];
                String img2 = snapshot.data.documents[2]['titleimage'];
                String name2 = snapshot.data.documents[2]['title'];
                String img3 = snapshot.data.documents[3]['titleimage'];
                String name3 = snapshot.data.documents[3]['title'];
                String img4 = snapshot.data.documents[4]['titleimage'];
                String name4 = snapshot.data.documents[4]['title'];
                String img5 = snapshot.data.documents[5]['titleimage'];
                String name5 = snapshot.data.documents[5]['title'];
                String img6 = snapshot.data.documents[0]['titleimage'];
                String name6 = snapshot.data.documents[0]['title'];
                String img7 = snapshot.data.documents[0]['titleimage'];
                String name7 = snapshot.data.documents[0]['title'];
                String img8 = snapshot.data.documents[0]['titleimage'];
                String name8 = snapshot.data.documents[0]['title'];
                String img9 = snapshot.data.documents[0]['titleimage'];
                String name9 = snapshot.data.documents[0]['title'];
                String img10 = snapshot.data.documents[0]['titleimage'];
                String name10 = snapshot.data.documents[0]['title'];
                //String img11 = snapshot.data.documents[0]['img11'];
                //String name11 = snapshot.data.documents[0]['name11'];
                return Container(
                  padding: EdgeInsets.only(top: 15.0, left: 0.0),
                  height: 200.0,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: 10.0),
                      _menuCard(img0, name0,0,"ingredients"),
                      SizedBox(width: 10.0),
                      _menuCard(img1, name1,1,"ingredients"),
                      SizedBox(width: 10.0),
                      _menuCard(img2, name2,2,"ingredients"),
                      SizedBox(width: 10.0),
                      _menuCard(img3, name3,3,"ingredients"),
                      SizedBox(width: 10.0),
                      _menuCard(img4, name4,4,"ingredients"),
                      SizedBox(width: 10.0),
                      _menuCard(img5, name5,5,"ingredients"),


                    ],
                  ),
                );
              }),
          //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'വിഭവം',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0),
            ),
          ),

          StreamBuilder(
              stream: Firestore.instance.collection('dishes').snapshots(),
              builder: (context, snapshot) {
                String dimg0 = snapshot.data.documents[0]['titleimage'];
                String dname0 = snapshot.data.documents[0]['title'];
                String dimg1 = snapshot.data.documents[1]['titleimage'];
                String dname1 = snapshot.data.documents[1]['title'];
                String dimg2 = snapshot.data.documents[2]['titleimage'];
                String dname2 = snapshot.data.documents[2]['title'];
                String dimg3 = snapshot.data.documents[3]['titleimage'];
                String dname3 = snapshot.data.documents[3]['title'];
                String dimg4 = snapshot.data.documents[4]['titleimage'];
                String dname4 = snapshot.data.documents[4]['title'];
                String dimg5 = snapshot.data.documents[0]['titleimage'];
                String dname5 = snapshot.data.documents[0]['title'];
                String dimg6 = snapshot.data.documents[0]['titleimage'];
                String dname6 = snapshot.data.documents[0]['title'];
                String dimg7 = snapshot.data.documents[0]['titleimage'];
                String dname7 = snapshot.data.documents[0]['title'];
                String dimg8 = snapshot.data.documents[0]['titleimage'];
                String dname8 = snapshot.data.documents[0]['title'];
                String dimg9 = snapshot.data.documents[0]['titleimage'];
                String dname9 = snapshot.data.documents[0]['title'];
                String dimg10 = snapshot.data.documents[0]['titleimage'];
                String dname10 = snapshot.data.documents[0]['title'];
                //String dimg11 = snapshot.data.documents[0]['img11'];
                //String dname11 = snapshot.data.documents[0]['name11'];
                return Container(
                  padding: EdgeInsets.only(top: 15.0, left: 0.0),
                  height: 200.0,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: 10.0),
                      _menuCard(dimg0, dname0,0,"dishes"),
                      SizedBox(width: 10.0),
                      _menuCard(dimg1, dname1,1,"dishes"),
                      SizedBox(width: 10.0),
                      _menuCard(dimg2, dname2,2,"dishes"),
                      SizedBox(width: 10.0),
                      _menuCard(dimg3, dname3,3,"dishes"),
                      SizedBox(width: 10.0),
                      _menuCard(dimg4, dname4,4,"dishes"),
                      SizedBox(width: 10.0),



                    ],
                  ),
                );
              }),
          //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'കാപ്പി',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0),
            ),
          ),

          StreamBuilder(
              stream: Firestore.instance.collection('snacks').snapshots(),
              builder: (context, snapshot) {
                String simg0 = snapshot.data.documents[0]['titleimage'];
                String sname0 = snapshot.data.documents[0]['title'];
                String simg1 = snapshot.data.documents[1]['titleimage'];
                String sname1 = snapshot.data.documents[1]['title'];
                String simg2 = snapshot.data.documents[2]['titleimage'];
                String sname2 = snapshot.data.documents[2]['title'];
                String simg3 = snapshot.data.documents[3]['titleimage'];
                String sname3 = snapshot.data.documents[3]['title'];
                String simg4 = snapshot.data.documents[0]['titleimage'];
                String sname4 = snapshot.data.documents[0]['title'];
                String simg5 = snapshot.data.documents[0]['titleimage'];
                String sname5 = snapshot.data.documents[0]['title'];
                String simg6 = snapshot.data.documents[0]['titleimage'];
                String sname6 = snapshot.data.documents[0]['title'];
                String simg7 = snapshot.data.documents[0]['titleimage'];
                String sname7 = snapshot.data.documents[0]['title'];
                String simg8 = snapshot.data.documents[0]['titleimage'];
                String sname8 = snapshot.data.documents[0]['title'];
                String simg9 = snapshot.data.documents[0]['titleimage'];
                String sname9 = snapshot.data.documents[0]['title'];
                String simg10 = snapshot.data.documents[0]['titleimage'];
                String sname10 = snapshot.data.documents[0]['title'];
                //String simg11 = snapshot.data.documents[0]['img11'];
                //String sname11 = snapshot.data.documents[0]['name11'];
                return Container(
                  padding: EdgeInsets.only(top: 15.0, left: 0.0),
                  height: 200.0,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: 10.0),
                      _menuCard(simg0, sname0,0,"snacks"),
                      SizedBox(width: 10.0),
                      _menuCard(simg1, sname1,1,"snacks"),
                      SizedBox(width: 10.0),
                      _menuCard(simg2, sname2,2,"snacks"),
                      SizedBox(width: 10.0),
                      _menuCard(simg3, sname3,3,"snacks"),
                      SizedBox(width: 10.0),


                    ],
                  ),
                );
              }),
          //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _foodCard(String title,String cat,String url,int nof) {
    return InkWell(
      onTap: (){

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => recipePage(
              nof: nof,
              collname: "dishes",
            )));
      },
      child: Container(
        height: 125.0,
        width: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image:
                      DecorationImage(image: NetworkImage("$url"))),
              height: 125.0,
              width: 100.0,
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$title',
                  // style: TextStyle(fontFamily: 'BalooChettan'),
                ),
                /*Text(
                  'സാലഡ് എന്നിവ',
                  // style: TextStyle(fontFamily: 'BalooChettan'),
                ),*/
                SizedBox(height: 10.0),
                Container(
                  height: 2.0,
                  width: 75.0,
                  color: Colors.orange,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   /* Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5),
                          image: DecorationImage(
                              image: AssetImage('assets/chris.jpg'))),
                    ),*/
                    SizedBox(width: 10.0),
                    Text(
                      '$cat',
                      // style: TextStyle(fontFamily: 'BalooChettan'))
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _menuCard(String imgUrl, String title, int nof,String collName) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => recipePage(
              nof: nof,
              collname: collName,
            )));
      },
      child: Container(
        height: 125.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(image: NetworkImage(imgUrl))),
              height: 125.0,
              width: 140.0,
            ),
            SizedBox(width: 20.0),
            Text(
              '$title',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
