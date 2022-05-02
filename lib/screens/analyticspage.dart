import 'package:draw_graph/models/feature.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class analyticspage extends StatefulWidget {
  const analyticspage({Key? key}) : super(key: key);

  @override
  State<analyticspage> createState() => _analyticspageState();
}

class _analyticspageState extends State<analyticspage> {
  String month="January";
  String street="Street 1";
  String bin="Bin 1";
  String selectedmonth="";
  List<String> monlist=['January', 'February', 'March', 'April','May','June','July','Augest','Sepetember','October','November','December'];
  List<String> streetlist=['Street 1','Street 2','Street 3'];
  List<String> binlist=['Bin 1','Bin 2','Bin 3'];
  Map<String,String> monmap={
    "January":"01",
    "February":"02",
    "March":"03",
    "April":"04",
    "May":"05",
    "June":"06",
    "July":"07",
    "August":"08",
    "September":"09",
    "October":"10",
    "November":"11",
    "December":"12"
  };
  List<double> monthlyvalue=[];
  bool show=false;
  List<int> days=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
  int total=0;
  fbfunc(String month) async{
    monthlyvalue.clear();
    DataSnapshot data= await FirebaseDatabase.instance.ref("Sathy").child("BIT").child("Street 1").child("GB1").child(month).get();
    var iter=data.children.iterator;
    while(iter.moveNext()){
      monthlyvalue.add(double.parse(iter.current.value.toString()));
    }
    setState(() {
      print(monthlyvalue);
    });
  }
  @override
  void initState() {
    super.initState();
    fbfunc(month);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(width: double.infinity,),
          DropdownButton(
              value: street,
              icon: const Icon(Icons.arrow_downward),
              items: streetlist
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newvalue){
                setState(() {
                  street=newvalue!;
                  print("new value street"+street);
                });
              }
          ),
          DropdownButton(
              value: bin,
              icon: const Icon(Icons.arrow_downward),
              items: binlist
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newvalue){
                setState(() {
                  bin=newvalue!;
                  print("new value bin"+bin);
                });
              }
          ),
          DropdownButton(
            value: month,
              icon: const Icon(Icons.arrow_downward),
              items: monlist
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newvalue){
              setState(() {
                month=newvalue!;
                print("new value"+month);
                fbfunc(month);
              });
              }
          ),

          ElevatedButton(onPressed: () async{
            print(month);
            setState(() {
             // await fbfunc(month);
              show=true;
            });
            // total=0;
            // DataSnapshot snapshot=await FirebaseDatabase.instance.ref("Sathy").child("BIT").child("Street 1").get();
            // var iter=snapshot.children.iterator;
            // while(iter.moveNext()){
            //
            //   String tempdate=iter.current.child("Date").value.toString();
            //   // print(iter.current.child("Date").value.toString());
            //   monmap.forEach((key, value) {
            //     if(key==month){
            //        selectedmonth=value;
            //     }
            //   });
            //   if(tempdate.substring(4,6)==selectedmonth){
            //     total+=int.parse(iter.current.child("Value").value.toString());
            //     print(iter.current.child("Value").value.toString());
            //   }
            //   print(total);
            //   setState(() {
            //
            //   });
            // }
          }, child: Text("GENERATE REPORT")),
          Text("Total garbage "+total.toString()),

          (show)?Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //Initialize the spark charts widget
                      child: SfSparkLineChart.custom(
                        //Enable the trackball
                        // trackball: SparkChartTrackball(
                        //     activationMode: SparkChartActivationMode.tap),
                        //Enable marker
                        marker: SparkChartMarker(
                            displayMode: SparkChartMarkerDisplayMode.all),
                        //Enable data label
                        // labelDisplayMode: SparkChartLabelDisplayMode.all,
                        xValueMapper: (int index) => days[index],
                        yValueMapper: (int index) => monthlyvalue[index],
                        dataCount: monthlyvalue.length-1,
                      ),
                    ),
                  ):Text("")
        ],
      ),
    );
  }
}
class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}