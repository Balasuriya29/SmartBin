import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class streetpage extends StatefulWidget {
  final int streetno;
  const streetpage(this.streetno, {Key? key}) : super(key: key);

  @override
  State<streetpage> createState() => _streetpageState();
}

class _streetpageState extends State<streetpage> {
  List<int> gvalues=[];
  fbfunc() async{
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(now);
    print("date"+formatted);
    int month=int.parse(formatted.substring(3,5));
    List<String> monlist=['January', 'February', 'March', 'April','May','June','July','August','September','October','Novermber','December'];
    String selectedMonth=monlist[month-1];
    print("Selected month"+selectedMonth);
    Stream<DatabaseEvent> snapshot=await FirebaseDatabase.instance.ref("Sathy").child("BIT").child("Street "+widget.streetno.toString()).onValue;
    snapshot.listen((event) {
      gvalues.clear();
      var iter=event.snapshot.children.iterator;
      while(iter.moveNext()){
        // gvalues.add(int.parse(iter.current.child(formatted).value.toString()));
        // print(iter.current.value);
        print(iter.current.child(selectedMonth).child(formatted).value.toString());
        gvalues.add(int.parse(iter.current.child(selectedMonth).child(formatted).value.toString()));
        // print(iter.current.value);
        // var res=json.encode(iter.current.value);
        // print(res);
        // print(res.
        // var iterator=iter.current.children.iterator;
        // while(iterator.moveNext()){
        //   print(iterator.current.key?.contains(formatted));
        //   if(iterator.current.key?.contains(formatted)==true){
        //     print("in if");
        //     gvalues.add(int.parse(iterator.current.value.toString()));
        //   }
        // }
      }
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: gvalues.length,
          itemBuilder: (BuildContext context,int index){
        return Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Card(
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(flex:1,child: Text("GARBAGE BIN NO "+(index+1).toString())),
                  Expanded(flex:2,child: Container(width: double.infinity,)),
                  Expanded(flex:1, child: Text(gvalues.elementAt(index).toString())),
                ],
              ),
            ),
          ),
        );
      })
    );
  }

  @override
  void initState() {
    fbfunc();
  }
}
