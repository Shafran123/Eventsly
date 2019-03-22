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
         items:[
           BottomNavigationBarItem(
             icon: Icon(Icons.calendar_today),
             title: Text("Up Coming")
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.mail),
             title: Text("Invited")
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.collections_bookmark),
             title: Text("Went")
           )
         ],
       ),
      appBar: AppBar(
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
                return Card(
                  child: Column(
                    children: <Widget>[
                       Image.network(snapshot.data[index].data['cover_img']),
                      Align(
                        alignment: Alignment.topLeft,
                        child:   Text(
                        snapshot.data[index].data['title'],
                        style: TextStyle(
                          fontFamily: 'Cocogoose Pro',
                          fontSize: 20.0
                          ),
                      ),
                      ),
                      //Text(snapshot.data[index].data['cover_img']),
                      //Image.file(snapshot.data[index].data['cover_img']),
                     
                    
                      // Image.network('https://i.imgur.com/wnwXIim.png')
                    ],
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
