import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class developers extends StatefulWidget {
  const developers({Key? key}) : super(key: key);

  @override
  _developersState createState() => _developersState();
}
List<String> name= [];
int c=0;
class _developersState extends State<developers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios),),
        title: Text("Developers", style: GoogleFonts.montserrat(
    textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('developers')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final documentSnapshotList = snapshot.data!.docs;
            documentSnapshotList.forEach((element) {
              name.add(element['name']);
            });
            var url = 'https://www.instagram.com/<prakriti_193>/';
            c=documentSnapshotList.length;
            return ListView.builder(
              itemCount: c,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                  child: Container(
                      decoration: new BoxDecoration(color: Colors.grey[900],borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Row(
                        children: [
                          SizedBox(width:MediaQuery.of(context).size.width * 0.05,),
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('images/logo.png'),
                          ),
                          SizedBox(width:MediaQuery.of(context).size.width * 0.035,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name[index], style: GoogleFonts.montserrat(
                                textStyle:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),),
                              Row(
                                children: [
                                  IconButton(
                                    color: Colors.red,
                                    onPressed:() async {
                                    if (await canLaunch(url)) {
                                  await launch(
                                  url,
                                  universalLinksOnly: true,
                                  );
                                  } else {
                                  throw 'There was a problem to open the url: $url';
                                  }}, icon:ImageIcon(
                                      AssetImage("images/insta.png"),color: Colors.white,size: 22,),
                                  ),
                                  IconButton(                                color: Colors.red,
                                    onPressed:() async {
                                    if (await canLaunch(url)) {
                                      await launch(
                                        url,
                                        universalLinksOnly: true,
                                      );
                                    } else {
                                      throw 'There was a problem to open the url: $url';
                                    }}, icon:ImageIcon(
                                      AssetImage("images/fb.png"),color: Colors.white,size: 18,),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                );},
            );}
      ),
    );
  }
}
