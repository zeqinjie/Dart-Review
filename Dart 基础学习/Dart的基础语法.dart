main(List<String> args) {
  // defineVariable();
  // function();
  // stringFunction();
  // collectFunction();
  // firstFunction();
  // conditionalOperatorFunc();
  // processControlFunc();
  classFunc();
}

class Person {
  final String name;
  const Person(this.name);
}

/***************  声明变量 ******************/
void defineVariable() {
  // 变量声明(var/final/const)
  // var 声明变量
  var age = 20;
  // age = "abc";
  age = 30;
  // final声明常量
  final height = 1.88;

  // const声明常量
  const address = "广州市";

  // final和const的区别
  // const date1 = DateTime.now(); 写法错误
  final date2 = DateTime.now();

  // 在Dart2.0之后, const可以省略
  const p1 = const Person("why");
  const p2 = const Person("why");
  const p3 = const Person("lilei");

  print(identical(p1, p2)); // true
  print(identical(p2, p3)); // false

  // 在Dart 2.12 之后, 默认可选类型需要加 ? 以前默认不加
  String? optionName = null;
  optionName = "zhengzeqin";
}

/***************  字符串 ******************/
void stringFunction() {
  // 1.定义字符串的方式
  var s1 = 'Hello World';
  var s2 = "Hello Dart";
  var s3 = 'Hello\'Fullter';
  var s4 = "Hello'Fullter";

  // 2.表示多行字符串的方式
  var message1 = '''
  哈哈哈
  呵呵呵
  嘿嘿嘿''';

  print('my name is ${message1}');

  // 3.拼接其他变量
  var name = 'coderwhy';
  var age = 18;
  var height = 1.88;
  print('my name is ${name}, age is $age, height is $height');

  // 字符串和数字转化
  // 1.字符串转数字
  var one = int.parse('111');
  var two = double.parse('12.22');
  print('${one} ${one.runtimeType}'); // 111 int
  print('${two} ${two.runtimeType}'); // 12.22 double

  // 2.数字转字符串
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
}

/***************  集合 ******************/
void collectFunction() {
  // List定义
  // 1.使用类型推导定义
  var letters = ['a', 'b', 'c', 'd'];
  print('$letters ${letters.runtimeType}');

  // 2.明确指定类型
  List<int> numbers = [1, 2, 3, 4];
  print('$numbers ${numbers.runtimeType}');

  // Set的定义 Set和List最大的两个不同就是：Set是无序的，并且元素是不重复的。
  // 1.使用类型推导定义
  var lettersSet = {'a', 'b', 'c', 'd'};
  print('$lettersSet ${lettersSet.runtimeType}');

  // 2.明确指定类型
  Set<int> numbersSet = {1, 2, 3, 4};
  print('$numbersSet ${numbersSet.runtimeType}');

  numbers = Set<int>.from(numbers).toList();
  print(numbers);

  // 添加/删除/包含元素
  numbers.add(5);
  numbersSet.add(5);
  print('$numbers $numbersSet');

  numbers.remove(1);
  numbersSet.remove(1);
  print('$numbers $numbersSet');

  print(numbers.contains(2));
  print(numbersSet.contains(2));

  // List根据index删除元素
  numbers.removeAt(3);
  print('$numbers');

  // Map的定义
  // 1.使用类型推导定义
  var infoMap1 = {'name': 'why', 'age': 18};
  print('$infoMap1 ${infoMap1.runtimeType}');

  // 2.明确指定类型
  Map<String, Object> infoMap2 = {'height': 1.88, 'address': '北京市'};
  print('$infoMap2 ${infoMap2.runtimeType}');

  // Map的操作
  // 1.根据key获取value
  print(infoMap1['name']); // why

  // 2.获取所有的entries
  print(
      '${infoMap1.entries} ${infoMap1.entries.runtimeType}'); // (MapEntry(name: why), MapEntry(age: 18)) MappedIterable<String, MapEntry<String, Object>>

  // 3.获取所有的keys
  print(
      '${infoMap1.keys} ${infoMap1.keys.runtimeType}'); // (name, age) _CompactIterable<String>

  // 4.获取所有的values
  print(
      '${infoMap1.values} ${infoMap1.values.runtimeType}'); // (why, 18) _CompactIterable<Object>

  // 5.判断是否包含某个key或者value
  print(
      '${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}'); // true true

  // 6.根据key删除元素
  infoMap1.remove('age');
  print('${infoMap1}'); // {name: why}
}

/***************  函数 ******************/
void function() {
  // 可选参数: 位置可选参数 - 命名可选参数
  // 注意: 只有可选参数才可以有默认值
  // 位置可选参数: [int age, double height]
  // 实参和形参在进行匹配时, 是根据位置的匹配
  sayHello1("zhengzeqin", 1, 2, 3);
}

void sayHello1(String name, [int age = 10, double height = 2, int money = 0]) {
  print("sayHello1 name: $name  age: $age age: $height money: $money");
}

// 命名可选参数
void sayHello2(String name, {int age = 10, double height = 3.14}) {
  print("sayHello2 name: $name  age: $age age: $height");
}

// 函数是一等公民: 可以将函数赋值给一个变量, 也可以将函数作为另外一个函数的参数或者返回值来使用
void firstFunction() {
  // 1.直接找到另外一个定义的函数传进去
  // test(bar);

  // 2.匿名函数 (参数列表) {函数体};
  translationFunc(() {
    print("匿名函数被调用");
    return 10;
  });

  var movies = ['盗梦空间', '星际穿越', '少年派', '大话西游'];

  //  使用forEach遍历: 有名字的函数
  printElement(item) {
    print(item);
  }

  movies.forEach(printElement);

  // 使用forEach遍历: 匿名函数
  movies.forEach((item) {
    print(item);
  });
  movies.forEach((item) => print(item));

  // 3.箭头函数: 条件, 函数体只有一行代码
  translationFunc(() => print("箭头函数被执行"));

  // 4. 使用别名定义参数 要求: 传入一个函数 & 匿名函数
  calculateFunc((num1, num2) {
    return num1 * num2;
  });

  // 5. 声明函数，调用
  var add = addFunc();
  print(add(20, 30));
}

