main() {
  var p = Point.y(0);
  var p2 = Point2.froMap({"x": 1, "y": 2});
  print(p2.y);

  var p1 = const ImmutablePoint(1, 2);
  var p3 = const ImmutablePoint(1, 2);
  print(p1 == p3);

  var p4 = Point4(1, 2);
  var p5 = Point4(3, 4) + p4;

  print("${p5.x}+${p5.y}");

  var p6 = Point5(1, 2);
  p6(3, 4);
  print(PChild().getMessage()); //输出 B

  var f = Fraction(48, 24);
  f.fractionOut();
}

//构造方法
class Point {
  late num x;
  late num y;

  Point(this.x, this.y);

  // Point(this.x);
  Point.y(this.y) {
    x = 0;
  }
}

//初始化列表
class Point2 {
  late num x;
  late num y;

  Point2(this.x, this.y);

  Point2.froMap(Map map)
      : x = map["x"],
        y = map["y"];

  Point2.x(int i)
      : x = i,
        y = 0;
}

//重定向构造函数
class Point3 {
  late num x;
  late num y;

  Point3(this.x, this.y);

  Point3.froMap(Map map) : this(map["x"], map["y"]);

  Point3.x(int i) : this(i, 0);
}

//常量构造函数

class ImmutablePoint {
  final num x;
  final num y;

  const ImmutablePoint(this.x, this.y);
}

//工厂构造函数
class Logger {
  late final String name;

  static final Map _cache = {};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  //私有构造函数
  Logger._internal(this.name);
}

//单例
class Manager {
  static Manager? _instance;

  factory Manager.getInstance() {
    if (_instance == null) {
      _instance = Manager._internal();
    }
    return _instance!;
  }

  Manager._internal();
}

//可覆写的操作符
class Point4 {
  late int x;
  late int y;

  Point4 operator +(Point4 other) {
    return Point4(x + other.x, y + other.y);
  }

  Point4(this.x, this.y);
}

//抽象类
abstract class Animal {
  void eat();
}

abstract class Parent {
  String name;

  Parent(this.name);

  factory Parent.test(String name) {
    return Child(name);
  }

  void printName();
}

class Child extends Parent {
  Child(String name) : super(name);

  @override
  void eat() {}

  @override
  void printName() {}
}

//接口与继承的区别在于：
//
// 1、单继承，多实现。
//
// 2、继承可以有选择的重写父类方法并且可以使用`super`，实现强制重新定义接口所有成员。
class Listener {
  void onComplete() {}

  void onFailure() {}
}

class MyListener implements Listener {
  @override
  void onComplete() {}

  @override
  void onFailure() {}
}

//可调用的类
class Point5 {
  late int x;
  late int y;

  Point5(this.x, this.y);

  //可调用的类
  call(int x, int y) {
    return Point5(x, y);
  }
}
//混合 mixins Mixins 是一种在多类继承中重用 一个类代码的方法

mixin class A {
  void a() {}

  String getMessage() => 'A';
}

mixin class B {
  void b() {}

  String getMessage() => 'B';
}

// class C with A,B{
//   void c(){}
// }
class P with A, B {
  String getMessage() => 'P';
}

class PChild extends P {}

class AB extends P with A, B {}

class BA extends P with B, A {}

//作业:​	设计一个表示分数的类`Fraction`。这个类用两个int类型的变量分别表示分子和分母。这个类的构造函数是：`Fraction(num a, num b)`构造一个x/y的分数。这个类要提供以下的功能：
//
// - 将自己与另一个分数相加，产生一个新的Fraction的对象；
// - 将自己和另一个分数相乘，产生一个新的Fraction的对象；
// - 将自己以**分子/分母**的形式输出，如果分数是1/1，应该输出1；当分子大于分母时，不需要提出整数部分，即3/1是一个正确的输出；输出时需要为最简形式，如：2/4 应该是 1/2

class Fraction {
  var numberA;
  var numberB;

  Fraction(this.numberA, this.numberB);

  Fraction operator +(Fraction other) {
    return Fraction(numberA + other.numberA, numberB + other.numberB);
  }

  Fraction operator *(Fraction other) {
    return Fraction(numberA * other.numberA, numberB * other.numberB);
  }

  void fractionOut() {
    if (numberA % numberB == 0) {
      print((numberA / numberB).toInt());
    } else {
      var fold = numberA % numberB;
      print("${(numberA / fold).toInt()}/${(numberB / fold).toInt()}");
    }
  }
}
