// ignore_for_file: use_key_in_widget_constructors

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/authentication_service.dart';
import 'package:task_app/lista_task.dart';
import 'package:task_app/views/home_page.dart';
import 'package:task_app/views/sign_in_page.dart';
import 'package:task_app/views/sign_up_page.dart';


void main() async {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {


   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationService>(
        create:(_)=>AuthenticationService(),
      ),
      StreamProvider(
        create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        ),
    ],
    child: MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SignInPage(),
      routes: {
        HomePage.tag: (context) => HomePage(),
      },
    ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    
    if(firebaseUser != null){
      return HomePage();
    }
    return SignInPage();
  }
}


