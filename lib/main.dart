import 'package:flutter/material.dart';
void main(){
  runApp(new MyApp());
}
class MyApp extends StatelessWidget{
  @override
Widget build(BuildContext context){
  return new MaterialApp(
    title: "LetsChat",
    home: new Homepage(),
  );
}
}
class Homepage extends StatelessWidget{
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LetsChat"),

      ),
      body: new Chatscreen(),
    );
  }

}
class Chatscreen extends StatefulWidget{
  @override
  State createState() => new ChatscreenState();
    }
class ChatscreenState extends State<Chatscreen>{
   final List<Chatpage> msgs= <Chatpage>[];
     void _handlesubmit(String text){
       t.clear();
       Chatpage msg=new Chatpage(
         text: text,
       );
       setState((){
          msgs.insert(0,msg);
       });
           
     }
  final TextEditingController t=new TextEditingController();
  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blue,
      ),
          child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
         child:  new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
            decoration: new InputDecoration.collapsed(
              hintText: "Say hii",
            ),
            controller: t,
            onSubmitted: _handlesubmit,
          ),
              ),
              new Container(
margin: const EdgeInsets.symmetric(horizontal: 4.0),
child: new IconButton(
  icon: new Icon(Icons.send),
  onPressed: ()=>_handlesubmit(t.text),
),
              )
            ],
          ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
return new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index)=>msgs[index],
              itemCount: msgs.length,
            ),
          ),
          new Divider(
            height: 1.0,

          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child:_textComposerWidget(),
          )
        ],
      );

  }
}
 const String name="Raghu";

class Chatpage extends StatelessWidget {
  final String text;
   Chatpage({this.text});
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: new CircleAvatar(
            child: new Text(name[0]),
          ),
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(name,style: Theme.of(context).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            )

          ],
        )
        ],
      ),
    );
  }
}