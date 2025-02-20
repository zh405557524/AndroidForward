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
  print(#b ==b3); //true

}
