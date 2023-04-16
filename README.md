# UI-UX
DART,FLUTTER

    final Map<String, IconData> _iconMap = {
    'ADD': Icons.add,
    'SUB': Icons.remove,
    'MUL': Icons.clear,
    'DIV': Icons.percent,
    }
   
  -  Map은 키-값 쌍을 저장하는 자료 구조입니다. 키와 값은 모두 다른 타입이 될 수 있습니다.

     키를 사용하여 값을 검색하고 가져올 수 있으며, 키를 통해 값이 매핑되어 저장합니다.

   - final은 상수를 선언할 때 사용하는 키워드입니다. 한 번 값이 할당되면 변경될 수 없기 때문에 안정적인 코드를 작성하는데 도움을 줄 수 있습니다.

   - IconData는 Material Design 아이콘 세트에서 사용되는 아이콘을 나타내는 클래스

    Padding(padding: EdgeInsets.all(15),
                child: DropdownButton(items: _dropDownMenuItems,onChanged: (String? value){
                  setState(() {
                    _buttonText=value;
                    _calIcons = _iconMap[value!]; 
                  });
                },value: _buttonText)
            )
        
- _dropDownMenuItems 리스트에 저장된 위젯들을 클릭하면 연산자와 연산자 아이콘을 변경하는 역할을 합니다.
- value!는 non-null assertion operator이며, 이를 사용하면 해당 변수가 null이 아님을 컴파일러에게 알려주는 역할을 합니다. 
<br>이를 통해 코드 작성 시 null safety를 보다 명확하게 보장할 수 있으며, 코드 작성 시 null 체크를 줄일 수 있습니다. 
