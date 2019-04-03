import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getInvitedEvents() async {
  var firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser currentUser = await _auth.currentUser();

  QuerySnapshot qn1 = await firestore
      .collection('testreg')
      .where("_isInvited", isEqualTo: "")
      .where("email", isEqualTo: currentUser.email)
      .getDocuments();
  //.listen((data) =>
  //  data.documents.forEach((doc) => print(doc["eventId"])));
  debugPrint(qn1.documents.toString());
  debugPrint(currentUser.email);

  return qn1.documents;
}

class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Page2State();
}

class Page2State extends State<Page2> {
  navigatePage(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InvitedEventDetailPage(post: post)));
  }

  @override
  Widget build(BuildContext context) {
    return

        //Text('data');

        Container(
      width: 10.0,
      height: 10.0,
      child: FutureBuilder(
        future: getInvitedEvents(),
        builder: (_, snapshot1) {
          if (snapshot1.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading .."),
            );
          } else
            return ListView.builder(
              itemCount: snapshot1.data.length,
              itemBuilder: (_, index) {
                //debugPrint(snapshot1.data[index].data['eventId']);
                return GestureDetector(
                  onTap: () {
                    navigatePage(snapshot1.data[index]);
                    debugPrint('hell');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              snapshot1.data[index].data['_img'],

                              //color: Color.fromRGBO(22, 22, 22, 0.7),colorBlendMode: BlendMode.modulate
                            ),
                          )

                          //Text(snapshot1.data[index].data['eventId']),
                          /*  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                             ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      child:  Image.network(snapshot1.data[index].data['eventCoverImage']),
                    ),  
                           
                            SizedBox(
                                height: 40.0,
                                child: Stack(
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0.0),
                                              bottomLeft:
                                                  Radius.circular(10.0))),
                                      child: Text(snapshot1.data[index].data['eventDate'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Product Sans',
                                            fontSize: 15.0),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left: 180.0 , top: 12.0),
                                          child: Text(snapshot1.data[index].data['eventName'],style: TextStyle(
                                            fontFamily: 'Product Sans',
                                            fontSize: 20.0
                                            
                                          ),),
                                        )
                                      ],
                                    )
                                    
                                  ],
                                )),

                          ],
                        ),
                      ), */
                          ),
                    ),
                  ),
                );
              },
            );
        },
      ),
    );
  }
}

class InvitedEventDetailPage extends StatefulWidget {
  final DocumentSnapshot post;

  InvitedEventDetailPage({this.post});
  @override
  State<StatefulWidget> createState() => InvitedEventDetailPageState();
}

class InvitedEventDetailPageState extends State<InvitedEventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data['eventName']),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 3.0,
                //color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: Image.network(widget.post.data['eventCoverImage']),
                    ),SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.post.data['user_name'] + " You Are Invited",
                      style:
                          TextStyle(fontFamily: 'Product Sans Re', fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('-----------------------------------------------'),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Text("Agenda" , style: TextStyle(
                        fontFamily:'Product Sans Re',
                        fontSize: 15.0,
                        color: Colors.white
                      ),),
                      onPressed: (){

                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
