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
  IconData? _calIcons;

  final Map<String, IconData> _iconMap = {
    'ADD': Icons.add,
    'SUB': Icons.remove,
    'MUL': Icons.clear,
    'DIV': Icons.percent,
    //Map은 키-값 쌍을 저장하는 자료 구조입니다. 키와 값은 모두 다른 타입이 될 수 있습니다.
    // 키를 사용하여 값을 검색하고 가져올 수 있으며, 키를 통해 값이 매핑되어 저장
  };

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
                  Padding(
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
                              Icon(_calIcons),
                              Text('$_buttonText')
                            ],
                          ),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                          onPressed: () {
                            setState(() {
                              var inputValue1=double.parse(value1.value.text);
                              var inputValue2=double.parse(value2.value.text);
                              var result;
                              if(_buttonText=='ADD'){
                                result = inputValue1 + inputValue2;
                              }else if(_buttonText=='SUB'){
                                result = inputValue1 - inputValue2;
                              }else if(_buttonText=='MUL'){
                                result = inputValue1 * inputValue2;
                              } else{
                                result = inputValue1 / inputValue2;
                              }
                              sum='$result';
                            });
                          })),
                  Padding(padding: EdgeInsets.all(15),
                      child: DropdownButton(items: _dropDownMenuItems,onChanged: (String? value){
                        setState(() {
                          _buttonText=value;
                          _calIcons = _iconMap[value!];
                          // 매개변수인 value가 null일 경우 예외가 발생하기 때문에,
                          // 이를 방지하기 위해 null이 아닌 값을 가정
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
    _iconMap['ADD'] = Icons.add;

    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
      /*
    buttonList 리스트에 있는 아이템들을 DropdownMenuItem 위젯으로 만들어
    _dropDownMenuItems 리스트에 추가하는 역할
    */
    }


    _buttonText=_dropDownMenuItems[0].value;
    _calIcons = _iconMap[_buttonText!];
  }
}
