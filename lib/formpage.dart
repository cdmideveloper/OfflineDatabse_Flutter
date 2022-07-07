import 'package:flutter/material.dart';
import 'package:lec_9to10/DbHelper.dart';
import 'package:sqflite/sqflite.dart';

class formpage extends StatefulWidget {
  const formpage({Key? key}) : super(key: key);

  @override
  State<formpage> createState() => _formpageState();
}

class _formpageState extends State<formpage> {

  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();
  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      DbHelper().createDatabase().then((value) {
         db = value;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Contact"),),
      body: ListView(
        children: [
          TextField(controller: tname,),
          TextField(controller: tcontact,),
          ElevatedButton(onPressed: () async {
            String name = tname.text;
            String contact = tcontact.text;

           String qry = "insert into Test (name,contact) values('$name','$contact')";

           int a = await db!.rawInsert(qry);

           print(a);

          }, child: Text("Save"))
        ],
      ),
    );
  }
}
