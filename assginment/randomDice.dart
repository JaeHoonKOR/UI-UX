import 'dart:math';

void main() {
  var random = Random(); //새로운 random객체 생성
  var dice = Dice(random); //생성자에게 전달
  var sum = 0; //주사위 합
  var rolls = 0; //몇번째 주사위인지

  while (sum < 100) {
    var result = dice.roll();
    sum += result;
    rolls++;
    print('$rolls번째 주사위: $result, 주사위 합: $sum');
  }

  print('주사위 합이 100을 넘었습니다. 총 $rolls번 굴렸습니다.');
}

class Dice {
  final Random _random; //_random은 Dice에서 사용될 난수 생성기

  Dice(this._random); //var dice가 보낸 random 객체받음.

  int roll() {
    return _random.nextInt(6) + 1;
  }
}
