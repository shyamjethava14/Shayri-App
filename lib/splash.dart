import 'package:flutter/material.dart';
import 'package:shayari_app/page1.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class entry extends StatefulWidget {
  const entry({Key? key}) : super(key: key);

  @override
  State<entry> createState() => _entryState();
}

class _entryState extends State<entry> {
  @override
  void initState() {
   connect();
  }
  connect()
  async {
      await Future.delayed(Duration(seconds: 3));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return shay();
      },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                  height: 200,
                  width: 200,
                  child: Center(child: Image.asset("logof/logo.png")),
                ),
            ),
          ),
         
          Expanded(
            child:  Center(
          child: LoadingAnimationWidget.prograssiveDots(
            color: Colors.green,
            size: 50,
            ),
            ),
            ),
        ],
      ),
    );
  }


}
