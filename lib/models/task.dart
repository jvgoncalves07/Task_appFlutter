import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Task{
  late String id;
  late String titulo;
  late String descricao;
  late DateTime data;
  late bool excluido;
  late bool feito;

  Task( this.id, this.titulo, this.descricao, this.data, this.excluido, this.feito);

  Task.map (dynamic obj) {
    this.id = obj['id'];
    this.titulo = obj['titulo'];
    this.descricao = obj['descricao'];
    this.data = obj['data'];
    this.excluido = obj['excluido'];
    this.feito = obj['feito'];
  }
  String get iD => id;
  String get title => titulo;
  String get description => descricao;
  DateTime get date => data;
  bool get deleted => excluido;
  bool get done => feito;

  Map<String, dynamic>? toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['titulo'] = titulo;
    map['descricao'] = descricao;
    map['data'] = data;
    map['excluido'] = excluido;
    map['feito'] = feito;
  }

  Task.fromMap(Map<String, dynamic> map, String id){
    this.id = map['id'];
    this.titulo = map['titulo'];
    this.descricao = map['descricao'];
    this.excluido = map['excluido'];
    this.feito = map['feitp'];
    this.data = map['data'];
  }
  

}