# flutter_demo
~~~
flutter 的用法。
~~~

## 一、Dart语法
### 1.1 变量
* 1.Object
>Object是所有类的基类，Object声明的变量可以是任意类型
~~~dart
    Object name1 = 'name';
~~~

* 2.var
> var声明的变量在赋值的那一刻，决定了它是什么类型
~~~dart
    var name2 = "name2";
~~~

* 3.dynamic
> dynamic声明的变量不是在编译时候确定实际类型的, 而是在运行时

~~~dart
    dynamic name3 = "name3";
~~~

### 1.2 常量
* 1.final
> final声明的变量只能被赋值一次 运行时常量,指的是在运行时第一次使用时才初始化
~~~dart
    final name4 = "name4";
~~~

* 2.const
> const声明的变量是编译时常量，指的是在编译时就已经确定的值
~~~dart
    const name5 = "name5";
~~~

### 1.3 类型
* 1.String
> 字符串类型
~~~dart
    String name6 = "name6";
    //多行字符串
    String name7 =  '''
                     you can create
                     multi-line strings like this one.
                     '''
// 转义
  print(r"换行符：\n"); //换行符:\n r:不需要转义
  print("换行符:\\n"); //换行符:\n
~~~

* 2.numbers
> 数字类型
~~~dart
    int a = 1;
    double b = 1.1;
~~~

* 3.booleans
> 布尔类型
~~~dart
    bool isTrue = true;
~~~

* 4.lists
> 列表类型
~~~dart
    List list = [1,2,3];
    List<int> list2 = [1,2,3];
~~~

* 5.maps
> 映射类型
~~~dart
    Map map = {"name":"zhangsan","age":18};
    Map<String,int> map2 = {"name":"李四","age":18};
        map2["name"] = "张三";
        map2["name"] = 20;
~~~

* 6.runes
> 表示UTF-32字符序列
~~~dart
    Runes input = new Runes('\u{1f605}');
    print(new String.fromCharCodes(input));
~~~

* 7.symbols
> 操作符标识符，可以看作C中的宏。表示编译时的一个常量
~~~dart
    # Symbol
    Symbol symbol = #name;
    print(symbol);
~~~

### 1.4 运算符
* 1.算术运算符
> + - * / % ~/
~~~dart
    int a = 10;
    int b = 3;
    print(a + b); //13
    print(a - b); //7
    print(a * b); //30
    print(a / b); //3.3333333333333335
    print(a % b); //1
    print(a ~/ b); //3
~~~
* 2.关系运算符
> == != > < >= <=
~~~dart
    int a = 10;
    int b = 3;
    print(a == b); //false
    print(a != b); //true
    print(a > b); //true
    print(a < b); //false
    print(a >= b); //true
    print(a <= b); //false
~~~
* 3.逻辑运算符
> ! && ||
~~~dart
    bool isTrue = true;
    bool isFalse = false;
    print(!isTrue); //false
    print(isTrue && isFalse); //false
    print(isTrue || isFalse); //true
~~~
* 4.赋值运算符
> = += -= *= /= %= ~/=
~~~dart
    int a = 10;
    int b = 3;
    a += b; //a = a + b
    a -= b; //a = a - b
    a *= b; //a = a * b
    a /= b; //a = a / b
    a %= b; //a = a % b
    a ~/= b; //a = a ~/ b
~~~
* 5.条件表达式
~~~dart
    int a = 10;
    int b = 3;
    print(a > b ? a : b); //10
~~~

* 6.类型判断与转换
> as: 类型转换 is: 类型判断 is!：非类型判断
~~~dart
    var a = "1" as int;
    if(a is String){
        print(a);
    }
    if(a !is int){
        print(a);
    }
~~~
* 7.空安全操作符
> ?.安全判断  !.非空断言
~~~dart
    String a;
    print(a?.length); //null
    print(a!.length); //报错
~~~
* 8.级联运算符
>  ..可以在同一个对象上连续调用多个方法
~~~dart
    var a = new Person();
    a..name = "zhangsan"
     ..age = 18
     ..work();
~~~
* 1.4 异常处理
> try-catch-finally
~~~dart
    try{
        int a = 10 ~/ 0;
    }catch(e){
        print(e);
    }finally{
        print("finally");
    }
~~~


## 三、异步编程
### 3.1 isolate
> isolate是Dart的并发模型，它不共享内存，不共享状态，不共享数据，通过消息传递的方式进行通信
```dart
 var receivePort = new ReceivePort();
  Isolate.spawn(entryPoint, receivePort.sendPort);
  receivePort.listen((t) {
    print(t);
  });
~~~

void entryPoint(SendPort sendPort) {
  i = 200;
  sendPort.send("Hello from entryPoint");
}

### 3.2 Future
> Future是Dart中表示异步操作的结果，它是一个抽象类，它的实现类有Future、FutureOr、Completer、Stream、StreamController等
```dart
    Future.delayed(Duration(seconds: 3),(){
        return "hello";
    }).then((value){
        print(value);
    }).catchError((e){
        print(e);
    }).whenComplete((){
        print("whenComplete");
    });
```
### 3.3 stream
> Stream是Dart中表示异步数据流的类，它是一个抽象类，它的实现类有Stream、StreamController、StreamSubscription等
```dart
    Stream.fromFutures([Future.value("hello"),Future.value("world")]).listen((event) {
      print(event);
    });
```
1. 多订阅
```dart
    StreamController<int> streamController = StreamController<int>();
    Stream<int> stream = streamController.stream;
    stream.listen((event) {
      print("listen1:$event");
    });
    stream.listen((event) {
      print("listen2:$event");
    });
    streamController.add(1);
    streamController.add(2);

    //转成广播流
      Stream<List<int>> steam = new File(
          r"D:\work\code\soul\AndroidForward\flutter\flutter_demo\lib\drat\a.txt")
          .openRead();

        var listen = steam.asBroadcastStream().listen((s) { //多订阅
            //分段读取
            print("stream:执行");
            // dst.writeAsBytes(s, mode: FileMode.append);
        });

        var listen = steam.asBroadcastStream().listen((s) { //多订阅
            //分段读取
            print("stream:执行");
            // dst.writeAsBytes(s, mode: FileMode.append);
        });

```
### 3.4 async/await
> async/await是Dart中用于处理异步操作的关键字，async用于标记一个函数是异步的，await用于等待一个异步操作完成
```dart
    void main() async{
      print("start");
      String result = await getNetworkData();
      print(result);
      print("end");
    }

    Future<String> getNetworkData() async{
      return Future.delayed(Duration(seconds: 3),(){
        return "network data";
      });
    }
```






