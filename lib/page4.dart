import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari_app/model.dart';
import 'package:flutter/rendering.dart';


class page4 extends StatefulWidget {
  int index;
  List<String> l;
  page4(this.index,this.l);


  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  List<Color> t=[Colors.red,Colors.blueAccent,Colors.grey,Colors.blue,Colors.amberAccent,Colors.yellow,Colors.black,Colors.deepPurple,Colors.green,Colors.lightGreen,Colors.pink];
  List<Color> c=[Colors.red,Colors.blueAccent,Colors.grey,Colors.lightGreen,Colors.pink,Colors.blue,Colors.amberAccent,Colors.yellow,Colors.black,Colors.deepPurple,Colors.green];
  Color tg =Colors.black;
  Color bg = Colors.red;
  String emoji = "😀 😃 😄 😁 ";
  double txtsize=20;
  List<Color> cgradient=[Color(0xff355C7D),Color(0xff6C5B7B),Color(0xffC06C84)];
  int cnt=0;
  bool click=true;
  List<String> fontl=["f1","f2","f3","f4"];
  String cfont="f1";
  String folderpath="";
  GlobalKey _globalKey = new GlobalKey();
  @override
  void initState() {
      model m=new model();
  }
  foldercreate()
  async {
    var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)+'/shyari app';
    print(path);
    Directory dir=Directory(path);

    if(await dir.exists())
      {
        print("already create");
      }
    else
      {
        await dir.create();
        print("create");
        print(dir.path);
      }
     folderpath=dir.path;

  }
  Future<Uint8List> _capturePng() async {
   var pngBytes;
    try {
      print('inside');
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData?.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes!);
      print(pngBytes);
      print(bs64);
    } catch (e) {
      print(e);
    }
    return pngBytes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit your shayri"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 8,child: SingleChildScrollView(
              child: RepaintBoundary(
                key: _globalKey,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                  alignment: Alignment.center,
                  decoration: click ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(10),
                  ):BoxDecoration(
                    gradient: LinearGradient(colors: cgradient),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('${emoji}\n''${widget.l[widget.index]}\n''${emoji}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: txtsize,color: tg,fontFamily: cfont),textAlign: TextAlign.center,),
                ),
              ),
            )),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  IconButton(onPressed: () {
                    click=false;
                          if(cnt==0)
                            {
                                    cgradient=model().colorlist[0];
                            }
                          else if(cnt==1)
                            {
                              cgradient=model().colorlist[1];
                            }
                          else  if(cnt==2)
                          {
                            cgradient=model().colorlist[2];
                          }
                          else if(cnt==3)
                          {
                            cgradient=model().colorlist[3];
                          }
                          else  if(cnt==4)
                          {
                            cgradient=model().colorlist[4];
                          }
                          else
                          {
                            cnt=0;
                          }
                          setState((){
                            cnt++;
                              });
                  }, icon: Icon(Icons.cached_outlined)),
                  IconButton(onPressed: () {
                      showModalBottomSheet(isScrollControlled: true,builder: (context) {
                        return Container(
                          height: 450,
                          child: GridView.builder(itemCount:model().colorlist.length,itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                click=false;
                                setState(() {
                                  cgradient=model().colorlist[index];
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: model().colorlist[index])
                                ),
                              ),
                            );
                          },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                              mainAxisSpacing: 10,crossAxisSpacing: 10
                          )),
                        );
                      },context: context);

                  }, icon: Icon(Icons.zoom_out_map)),
                ],
              ),
            ),
            Container(
              color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: ElevatedButton(
                            onPressed: () {
                                   showModalBottomSheet(builder: (context) {
                                     return Container(
                                       color: Colors.black,
                                       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                       height: 150,
                                         
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           Expanded(
                                             child: GridView.builder(scrollDirection: Axis.vertical,
                                                 itemCount: c.length,
                                                 itemBuilder: (context,index){
                                                    return InkWell(
                                                      onTap: () {
                                                        click=true;
                                                        setState(() {
                                                          bg=c[index];
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.all(5),
                                                        color: c[index],
                                                      ),
                                                    );

                                                 },
                                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,childAspectRatio: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),
                                                 ),
                                           ),
                                           IconButton(onPressed: () {
                                             Navigator.pop(context);
                                           }, icon: Icon(Icons.close,color: Colors.white  ,))
                                         ],
                                       ));
                                     },isDismissible: false,
                                       barrierColor: Colors.transparent ,context: context);
                        }, child: Text("background")),
                        ),
                        Expanded(child: ElevatedButton(onPressed: () {
                                  showDialog(builder: (context) {
                                    return AlertDialog(
                                      content: ColorPicker(onColorChanged: (value) {
                                        setState(() {
                                          tg=value;
                                        });
                                      },pickerColor: tg),
                                    );
                                  },context: context);

                                }, child: Text("text color")),),
                        Expanded(child: ElevatedButton(onPressed: () {
                          DateTime now = DateTime.now();
                          String dname="${now.year.toString()}${now.month.toString()}${now.day.toString()}${now.hour.toString()}${now.minute.toString()}${now.second.toString()}"
                              "${now.millisecond.toString()}";
                          String dayname="${folderpath}/image_${dname}";

                          File file= File(dayname);
                          file.create().then((value)
                          {
                            print(value.path);
                            file.create().then((value)
                            {
                              _capturePng().then((value)
                              {
                                file.writeAsBytes(value).then((value)
                                {
                                  Share.shareFiles(['${value.path}']);
                                });
                              });
                            });
                          });
                        }, child: Text("share")),),
                      ],
                    )),
                     Expanded(flex: 1,
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
    Expanded(child: ElevatedButton(onPressed: () {
       showModalBottomSheet(barrierColor: Colors.transparent,builder: (context) {
         return Container(
           height: 150,
           color: Colors.black,
           alignment: Alignment.center,
           //padding: EdgeInsets.all(10),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Expanded(child: ListView.builder(itemCount: model().emoji.length,itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                emoji=model().emoji[index];
                              });
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                                    color: Colors.grey,
                                    margin: EdgeInsets.all(10),
                                    child: Text(model().emoji[index],style: TextStyle(fontSize: 30),),
                            ),
                          );
               }))
             ],
           ),
         );
       },context: context);
    }, child: Text("emoji")),),
    Expanded(child: ElevatedButton(onPressed: () {
          showModalBottomSheet(builder: (context) {
            return StatefulBuilder(builder: (context, setState1) {
              return Slider(min: 10,max: 60,onChanged: (value) {
                txtsize=value;
                setState1(() {

                });
                setState(() {

                });
              },value: txtsize);
            },);
          },context: context);
    }, child: Text("font size")),),
                           
           ElevatedButton(onPressed: () {
             showModalBottomSheet(builder: (context) {
               return ListView.builder(itemCount: fontl.length,itemBuilder: (context, index) {
                 return ListTile(
                   onTap: () {
                     setState(() {
                       cfont=fontl[index];
                     });
                   },
                   title: Text("hello",style: TextStyle(fontFamily: '${fontl[index]}'), ),
                 );
               },);
             },context: context);
           }, child: Text("font style"))                
                           
    ],)),
        ],
           ),),

    );
  }
}
