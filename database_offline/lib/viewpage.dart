import 'package:database_offline/insertpage.dart';
import 'package:flutter/material.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ContactBook"),),
      floatingActionButton: FloatingActionButton(onPressed: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return insertpage();
        },));
      },child: Icon(Icons.add),),
    );
  }
}
