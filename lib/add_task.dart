import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTask extends StatelessWidget {
  late String titulo;
  late String descricao;
  late DateTime data;
  late bool excluido;
  late bool feito;

  AddTask(this.titulo, this.descricao, this.data, this.excluido, this.feito);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

    Future<void> addTask() {
      // Call the user's CollectionReference to add a new user
      return tasks
          .add({
            'titulo': titulo, // John Doe
            'descricao': descricao, // Stokes and Sons
            'data': data, // 42,
            'excluido': excluido,
            'feito': feito
          })
          .then((value) => print("Task adicionada"))
          .catchError((error) => print("Falha ao adicionar task: $error"));
    }

    return TextButton(
      onPressed: addTask,
      child: Text(
        "Add User",
      ),
    );
  }
}