
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/create_edit_note_page.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[
    "Primeiro Itel"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anotações"),
        centerTitle: true,
      

      ),
      body: SingleChildScrollView(
        child:Column(
        children: [
          for (var i=0;i<notes.length;i++)
          Center(
        child: Card(
          child: ListTile(
          title: Text(notes[i]),
          onTap: ()async {
            var description = await Navigator.pushNamed(context, "/create-note",arguments: notes[i]);
          if(description != null){
            notes[i] = description as String;
          setState(() {
            
          });
          }
           
          },
        )
        ),
      ),

      
        ],
      ) 
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.note_add),
        onPressed: () async{
          var description = await Navigator.pushNamed(context, "/create-note");
          if(description != null){
            notes.add(description as String);
          setState(() {
            
          });
          }
        //Navigator.push(context, 
          //MaterialPageRoute(builder: (context)=>(CreateNotePage()))
          //
          //).then((value)=>print(value));
          
        },

      ),
    );
  }
}