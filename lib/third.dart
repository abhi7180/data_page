import 'package:data_page/data.dart';
import 'package:data_page/second.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class third extends StatefulWidget {


  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {

  TextEditingController aname = TextEditingController();
  TextEditingController anumber = TextEditingController();

  Database? db;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data().createdatabase().then((value) {
      db=value;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(controller: aname,),
          TextField(controller: anumber,),
          ElevatedButton(onPressed: () async {

            String name = aname.text;
            String number = anumber.text;

            String qry =" insert into test (name , number) values ('$name', '$number')";

            int a = await db!.rawInsert(qry);
            print(a);

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return second();
            },));




          }, child: Text("save"))
        ],
      ),
    );
  }
}
