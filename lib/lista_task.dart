import 'dart:async';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/database/database.dart';
import 'package:task_app/models/task.dart';

class ListaTasks extends StatefulWidget {
  _ListTasksState createState() => _ListTasksState();
}


class _ListTasksState extends State<ListaTasks>{

  late List<Task> itens;
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot>? taskInscricao;

  @override
  void initState() {
    super.initState();
    
    itens = [];
    taskInscricao!.cancel();

    taskInscricao =
    db.collection('tasks').snapshots().listen((snapshot) {
      final List<Task> tasks = snapshot.docs
      .map((DocumentSnapshot) => Task.fromMap(DocumentSnapshot.data(), DocumentSnapshot.id),
      ).toList();

      setState(() {
        this.itens = tasks;
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    taskInscricao!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: StreamBuilder<QuerySnapshot>(
        stream: getListaTasks(),
        builder : (context,snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            default:
            List<DocumentSnapshot> documentos = 
              snapshot.data!.docs;
            return ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(itens[index].title,
                  style: TextStyle(fontSize: 22)),
                  subtitle: Text(itens[index].descricao,
                  style: TextStyle(fontSize: 22)),
                leading: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        deletaTask(context, documentos[index], index);
                      }, 
                      icon: const Icon(Icons.delete_forever
                      )
                    )
                  ],),
                );
              }
            );
          }
      }
    ),
   );
  }
                
      
     /* RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
                
            },
            child: const Text("Sign Out"),
            );*/
    
  
  
  Stream<QuerySnapshot> getListaTasks(){
    return FirebaseFirestore.instance.collection('tasks').snapshots();
  }

  void deletaTask(BuildContext context,
  DocumentSnapshot doc, int position) async {
    db.collection('tasks').doc(doc.id).delete();

    setState(() {
      itens.removeAt(position);
    });
  }

}