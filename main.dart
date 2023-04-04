import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState(){
    return _MyApp();
  }
}
class _MyApp extends State<MyApp>{
  var switchValue=false;
  String test='안녕하세요!';
  Color _color=Colors.blue;
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity

      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('$test'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(_color),
                ),
                onPressed: () {
                  if(_color==Colors.blue) {
                    setState(() {
                      test='20192369이재훈';
                      _color=Colors.amber;
                    });
                  }else{
                    setState(() {
                      test='안녕하세요!';
                      _color=Colors.blue;
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              Switch(
                value: switchValue,
                onChanged: (value){
                  setState(() {
                    switchValue=value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
