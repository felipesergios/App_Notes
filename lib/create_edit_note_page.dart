import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
class CreateNotePage extends StatefulWidget{
  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      if(ModalRoute.of(context)!.settings.arguments != null){
      description = ModalRoute.of(context)!.settings.arguments as String;
      textController.text = description;
      setState(() {
        isEdit = true;  
      });  
    }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
    appBar: AppBar(
      title: Text(isEdit ? "Editar uma anotação" : "Criar uma anotação"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: (){}, icon: Icon(Icons.delete
          ))
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
        controller: textController,    
        maxLines: 10,
        maxLength: 500,
        onChanged: (value) {
          description = value;
          setState(() {
            
          });
        },
        decoration: InputDecoration(
        labelText: "Descrição",
        ),
      ),
      SizedBox(
        height: 32,
      ),
      if(description.isNotEmpty)
      Row(
        children: [
         Expanded(child: 
          ElevatedButton(onPressed: (){
            Navigator.pop(context,description);
            }, child: Text("Salvar")),
         ),
        ],
      ),
        ],
      ),
    )
   );
  }
}