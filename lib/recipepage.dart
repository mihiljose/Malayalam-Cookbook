import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class recipePage extends StatefulWidget {

  final int nof;
  final String collname;
  recipePage({this.nof,this.collname});

  @override
  _recipePageState createState() => _recipePageState();
}

class _recipePageState extends State<recipePage> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 205.0,
            floating: false,
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
            backgroundColor: Colors.green,
            flexibleSpace: FlexibleSpaceBar(
              title: StreamBuilder(
                  stream: Firestore.instance.collection(widget.collname).snapshots(),
                  builder: (context, snapshot) {
                    String title = snapshot.data.documents[widget.nof]['title'];
                    return Text(
                      "$title",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  }),
              background: StreamBuilder(
                  stream: Firestore.instance.collection(widget.collname).snapshots(),
                  builder: (context, snapshot) {
                    String titleImage = snapshot.data.documents[widget.nof]['titleimage'];
                    return Image(image: NetworkImage("$titleImage"));
                  }),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          StreamBuilder(
                              stream: Firestore.instance
                                  .collection(widget.collname)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                String fact = snapshot.data.documents[widget.nof]['fact'];
                                return Text(
                                  "$fact",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'ചേരുവകൾ',
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection(widget.collname)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return new Text('Loading...');
                            default:
                              List len = snapshot.data.documents[widget.nof]['ingredients'];
                              return Column(
                                children: <Widget>[
                                  getTextWidgets(len),
                                ],
                              );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'തയ്യാറാക്കൽ',
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection(widget.collname)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return new Text('Loading...');
                            default:
                              List len = snapshot.data.documents[widget.nof]['steps'];
                              return Column(
                                children: <Widget>[
                                  getTextWidgets(len),
                                ],
                              );
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 40.0,)
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}

Widget getTextWidgets(List strings) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < strings.length; i++) {
    list.add(new Text(
      strings[i],
      style: TextStyle(fontSize: 18.0),
    ));
    list.add(SizedBox(
      height: 10.0,
      child: new Center(
        child: new Container(
          margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height: 2,
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
    ));
  }
  return new Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: list);
}
