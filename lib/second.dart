import 'package:data_page/data.dart';
import 'package:data_page/dataclass.dart';
import 'package:data_page/third.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class second extends StatefulWidget {

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  TextEditingController t1=TextEditingController();

  Database? db;
  List<dataclass> list = [];
  String qry="";
  int index=0;
  bool search = false;
  List<dataclass> templist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getalldata();

  }

  getalldata()
  {

    data().createdatabase().then((value) async {
      db = value;

      qry = " select * from test";
      value.rawQuery(qry).then((value) {
        setState(() {
          for(int i=0;i<value.length;i++)
            {
              list.add(dataclass.fromMap(value[i]));
              templist.add(dataclass.fromMap(value[i]));
            }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search ? AppBar(
        title: TextField(controller: t1,
        onChanged: (value) {
          setState(() {
            templist.clear();
            for(int i=0;i<list.length;i++)
            {
              if(list[i].name!.toLowerCase().contains(value.toLowerCase()))
                {
                  templist.add(list[i]);
                }
            }


          });
        },

        ),
        actions: [

          ElevatedButton(onPressed: () {
            setState(() {
              search=!search;


            });

          }, child: Icon(Icons.cancel))
        ],
      ) : AppBar(
        actions: [

          ElevatedButton(onPressed: () {
            setState(() {
              search=!search;

            });

          }, child: Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: templist.length,
        itemBuilder:  (context, index) {

        return ListTile(
          title: Text("${templist[index].name}"),
          subtitle: Text("${templist[index].number}"),
        );
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return third();
        },));
      },child: Icon(Icons.add),),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            index = value;
            if (index == 1) {
              templist.sort((a, b) => a.name!.compareTo(b.name!));
            }
            if (index == 2) {
              templist.sort((b, a) => a.name!.compareTo(b.name!));
            }
            if (index == 3) {
              templist.sort((a, b) => a.number!.compareTo(b.number!));
            }
            if (index == 4) {
              templist.sort((b, a) => a.number!.compareTo(b.number!));
            }
          });
        },

        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.brown,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.sort_by_alpha),label: "default"),
          BottomNavigationBarItem(icon: Icon(Icons.sort_by_alpha),label: "AtoZ"),
          BottomNavigationBarItem(icon: Icon(Icons.sort_by_alpha),label: "ZtoA"),
          BottomNavigationBarItem(icon: Icon(Icons.sort_by_alpha),label: "HtoL"),
          BottomNavigationBarItem(icon: Icon(Icons.sort_by_alpha),label: "LtoH"),






    ],
      ),
      
      
    );
  }
}
