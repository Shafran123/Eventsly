import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getInvitedEvents() async{
  var firestore = Firestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

FirebaseUser currentUser = await _auth.currentUser();

  QuerySnapshot qn1 = await firestore.collection('testreg').where("_isInvited", isEqualTo: "").where("email", isEqualTo: currentUser.email).getDocuments();
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
  @override
  Widget build(BuildContext context) {
      return 
        
      
      //Text('data');
      
      
       Container(
        width: 10.0,
        height: 10.0,
        child:FutureBuilder(
          future: getInvitedEvents(),
          builder: (_,snapshot1){
            if(snapshot1.connectionState == ConnectionState.waiting){
                  return Center(
                child: Text("Loading .."),
              );
            }else
            return ListView.builder(
              itemCount: snapshot1.data.length,
              itemBuilder: (_, index) {
                //debugPrint(snapshot1.data[index].data['eventId']);
               return Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Container(
                   child: Card(
                     child: Text(snapshot1.data[index].data['eventId']),
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
