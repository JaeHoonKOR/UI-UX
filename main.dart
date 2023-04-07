import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Material Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialFlutterApp(),
    );//Maeterial Design기초 App bar, floating버튼
  }
}

class MaterialFlutterApp extends StatefulWidget{

  @override
  State<MaterialFlutterApp> createState(){
    return _MaterialFlutterApp();
  }
}

class _MaterialFlutterApp extends State<MaterialFlutterApp>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Material Design App'),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
          onPressed: (){

          }),
    );
  }
}