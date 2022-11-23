import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'page4.dart';

class page3 extends StatefulWidget {
  int index=0;
  List<String> l=[];
  page3(this.index,this.l);
  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
 PageController pageController=new PageController();

 // List<String> get l => null;

 @override
 void initState() {
      super.initState();
      pageController = PageController(initialPage: widget.index);
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("shayari"),
      //   backgroundColor: Colors.green,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Column(
              children: [
                Container(
                  alignment: Alignment.center,

                  child: Text("${widget.index+1}/${widget.l.length}",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
              ],
            )),
            Expanded(
              flex: 5,child: PageView.builder(itemCount: widget.l.length,
              controller: pageController,
              onPageChanged: (value){
              print(value);
                setState(() {
                widget.index=value;
              });
                },
              itemBuilder: (context, index) {
                return     SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(widget.l[widget.index],style: TextStyle(fontSize: 20,color: Colors.white)),
                    ),
                  ),
                );
              },),

            ),

            Expanded(flex: 1,child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(7),right: Radius.circular(7)),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    String shayri = widget.l[widget.index];
                    FlutterClipboard.copy(shayri).then(( value ) => Fluttertoast.showToast(
                        msg: "copy!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0));
                  }, icon: Icon(Icons.copy_all_outlined)),
                  IconButton(onPressed: () {
                    setState(() {
                      if(widget.index!=0)
                      {
                        widget.index--;
                      }
                      else
                        {
                          widget.index=widget.l.length-1;
                        }
                      pageController.jumpToPage(widget.index);
                      setState(() {
                      });
                    });

                  }, icon: Icon(Icons.navigate_before_outlined)),
                  IconButton(onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //String s = widget.l;
                      return page4(widget.index,widget.l);

                      },));
                  }, icon: Icon(Icons.edit_off)),
                  IconButton(onPressed: () {
                            setState(() {
                              if(widget.index<widget.l.length-1) {
                                widget.index++;
                              }
                              else
                                {
                                  widget.index=0;
                                }
                            });
                  }, icon: Icon(Icons.navigate_next)),
                  IconButton(onPressed: () {

                    //Share.share('check out my website https://example.com');

                  }, icon: Icon(Icons.share_arrival_time_outlined)),
                ],
              ),
            )),

          ],
        ),
      ),


    );
  }


}
