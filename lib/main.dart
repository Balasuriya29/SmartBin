import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smartbin/screens/loginpage.dart';
import 'package:smartbin/screens/registerpage.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCuF88tm7YA3Xgd2OBknABmPYfICOr2HKw",
        appId: "1:220671157492:web:759fcd111f448ecba1eaa1",
        messagingSenderId:"220671157492",
        projectId: "smartbin-a2723")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: firstpage(),
    );
  }
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMART BIN"),
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0,top: 8.0, bottom: 8.0),
                      child: Icon(Icons.login,size: 35,),
                    ),
                    Text("LOGIN",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:47.5),
              child: ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0,top: 8.0, bottom: 8.0),
                      child: Icon(Icons.app_registration,size: 35,),
                    ),
                    Text("Register",style: TextStyle(color: Colors.white),),
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  fbfunc() async {
    DataSnapshot snapshot=await  FirebaseDatabase.instance.ref("Sathy").child("BIT").get();
    var iter=snapshot.children.iterator;
    while(iter.moveNext()){
      print(iter.current.value);
    }
  }
  @override
  void initState() {
    fbfunc();
  }
}







