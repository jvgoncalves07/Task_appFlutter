import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AddTaskPage extends StatefulWidget{

  
  @override
  _AddTaskPage createState() => _AddTaskPage();



}

  class _AddTaskPage extends State<AddTaskPage>{
    final _key = GlobalKey<FormState>();
    var titulo = TextEditingController();
    var descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Form(
            key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Criar nova tarefa",
               style: TextStyle(
                 color: Colors.blue,
                 fontSize: 32,
                 fontWeight: FontWeight.w600,
               ),
              ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: titulo,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Titulo não pode ser vazio";
                      }else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Titulo",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: descricao,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Descrição não pode ser vazio";
                      }else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Descrição",
                      labelStyle: TextStyle(color: Colors.black)),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ignore: deprecated_member_use
                      FlatButton(
                    onPressed: () async{
                      if(_key.currentState!.validate()){
                        await FirebaseFirestore.instance.collection('tasks').add({
                        'titulo': titulo.text,
                        'descricao': descricao.text,
                        'data': Timestamp.now(),
                        'feito': false,
                        'excluido': false,
                      });

                       Navigator.of (context, rootNavigator: true) .pop ();
                      }
                      

                    
                  },
                  color: Colors.green,
                  child: Text('Salvar'),
                 ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: Text('Cancelar'),
                        color: Colors.blue,
                        )
                    ],
                  )
                ],
              ),
              ),
            ],
          ),

          ),
        ),
      ),
    );
  }




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}