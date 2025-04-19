import 'dart:ffi';

main() {
  //1.变量
  Object name1 = 'name'; //与Java一样Object是所有类的基类，Object声明的变量可以是任意类型
  var name2 = "name2"; //声明的变量在赋值的那一刻，决定了它是什么类型
  dynamic name3 = "name3"; //不是在编译时候确定实际类型的, 而是在运行时

  //2.final与const
  // 如果不打算改变一个变量，可以使用final和const，它们可以替代任何类型，只能在声明时初始化，且不能改变。
  //final是运行时常量，而const是编译器常量
  const a = 1;
  final b = 2;
  final int c = 1;
  const int d = 4;
  //错误的写法 const 不能使用final 修饰的变量

  //3、内置类型
  //3.1 numbers

  //3.2 string
  var name = "lance";
  var a3 = "my name is$name！";
  var a4 = "my name is ${name}！";
  var a5 = "my name" "is";
  //多行字符串
  var a6 = '''
  you can create
  multi-line strings like this one.
  ''';

  // 转义
  print(r"换行符：\n"); //换行符:\n r:不需要转义
  print("换行符:\\n"); //换行符:\n

  //3.3 booleans
  var isTrue = true;

  //3.4 lists(arrays)
  var list = [1, 2, 3];
  print(list[list.length - 1]); //1
  list[0] = 2;
  var list2 = List.filled(3, 0); //创建一个长度为3的数组，默认值为0
  list2[0] = 2;
  // list2.add(2);报错
  print(list2); //[2, 0, 0]
  var list3 = const [1, 2, 3];
  // list3.add(4); //报错

  //3.5 maps
  var company = {"a": "阿里巴巴", "t": "腾讯"};
  print(company["a"]); //阿里巴巴
  var company2 = Map();
  company2["a"] = "阿里巴巴";
  company2["t"] = "腾讯";
  //添加元素
  company2["b"] = "百度";
  //获取元素
  var b2 = company2["b"];
  //修改元素
  company2["a"] = "alibaba";
  //删除元素
  company2.remove("a");
  print(company2); //{t: 腾讯, b: 百度}
  //3.6 runes(用于在字符串中表示Unicode字符)
  var clapping = "\u{1f44f}"; //5个16进制 需要使用{}
  print(clapping); //
  //获取16位代码单元
  print(clapping.codeUnits); //[55357, 56399]
  //获取Unicode字符
  print(clapping.runes.toList()); //[128079]

  //fromCharCode 根据字符码创建字符串
  print(String.fromCharCode(128079));
  print(String.fromCharCodes(clapping.runes));
  print(String.fromCharCodes([55357, 56399]));
  print(String.fromCharCode(0x1f44f));

  Runes input =
      new Runes('\u2665 \u{1f605} \u{1f603} \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(String.fromCharCodes(input));

  //3.7 symbols
  //操作符标识符，可以看作C中的宏。表示编译时的一个常量
  var i = #A;
  switch (i) {
    case #A:
      print("A");
      break;
    case #B:
      print("B");
      break;
  }
  var b3 = new Symbol("b");
  print(#b == b3); //true

  //4.操作符
  //4.1 类型判断操作符
  //as: 类型转换
  var a7 = true;
  print("a7 is String:${a7 as bool}"); //true
  //is: 类型判断
  var a8 = true;
  print("a8 is String:${a8 is String}"); //false
  //is!：非类型判断
  var a9 = true;
  print("a9 is not String:${a9 is! String}"); //true

  //4.2 条件表达式
  //condition ? expr1 : expr2 如果condition为true，执行expr1，否则执行expr2
  var condition = true;
  if (condition) {
    print("true");
  } else {
    print("false");
  }
  //expr1 ?? expr2 如果expr1为null，执行expr2，否则执行expr1
  var expr1 = null;
  var expr2 = 2;
  print(expr1 ?? expr2); //2
  //4.3 级联操作符
  //..可以在同一个对象上连续调用多个方法
  var sb = StringBuffer();
  sb
    ..write("foo")
    ..write("bar");
  print(sb.toString()); //foobar
  //4.4 空安全操作符
  String? sb1;
  print(sb1?.length); //null
  //4.5 紧俏操作符
  // !.如果对象为null，抛出异常
  var sb2;
  // print(sb2!.length); //抛出异常
  var count = add3(1, 2);
  count = add4(a: 1, b: 2);
  count = add5();
  print(count); //3
  list.forEach((i) {
    print("i:${i}");
  });
  //6 异常处理
  try {
    print(1 ~/ 0);
  } on int catch (e) {
  } catch (e, s) {
    print(e);
  }
  var listArray = [3, 7, 2, 5, 9, 10, 34];
  //写一个冒泡排序
  bubbleSort(listArray);
  print("冒泡排序:$listArray");
  //选择排序
  selectionSort(listArray);
  print("选择排序:$listArray");
  //插入排序
}

/**
 * 选择排序
 */
void selectionSort(List<int> listArray) {
  for (var i = 0; i < listArray.length - 1; i++) {
    var minIndex = i;
    for (var j = i + i; j < listArray.length; j++) {
      if (listArray[j] < listArray[minIndex]) {
        minIndex = j;
      }
    }
    var temp = listArray[i];
    listArray[i] = listArray[minIndex];
    listArray[minIndex] = temp;
  }
}

//5.函数/方法
int add(int a, int b) {
  return a + b;
}

add1(a, b) {
  return a + b;
}

add2(a, b) => a + b; //箭头函数，在箭头 (=>) 和分号 (;) 之间只能使用一个 表达式

//5.1一等方法对象
//函数可以赋值给变量
Function add3 = (int a, int b) {
  return a + b;
};
//5.2 可选命令参数
int add4({int? a, int? b}) {
  if (a == null || b == null) {
    return 0;
  }
  return a + b;
}

//5.3 默认参数值
int add5({int a = 1, int b = 2}) {
  return a + b;
}

//5.4 匿名方法
var list = ['apples', 'oranges', 'grapes', 'bananas', 'plums'];
// list.forEach((i) {
// print(list[i]);
// });

/**
 * 冒牌排序
 */
void bubbleSort(List list) {
  //第一遍排序
  for (var i = 0; i < list.length - 1; i++) {
    for (var j = 0; j < list.length - 1 - i; j++) {
      if (list[j] > list[j + 1]) {
        var temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}
