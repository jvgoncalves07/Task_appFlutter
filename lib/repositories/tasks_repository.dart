import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_app/authentication_service.dart';
import 'package:task_app/database/database.dart';
import 'package:task_app/models/task.dart';

class TasksRepository extends ChangeNotifier{
  List<Task>_list =[];
  late FirebaseFirestore db;
  late AuthenticationService auth;

/*
leading: IconButton(
                    icon: Icon(
                      item['feito'] 
                      ? Icons.check_circle 
                      : Icons.radio_button_unchecked,
                      size: 32,
                      ),
                    onPressed: () => null,
                    ),*/
}