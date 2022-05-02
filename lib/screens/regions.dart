import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartbin/screens/streetpage.dart';

import 'analyticspage.dart';

class region extends StatefulWidget {
  const region({Key? key}) : super(key: key);

  @override
  _regionState createState() => _regionState();
}
class _regionState extends State<region> {
  List<String> regionNames=["SATHY","PULIAMPATTI","KURUMANDUR","ATHANI","PARIYUR","APPAKUDAL","KUGALUR","BHAVANI","KOLAPPALUR","VAKANPATT",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: regionNames.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:10 ,crossAxisSpacing: 10), itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 4,
                        child: Center(child: Text(regionNames.elementAt(index)),),
                    ),
                  ),
                  onTap: (){
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>sathy()));
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class sathy extends StatefulWidget {
  const sathy({Key? key}) : super(key: key);

  @override
  _sathyState createState() => _sathyState();
}

class _sathyState extends State<sathy> {
  List<String> sathyregion=["BIT","ARASUR","ARIYAPPAM PALAYAM","GANDHI NAGAR","PERIYAKIDIVERI","KODIVERI","ALATHUCOMBAI","ONDIYUR","BHAVANISAGAR","SADUMUGAI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sathyregion.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:10 ,crossAxisSpacing: 10), itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Center(child: Text(sathyregion.elementAt(index)),),
                    ),
                  ),
                  onTap: (){
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>streets()));
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class streets extends StatefulWidget {
  const streets({Key? key}) : super(key: key);

  @override
  State<streets> createState() => _streetsState();
}

class _streetsState extends State<streets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>analyticspage()));
            },
            icon: Icon(Icons.analytics),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("Street "+(index+1).toString()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>streetpage(index+1)));
            },
          );
        }),
      )
    );
  }
}


class bit extends StatefulWidget {
  const bit({Key? key}) : super(key: key);

  @override
  _bitState createState() => _bitState();
}

class _bitState extends State<bit> {
  List<String> bitblocks=["AERO BLOCK","AS BLOCK","SF BLOCK","IB BLOCK"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(child: Text("HELLO"),)
    );
  }
}