import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  static const String _title ="Widget Example";

  Widget build(BuildContext context){
    return MaterialApp(
    title: _title,
    home:WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget{
  _WidgetExampleState createState()=>_WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp>{
  String sum='';
  TextEditingController value1=TextEditingController();
  TextEditingController value2=TextEditingController();

  List _buttonList=['ADD','SUB','MUL','DIV'];
  List <DropdownMenuItem<String>> _dropDownMenuItems =new List.empty(growable: true);
  String? _buttonText;



  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title: Text('Widget Example'),
    ),
    body: Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text('RESULT: $sum', style: TextStyle(fontSize: 20),),
            ),
            const Padding(
              padding:EdgeInsets.all(15),
              child: Text('flutter has padding'),
            ),
           Padding(padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField( keyboardType: TextInputType.number, controller: value1,
              ),
          ),
            Padding(padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField( keyboardType: TextInputType.number, controller: value2,
              ),
            ),
         Padding(
           padding: EdgeInsets.all(15),
             child: ElevatedButton(
                 child: Row(
                 children: <Widget>[
                   Icon(Icons.add),
                   Text('ADD')
                 ],
             ),
               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                 onPressed: () {
                   setState(() {
                     int result=int.parse(value1.value.text)+int.parse(value2.value.text);
                     sum='$result';
                   });
                 })),
            Padding(padding: EdgeInsets.all(15),
                child: DropdownButton(items: _dropDownMenuItems,onChanged: (String? value){
                  setState(() {
                    _buttonText=value;

                  });
                },value: _buttonText)

            )


          ],
        )
      ),
    )
    );
  }
  @override
  void initState(){
    super.initState();
    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }

    _buttonText=_dropDownMenuItems[0].value;
  }
}
