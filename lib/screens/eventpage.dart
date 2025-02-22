import 'dart:ui';

import 'package:effervescence22/classes/eventprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'eventdetail.dart';

class eventpage extends StatefulWidget {
  final Profile profile;
  int ind;
  eventpage({required this.profile, required this.ind});

  @override
  _eventpageState createState() => _eventpageState();
}

class _eventpageState extends State<eventpage> {
  @override

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 9),
                  child: Container(
                    decoration: new BoxDecoration(color: Colors.grey[900],borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: 200,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {Navigator.push(context,
                          MaterialPageRoute(builder: (context) => detail(profile: widget.profile, ind: widget.ind)));   },
                      child: Stack(
                        children: [
                          Container(
                              width:MediaQuery.of(context).size.width * 0.36,
                              height:MediaQuery.of(context).size.height * 0.3,
                              child: Image(image: AssetImage('images/Effe_logo.png'))),
                          Column(
                            children: [
                              SizedBox(
                                height:MediaQuery.of(context).size.height * 0.05,
                              ),
                              Text(
                                '${widget.profile.name} ',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.montserrat(
                                  textStyle:TextStyle(fontWeight: FontWeight.w500, fontSize: 13,color: Colors.white),),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                '${widget.profile.date} ',
                                style: GoogleFonts.montserrat(
                                  textStyle:TextStyle(fontWeight: FontWeight.w500, fontSize: 13,color: Colors.white),),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                // height: 120,
                                // width: 200,
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),
                                    image: DecorationImage(image: AssetImage('images/logo.png'),fit: BoxFit.fill)),)),
                        ],
                      ),
                    ),
                ),
              );
  }
}
