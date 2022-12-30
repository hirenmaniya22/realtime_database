import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: rt_data(),));
}
class rt_data extends StatefulWidget {
  const rt_data({Key? key}) : super(key: key);

  @override
  State<rt_data> createState() => _rt_dataState();
}

class _rt_dataState extends State<rt_data> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  // DatabaseReference ref = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("realtime database"),),
      body: Column(children: [
        TextField(controller: t1,decoration: InputDecoration(hintText: "enter name")),
        TextField(controller: t2,decoration: InputDecoration(hintText: "enter contact")),
        ElevatedButton(onPressed: () async {
          print("hello");
          DatabaseReference ref = FirebaseDatabase.instance.ref("hiren");
          await ref.set({
            "name": t1.text,
            "contact": t2.text,
          });
          print("your data eneterrrwhjkjckhchjsnjkchh");
          setState(() {

          });
        }, child: Text("Add data"))
      ]),
    );
  }
}