// 函数可以作为另外一个函数的参数
void translationFunc(Function foo) {
  foo();
}

void bar() {
  print("bar函数被调用");
}

// 使用别名定义函数类型
typedef Calculate = int Function(int num1, int num2);

void calculateFunc(Calculate calc) {
  calc(20, 30);
}

Calculate addFunc() {
  return (num1, num2) {
    return num1 * num2;
  };
}

/***************  赋值运算符 ******************/
// 条件运算符
void conditionalOperatorFunc() {
  // 1.??=:
  // 当原来的变量有值时, 那么??=不执行
  // 原来的变量为null, 那么将值赋值给这个变量
  var name = null;
  name ??= "lilei";
  print(name);

  // ??:
  // ??前面的数据有值, 那么就使用??前面的数据
  // ??前面的数据为null, 那么就使用后面的值
  var name2 = null;
  var temp = name2 ?? "lilei";
  print(temp);
}

class Animal {
  String? name;

  Animal(this.name);

  void run() {
    print("running");
  }

  void eat() {
    print("eating");
  }
}

// 级联运算符
void cascadeOperatorFunc() {
  // 级联运算符
  var p = Animal("zhengzeqin")
    ..name = "why"
    ..eat()
    ..run();
}

/***************  流程控制 ******************/
void processControlFunc() {
  for (var i = 0; i < 5; i++) {
    print(i);
  }

  var names = ['why', 'kobe', 'curry'];
  for (var name in names) {
    print(name);
  }

  var direction = 'east';
  switch (direction) {
    case 'east':
      print('东面');
      break;
    case 'south':
      print('南面');
      break;
    case 'west':
      print('西面');
      break;
    case 'north':
      print('北面');
      break;
    default:
      print('其他方向');
  }
}

/***************  对象 ******************/
void classFunc() {
  var hunman = Human(12);
  print("hunman: $hunman");
}

class Runner {
  // 📢 在Dart 2.12 之后, 默认可选类型需要加 ? 以前默认不加 否则默认的无参构造函数不能编译通过
  String? name;
  int? age;
}

class Human {
  // 📢 在Dart 2.12 之后, 默认可选类型需要加 ? 以前默认不加 否则默认的无参构造函数不能编译通过
  String? name;
  int? age;

  // Human(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  // 📢 默认是无惨构造函数，声明参数构造函数，则系统默认无参构造函数就不存在
  // Human(this.name, this.age); // 语法糖等同注释部分

  // 初始化列表页
  Human(this.age) : name = "zhengzeqin age is $age";

  // 命名构造方法
  Human.withArgments(String name, int age) {
    this.name = name;
    this.age = age;
  }

  // 命名一个重定向构造函数
  Human.form(int age) : this(age);

  // 常量构造方法 参数上面 const 部分

  // 工程构造方法, 📢 如果存在了同名构造函数，则无法再实现工厂构造函数
  // factory Human(Int age) {
  //   return Human.withArgments("zhengzeqin", age);
  // }

  // setter && getter
  String? get getName {
    return name;
  }

  set setName(String name) {
    this.name = name;
  }

  @override
  String toString() {
    return 'name=$name age=$age';
  }
}

// 抽象类
abstract class Shape {
  double getArea();
  // 📢 如果有实现体，实现的类可以不实现该抽象方法
  void getName() {}
}

class Circle extends Shape {
  double? r;

  Circle(this.r);

  @override
  getArea() {
    final rr = r ?? 0;
    return rr * rr * 3.14;
  }
}

class Reactangle extends Shape {
  double w = 0;
  double h = 0;

  Reactangle(this.w, this.h);

  @override
  getArea() {
    return w * h;
  }
}

/***************  隐式接口 ******************/
// Dart中的接口比较特殊, 没有一个专门的关键字来声明接口.
// 默认情况下，定义的每个类都相当于默认也声明了一个接口，可以由其他的类来实现(因为Dart不支持多继承)
// 通过 implements 实现接口
abstract class Player {
  play();
}

abstract class Flyer {
  fly();
}

class SuperManer implements Player, Flyer {
  @override
  play() {
    print('超人在玩');
  }

  @override
  fly() {
    print('超人在飞');
  }
}

/***************  Mixin混入 ******************/
// implements 的方式要求必须对其中的方法进行重新实现, with 则不需要
// 使用 with 方式混入 mixin 类，等同多继承
// on 关键字限定指定类的子类可以使用当前混入（不加默认限定为 Object）
mixin Runing {
  var name = "";
  run() {
    print('在奔跑');
  }
}

mixin Flying {
  fly() {
    print('在飞翔');
  }
}

class SuperWoman with Flying, Runing {
  void sayHello() {
    print("hello my name is $name");
  }
}

/***************  泛型 ******************/
void genericFunc() {
  // 限制类型
  var names1 = <String>['why', 'kobe', 'james'];
  List<String> names2 = ['why', 'kobe', 'james'];

  // 对类型进行显示
  Map<String, dynamic> infos1 = {'name': 'why', 'age': 18};
  var infos2 = <String, dynamic>{'name': 'why', 'age': 18};
}

// 指定 T 是继承 num 类
class Location<T extends num> {
  T x;
  T y;

  Location(this.x, this.y);
}
