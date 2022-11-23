import 'package:flutter/material.dart';
import 'package:shayari_app/model.dart';
import 'package:shayari_app/page3.dart';

class page2 extends StatefulWidget {
  int index;
  page2(this.index);
  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
 List<String> l=[];

  @override
  void initState() {
        super.initState();
        model m=new model();

        if(widget.index==0)
          {
              l = model().Inspire;
          }
        else if(widget.index==1)
          {
            l= model().life;
          }
        else  if(widget.index==2)
        {
          l = model().love;
        }
        else if(widget.index==3)
        {
          l= model().Romentic;
        }
        else if(widget.index==4)
        {
          l= model().political;
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(model().name[widget.index]),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {
              }, icon: Icon(Icons.share)),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.more_vert_outlined)),
            ],
          ),
        ],
      ),
      body: ListView.builder(itemCount: l.length,itemBuilder: (context, index) {
        return Card(
          color: Colors.pink,
          child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return page3(index,l);
                },));
              },
            child: ListTile(
              title:  Text(l[index],maxLines: 1,overflow: TextOverflow.ellipsis,),
               leading: Container(
                height: 60,
                width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(model().shyimage[widget.index]),
                    fit: BoxFit.cover)
                      ),
              ),
              trailing: Icon(Icons.navigate_next,size: 30),
        ),
          ),
        );
      },),
    );
  }


}
