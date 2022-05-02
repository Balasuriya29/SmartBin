
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartbin/screens/homepage.dart';
import 'package:smartbin/screens/regions.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  var username=new TextEditingController();
  var password=new TextEditingController();
  String temp="";
  bool password_visible = true,passworderror=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text("")),
                      Expanded(
                        flex:5,
                        child: Container(
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      child: TextField(
                                        onChanged: (s){
                                          setState(() {
                                            temp=s;
                                          });

                                          // if(s.contains("@bitsathy.ac.in")){
                                          //
                                          //   setState(() {
                                          //     usernameerror=false;
                                          //   });
                                          // }
                                          // else{
                                          //   setState(() {
                                          //     usernameerror=true;
                                          //   });
                                          // }

                                        },

                                        controller: username,
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Email',
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Expanded(flex:3,child: Container(width: double.infinity,)),

                                ],
                              )),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text("")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text("")),
                      Expanded(
                        flex:5,
                        child: Container(
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      child: TextField(
                                        obscureText: password_visible,
                                        controller: password,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  password_visible = !password_visible;
                                                });
                                              },
                                              icon: password_visible?Icon(Icons.remove_red_eye, color: Colors.grey,):Icon(Icons.remove_red_eye)),
                                          errorText: passworderror?"InValid Password":null,
                                          border: UnderlineInputBorder(),
                                          labelText: 'Password',
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Expanded(flex:3,child: Container(width: double.infinity,)),
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text("")),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(onPressed: () async{
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: username.text, password: password.text).then((value){
                        print("Login in successful");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>region()));
                      });
                    }, child: Text("LOGIN")),
                  ),
                ],),
            ),
          ),
        )
    );
  }
}