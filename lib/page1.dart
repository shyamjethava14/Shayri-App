import 'package:flutter/material.dart';
import 'package:shayari_app/page2.dart';

import 'model.dart';




class shay extends StatefulWidget {
  const shay({Key? key}) : super(key: key);

  @override
  State<shay> createState() => _shayState();
}

class _shayState extends State<shay> {

  @override
  void initState() {
      super.initState();
      model m=new model();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Love shayari"),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {
               //Share.share('check out my website https://shyamjethava.com');
              }, icon: Icon(Icons.share)),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.more_vert_outlined)),
            ],
          ),
        ],
      ),
      body: ListView.builder(itemCount: model().name.length,itemBuilder: (context, index) {
        return  Container(
          color: Colors.green,
          child: Card(
                elevation: 10,
                shadowColor: Colors.green,
                child: ListTile(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder:  (context) {
                     return page2(index);
                   },));
                 },
                  title: Text(model().name[index],style: TextStyle(color: Colors.green,),),
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(model().shyimage[index]),
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
            ),
        );

      },),

       drawer: Drawer(
         elevation: 2,
        // backgroundColor: Colors.green,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Container(
                  height: 50,
                    width: 50,

                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('iuploader/life.jpg'),
                      ),
                    ),
                ),
              ),
              Text("shyam jethava",textAlign: TextAlign.center),
              ListTile(
                title: Text('home'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('page2'),
                onTap: () {

                },
              ),
            ],
          ),
        ),
    );

  }


}


