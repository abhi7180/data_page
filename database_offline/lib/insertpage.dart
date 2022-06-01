import 'package:database_offline/Model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class insertpage extends StatefulWidget {
  const insertpage({Key? key}) : super(key: key);

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {

  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();

  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Model().createDatabase().then((value) {
      db = value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Contact"),),
      body: Column(
        children: [
          TextField(controller: tname,),
          TextField(controller: tcontact,),
          ElevatedButton(onPressed: () async {

            // Offline Database / sqflite Database

            String name = tname.text;
            String contact = tcontact.text;

            String qry = "insert into contactbook (name,contact) values ('$name','$contact')";
            int a = await db!.rawInsert(qry);

            print(a);

          }, child: Text("Save"))
        ],
      ),
    );
  }
}
