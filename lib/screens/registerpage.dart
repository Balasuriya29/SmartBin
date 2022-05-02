import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartbin/screens/homepage.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool zero = false;
  var username=new TextEditingController();
  var password=new TextEditingController();
  var otp=new TextEditingController();
  bool contentvalidate=false;
  bool contentro=true;
  bool rusernameerror=false;
  bool rpassworderror=false;
  bool rotperror=false;
  int len=0;
  bool check=false, check2 = true;
  String temp="", token="";
  var decodeotp;


  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 250,
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 250,
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(onPressed: (){
                  if(username.text.isEmpty && password.text.isEmpty){
                      if(username.text.isEmpty){
                          Fluttertoast.showToast(msg: "Email is required");
                      }
                      else{
                        Fluttertoast.showToast(msg: "Password is required");
                      }
                  }
                  else{
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email:username.text , password: password.text).then((value){
                      print("Registered");
                    }).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
                    });
                  }

                }, child: Text("REGISTER"))
              ],
            ),
          ),
        )
    );
  }
}