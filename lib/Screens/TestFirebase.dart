import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:eventsly/Screens/GoogleSignIn.dart';
import 'package:eventsly/main.dart';
import 'package:eventsly/Screens/Page2.dart';

void main() => runApp(HomeTest());

//String uname;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
var check = Firestore.instance
    .collection('testreg')
    .where('eventId', isEqualTo: 'FMCcHhEIUZWjXK25QIAk')
    .snapshots()
    .listen((data1) => print(' ${data1.documents[0]}'));
bool isloadedDone = false;
Color color = Colors.blue;
String uname1;

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
  PageController _pageController;
  int _page = 0;
  int _bottomNavIndex = 0;
  int index = 1;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    //hello();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    hello() async {
      final FirebaseUser currentUser = await _auth.currentUser();
      uname1 = currentUser.uid;
      debugPrint(uname1);
      debugPrint('');
      return uname1;
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Up Coming")),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text("Invited")),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark), title: Text("Went"))
        ],
        onTap: navigationTapped,
      ),

      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return FlatButton(
                child: const Text('Sign out'),
                textColor: Theme.of(context).buttonColor,
                onPressed: () async {
                  final FirebaseUser user = await _auth.currentUser();
                  if (user == null) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: const Text('No one has signed in.'),
                    ));
                    return;
                  }
                  _signOut();
                  final String uid = user.uid;
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(uid + ' has successfully signed out.'),
                  ));
                },
              );
            },
          )
        ],
      ),

      drawer: Drawer(
          elevation: 20.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(' '),
                accountEmail: Text('developine.com@gmail.com'),
                // currentAccountPicture:
                // Image.network('https://hammad-tariq.com/img/profile.png'),
                //decoration: BoxDecoration(color: Colors.blueAccent),
              ),
            ],
          )),
      body: new PageView(
        children: [
          ListPage(),
          Page2(),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),

      //InfoPage(),
    );
  }

  void _signOut() async {
    await _auth.signOut();
    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future _data;
  signInGoogle() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    // String uname = currentUser.displayName;
    // debugPrint(uname);
    //uname=uname1;
    //debugPrint(uname1);
    // return (uname);
  }

  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("posts").getDocuments();
    signInGoogle();
    //debugPrint(qn.documents.toString());

    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  post: post,
                )));
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
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 3.0),
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
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 3.0),
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
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 3.0),
                            child: Text(
                              snapshot.data[index].data['short_desc'],
                              style: TextStyle(fontFamily: 'Product Sans Re'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minWidth: 350.0,
                              child: RaisedButton(
                                child: Text(
                                  'Rsvp Now !',
                                  style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 20.0,
                                      color: Colors.white),
                                ),
                                onPressed: () =>
                                    navigateToDetail(snapshot.data[index]),
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
  final DocumentSnapshot post;

  DetailPage({this.post});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data['title']),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: Image.network(widget.post.data['img']),
                    ),
                    Text(
                      widget.post.data['title'],
                      style:
                          TextStyle(fontFamily: 'Product Sans', fontSize: 30.0),
                    ),
                    Text('--------------------------------------------------'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text(
                            ' ' + widget.post.data['Date'],
                            style: TextStyle(
                                fontFamily: 'Product Sans', fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text(
                            ' ' +
                                widget.post.data['start_time'] +
                                ' - ' +
                                widget.post.data['end_time'],
                            style: TextStyle(
                                fontFamily: 'Product Sans', fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          Text(
                            ' ' + widget.post.data['venue'],
                            style: TextStyle(
                                fontFamily: 'Product Sans', fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.warning),
                          Text(
                            ' ' + widget.post.data['organizer'],
                            style: TextStyle(
                                fontFamily: 'Product Sans', fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.post.data['content'],
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: color,
                          child: Text(
                            'Rsvp Now !',
                            style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            if (isloadedDone == true) {
                              return null;
                            } else {
                              debugPrint(' $check');
                              debugPrint(widget.post.documentID);
                              String eventCoverImage =
                                  widget.post.data['cover_img'];
                              String docId = widget.post.documentID;
                              String eventName = widget.post.data['title'];
                              String eventDate = widget.post.data['Date'];
                              rsvp(
                                  docId, eventName, eventCoverImage, eventDate);
                              //rsvp(null, null, null, null);
                            }
                          }),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class curdMethod {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }
}

bool _isdisable = false;
void disablebutton() {
  _isdisable = true;
}

Future<Null> rsvp(docId, eventName, eventCoverImage, eventDate) async {
  //int counter = 0;
  final FirebaseUser currentUser = await _auth.currentUser();
  if (FirebaseAuth.instance.currentUser() != null) {
    String uid = currentUser.uid;
    String userName = currentUser.displayName;
    String email = currentUser.email;
    debugPrint(docId);
    debugPrint(eventName);

    Firestore.instance.collection('testreg').add({
      '_isInvited': '',
      'eventId': '$docId',
      'eventName': '$eventName',
      'eventCoverImage': '$eventCoverImage',
      'eventDate': '$eventDate',
      'user_id': '$uid',
      'user_name': '$userName',
      'email': '$email'
    }).then((_) {
      print('Loading..... x $isloadedDone');
      isloadedDone = true;
      color = Colors.grey;
    });
  }
}
