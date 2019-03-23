import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

void main() => runApp(HomeTest());

class HomeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FibaseTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: 'Firebase Test',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Up Coming")),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text("Invited")),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark), title: Text("Went"))
        ],
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                debugPrint('hi');
              },
            );
          },
        ),
        title: Text(widget.title),
      ),
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("posts").getDocuments();

    debugPrint(qn.documents.toString());

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading .."),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 4.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                            child: Image.network(
                                snapshot.data[index].data['cover_img']),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                ButtonTheme(
                                  minWidth: 350.0,
                                  height: 30.0,
                                  child: RaisedButton(
                                    child: Text(
                                      snapshot.data[index].data['Date']
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Product Sans',
                                          fontSize: 20.0,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,bottom: 3.0),
                            child: Text(
                              'Orgrazied by : ' +
                                  snapshot.data[index].data['organizer'],
                              style: TextStyle(fontFamily: 'Product Sans Re'),
                            ),
                          ),

                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0,bottom: 3.0),
                                      child: Text(
                                        snapshot.data[index].data['title'],
                                        style: TextStyle(
                                            fontFamily: 'Product Sans',
                                            fontSize: 25.0,
                                          
                                            ),
                                            
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,bottom: 3.0),
                            child: Text(
                             
                                  snapshot.data[index].data['short_desc'],
                              style: TextStyle(fontFamily: 'Product Sans Re'),
                            ),
                          ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ButtonTheme(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                    minWidth: 350.0,
                                    
                                    child: RaisedButton(
                                      child: Text(
                                        'Rsvp Now !',
                                        style: TextStyle(
                                            fontFamily: 'Product Sans',
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                            ),
                          //Image.file(snapshot.data[index].data['cover_img']),

                          // Image.network('https://i.imgur.com/wnwXIim.png')
                          
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
