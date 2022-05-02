import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartbin/screens/regions.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return region();
  }
}
