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
​```dart
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

## 四、widgets
### 4.1 StatefulWidget与StatelessWidget
* 1.StatefulWidget
 >  在 Flutter 里，StatefulWidget属于可在生命周期内改变状态的 widget基本概念
 >
 >  有状态的 widget 由两部分组成：
 >
 >  - **`StatefulWidget`类**：这个类本身是不可变的，它的作用是创建一个`State`对象。
 >  - **`State`类**：该类用于存储和管理 widget 的可变状态，并且能在状态改变时重建 widget。
 >
 >  ### 生命周期
 >
 >  `StatefulWidget`的生命周期包含以下关键阶段：
 >
 >  1. **创建阶段**：当`StatefulWidget`被插入到 widget 树时，会调用`createState`方法来创建对应的`State`对象。
 >  2. **初始化阶段**：`State`对象创建后，会调用`initState`方法，这是进行一次性初始化操作的好时机，例如设置定时器、初始化数据等。
 >  3. **构建阶段**：在`initState`之后，或者状态改变调用`setState`后，会调用`build`方法来构建 widget 的 UI。
 >  4. **更新阶段**：当 widget 的父级重建或者状态改变时，可能会调用`didUpdateWidget`方法。
 >  5. **销毁阶段**：当`StatefulWidget`从 widget 树中移除时，会调用`dispose`方法，可在此处进行资源释放操作，比如取消定时器。
 >
 >   #### 状态管理
 >
 >  ### 1. `setState`
 >
 >  - **适用场景**：适用于简单的、局部的状态管理，通常用于单个 `StatefulWidget` 内部状态的管理。
 >
 >  - **原理**：`setState` 是 `State` 类中的一个方法，当调用 `setState` 时，它会通知 Flutter 框架该状态发生了变化，框架会重新调用 `build` 方法来更新 UI。
 >
 >  - **示例代码**：
 >
 >    ```dar
 >    class _CounterWidgetState extends State<CounterWidget> {
 >      int _counter = 0;
 >    
 >      void _incrementCounter() {
 >        // 调用 setState 更新状态
 >        setState(() {
 >          _counter++;
 >        });
 >      }
 >    }
 >    ```
 >
 >    - **解释**：在这个示例中，`_CounterWidgetState` 类中定义了一个 `_counter` 变量来存储计数器的值。当用户点击按钮时，`_incrementCounter` 方法被调用，在该方法中调用 `setState` 来更新 `_counter` 的值，Flutter 框架会自动重新调用 `build` 方法来更新 UI 显示新的计数器值。
 >
 >  ### 2. `Provider`
 >
 >  - **适用场景**：用于在 widget 树中共享状态，适合中等规模的应用程序，能够方便地在不同的 widget 之间传递和管理状态。
 >  - **原理**：`Provider` 是一个轻量级的状态管理库，它通过 `InheritedWidget` 机制在 widget 树中传递数据。`Provider` 允许你将数据存储在一个公共的位置，并让多个 widget 可以访问和监听这些数据的变化。
 >  - **示例代码**：
 >
 >  ```dart
 >  import 'package:flutter/material.dart';
 >  import 'package:provider/provider.dart';
 >  
 >  // 定义一个状态类
 >  class Counter with ChangeNotifier {
 >    int _count = 0;
 >  
 >    int get count => _count;
 >  
 >    void increment() {
 >      _count++;
 >      // 通知所有监听者状态发生了变化
 >      notifyListeners();
 >    }
 >  }
 >  
 >  void main() {
 >    runApp(
 >      // 使用 ChangeNotifierProvider 提供状态
 >      ChangeNotifierProvider(
 >        create: (context) => Counter(),
 >        child: MyApp(),
 >      ),
 >    );
 >  }
 >  
 >  class MyApp extends StatelessWidget {
 >    @override
 >    Widget build(BuildContext context) {
 >      return MaterialApp(
 >        home: Scaffold(
 >          appBar: AppBar(
 >            title: Text('Provider Example'),
 >          ),
 >          body: Center(
 >            child: Column(
 >              mainAxisAlignment: MainAxisAlignment.center,
 >              children: [
 >                // 使用 Consumer 监听状态变化
 >                Consumer<Counter>(
 >                  builder: (context, counter, child) {
 >                    return Text(
 >                      'Counter: ${counter.count}',
 >                      style: TextStyle(fontSize: 24),
 >                    );
 >                  },
 >                ),
 >                SizedBox(height: 20),
 >                ElevatedButton(
 >                  onPressed: () {
 >                    // 获取状态并调用方法
 >                    Provider.of<Counter>(context, listen: false).increment();
 >                  },
 >                  child: Text('Increment'),
 >                ),
 >              ],
 >            ),
 >          ),
 >        ),
 >      );
 >    }
 >  }
 >  
 >  
 >  ```
 >
 >  - **解释**：在这个示例中，首先定义了一个 `Counter` 类，它继承自 `ChangeNotifier`，用于管理计数器的状态。在 `main` 函数中，使用 `ChangeNotifierProvider` 将 `Counter` 实例提供给整个应用程序。在 `MyApp` 中，使用 `Consumer` 来监听 `Counter` 状态的变化，并在状态变化时更新 UI。当用户点击按钮时，通过 `Provider.of(context, listen: false)` 获取 `Counter` 实例并调用 `increment` 方法来更新状态。
 >
 >  ### 3. `Bloc`（Business Logic Component）
 >
 >  - **适用场景**：适用于复杂的业务逻辑和状态管理，特别是在处理异步操作和事件驱动的场景中表现出色，常用于大型应用程序。
 >  - **原理**：`Bloc` 是一种基于事件驱动的状态管理模式，它将业务逻辑与 UI 分离。`Bloc` 接收事件（Event），处理这些事件并生成新的状态（State），UI 则监听这些状态的变化并更新自身。
 >  - **示例代码**：
 >
 >  ```dart
 >  import 'package:flutter/material.dart';
 >  import 'package:flutter_bloc/flutter_bloc.dart';
 >  
 >  // 定义事件
 >  abstract class CounterEvent {}
 >  
 >  class IncrementEvent extends CounterEvent {}
 >  
 >  // 定义状态
 >  abstract class CounterState {}
 >  
 >  class CounterValueState extends CounterState {
 >    final int value;
 >  
 >    CounterValueState(this.value);
 >  }
 >  
 >  // 定义 Bloc
 >  class CounterBloc extends Bloc<CounterEvent, CounterState> {
 >    CounterBloc() : super(CounterValueState(0)) {
 >      on<IncrementEvent>((event, emit) {
 >        final currentState = state as CounterValueState;
 >        emit(CounterValueState(currentState.value + 1));
 >      });
 >    }
 >  }
 >  
 >  void main() {
 >    runApp(
 >      BlocProvider(
 >        create: (context) => CounterBloc(),
 >        child: MyApp(),
 >      ),
 >    );
 >  }
 >  
 >  class MyApp extends StatelessWidget {
 >    @override
 >    Widget build(BuildContext context) {
 >      return MaterialApp(
 >        home: Scaffold(
 >          appBar: AppBar(
 >            title: Text('Bloc Example'),
 >          ),
 >          body: Center(
 >            child: Column(
 >              mainAxisAlignment: MainAxisAlignment.center,
 >              children: [
 >                BlocBuilder<CounterBloc, CounterState>(
 >                  builder: (context, state) {
 >                    final counterValue = (state as CounterValueState).value;
 >                    return Text(
 >                      'Counter: $counterValue',
 >                      style: TextStyle(fontSize: 24),
 >                    );
 >                  },
 >                ),
 >                SizedBox(height: 20),
 >                ElevatedButton(
 >                  onPressed: () {
 >                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
 >                  },
 >                  child: Text('Increment'),
 >                ),
 >              ],
 >            ),
 >          ),
 >        ),
 >      );
 >    }
 >  }
 >  ```
 >
 >  - **解释**：在这个示例中，首先定义了事件（`CounterEvent` 和 `IncrementEvent`）和状态（`CounterState` 和 `CounterValueState`）。然后定义了 `CounterBloc`，它继承自 `Bloc` 类，用于处理事件并生成新的状态。在 `main` 函数中，使用 `BlocProvider` 提供 `CounterBloc` 实例。在 `MyApp` 中，使用 `BlocBuilder` 监听 `CounterBloc` 的状态变化，并在状态变化时更新 UI。当用户点击按钮时，通过 `BlocProvider.of(context).add(IncrementEvent())` 发送 `IncrementEvent` 事件给 `CounterBloc` 进行处理。
 >
 >  ### 4. `Riverpod`
 >
 >  - **适用场景**：Riverpod 是一个现代的状态管理库，适用于各种规模的应用程序，它结合了 `Provider` 的简单性和 `Bloc` 的强大功能，同时提供了更好的可测试性和代码组织性。
 >  - **原理**：Riverpod 基于依赖注入的思想，通过 `Provider` 来提供和管理状态。它使用 `StateNotifier` 和 `StateNotifierProvider` 来管理可变状态，使用 `Provider` 来提供不可变状态。
 >  - **示例代码**：
 >
 >  ```dart
 >  import 'package:flutter/material.dart';
 >  import 'package:flutter_riverpod/flutter_riverpod.dart';
 >  
 >  // 定义一个状态提供者
 >  final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
 >    return CounterNotifier();
 >  });
 >  
 >  // 定义状态管理类
 >  class CounterNotifier extends StateNotifier<int> {
 >    CounterNotifier() : super(0);
 >  
 >    void increment() {
 >      state++;
 >    }
 >  }
 >  
 >  void main() {
 >    runApp(
 >      ProviderScope(
 >        child: MyApp(),
 >      ),
 >    );
 >  }
 >  
 >  class MyApp extends ConsumerWidget {
 >    @override
 >    Widget build(BuildContext context, WidgetRef ref) {
 >      final counter = ref.watch(counterProvider);
 >  
 >      return MaterialApp(
 >        home: Scaffold(
 >          appBar: AppBar(
 >            title: Text('Riverpod Example'),
 >          ),
 >          body: Center(
 >            child: Column(
 >              mainAxisAlignment: MainAxisAlignment.center,
 >              children: [
 >                Text(
 >                  'Counter: $counter',
 >                  style: TextStyle(fontSize: 24),
 >                ),
 >                SizedBox(height: 20),
 >                ElevatedButton(
 >                  onPressed: () {
 >                    ref.read(counterProvider.notifier).increment();
 >                  },
 >                  child: Text('Increment'),
 >                ),
 >              ],
 >            ),
 >          ),
 >        ),
 >      );
 >    }
 >  }
 >  ```
 >
 >  - **解释**：在这个示例中，首先定义了一个 `counterProvider`，它是一个 `StateNotifierProvider`，用于提供 `CounterNotifier` 实例。`CounterNotifier` 类继承自 `StateNotifier`，用于管理计数器的状态。在 `main` 函数中，使用 `ProviderScope` 来提供状态管理的上下文。在 `MyApp` 中，使用 `ConsumerWidget` 和 `WidgetRef` 来监听 `counterProvider` 的状态变化，并在状态变化时更新 UI。当用户点击按钮时，通过 `ref.read(counterProvider.notifier).increment()` 调用 `CounterNotifier` 的 `increment` 方法来更新状态。




```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget Example'),
        ),
        body: Center(
          child: CounterWidget(),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter: $_counter',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}

```




* 2.StatelessWidget 无状态的widget
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
```

### 4.2、UI元素

#### 4.2.1、文本类
* Text
> 用于显示文本内容，可自定义样式
```dart
Text(
  'Hello, Flutter!', // 显示的文本内容
  style: TextStyle(
    fontSize: 24, // 字体大小
    color: Colors.blue, // 字体颜色
    fontWeight: FontWeight.bold, // 字体加粗
  ),
);
```

#### 4.2.2、按钮类
* ElevatedButton
> 带有阴影效果的按钮，用于重要操作
```dart
ElevatedButton(
  // 按钮点击回调
  onPressed: () {
    print('Button pressed!');
  },
  // 按钮显示的文本
  child: Text('Click me'),
);
```
* TextButton
> 无背景和阴影的文本按钮，用于不太重要的操作
```dart
TextButton(
  // 按钮点击回调
  onPressed: () {
    print('TextButton pressed!');
  },
  // 按钮显示的文本
  child: Text('Click me'),
);
```
* IconButton
> 只显示图标的按钮，常用于工具栏或操作区域
```dart
IconButton(
  // 显示的图标
  icon: Icon(Icons.favorite),
  // 按钮点击回调
  onPressed: () {
    print('IconButton pressed!');
  },
);
```

#### 4.2.3、输出类
* TextFile
> 用于接收用户文本输入。
```dart
TextField(
  decoration: InputDecoration(
    // 输入框的提示文本
    labelText: 'Enter your name',
  ),
);
```

#### 4.2.4、选择类
> 复选框，用户可选中或取消选中。
```dart
// 定义一个布尔变量来存储复选框的选中状态
bool isChecked = false;

Checkbox(
  // 复选框的选中状态
  value: isChecked,
  onChanged: (bool? newValue) {
    // 更新复选框的选中状态
    isChecked = newValue!;
  },
);
```
* Radio
> 单选按钮，同一组单选按钮中只能选中一个。
```dart
// 定义一个变量来存储当前选中的值
int selectedValue = 1;

Radio(
  // 当前单选按钮的值
  value: 1,
  // 同一组单选按钮的选中值
  groupValue: selectedValue,
  onChanged: (int? newValue) {
    // 更新选中的值
    selectedValue = newValue!;
  },
);
```

#### 4.2.5、图像类
* Image
> 用于显示图片。
```dart
Image(
  // 从网络加载图片
  image: NetworkImage('https://example.com/image.jpg'),
);
```

#### 4.2.6、进度类
* CircularProgressIndicator
> 圆形进度指示器，用于显示加载进度。
```dart
CircularProgressIndicator(
  // 进度条的颜色
  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
);
```

#### 4.2.7、提示类
* SnackBar
> 用于在屏幕底部显示短暂的提示信息
```dart
// 显示 SnackBar 需要 ScaffoldMessenger 来管理
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    // 提示信息的内容
    content: Text('This is a snackbar message'),
    // 提示信息显示的时长
    duration: Duration(seconds: 2),
  ),
);
```

### 4.3、布局
#### 4.3.1、线性布局:Row和Column
* `Row`
> Row 用于在水平方向上排列子 widget，子 widget 会按照从左到右的顺序依次排列。
```dart
Row(
  // mainAxisAlignment 属性控制子 widget 在主轴（水平方向）上的对齐方式
  // 这里设置为 spaceEvenly，表示子 widget 会均匀分布，并且两端会有相等的间距
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    // 第一个子 widget，是一个红色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
    // 第二个子 widget，是一个绿色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
    ),
    // 第三个子 widget，是一个蓝色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    ),
  ],
);
```

* `Column`
> Column 用于在垂直方向上排列子 widget，子 widget 会按照从上到下的顺序依次排列
```dart
Column(
  // mainAxisAlignment 属性控制子 widget 在主轴（垂直方向）上的对齐方式
  // 这里设置为 center，表示子 widget 会在垂直方向上居中排列
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    // 第一个子 widget，是一个红色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
    // 第二个子 widget，是一个绿色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
    ),
    // 第三个子 widget，是一个蓝色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    ),
  ],
);
```

#### 4.3.2、层叠布局
* `Stack`
> Stack 允许子 widget 层叠排列，后面的子 widget 会覆盖前面的子 widget，可以使用 Positioned widget 来指定子 widget 的位置。
```dart
Stack(
  children: [
    // 第一个子 widget，是一个红色的容器，宽高均为 200 逻辑像素
    Container(
      width: 200,
      height: 200,
      color: Colors.red,
    ),
    // 使用 Positioned 来定位子 widget，距离顶部和左侧均为 20 逻辑像素
    Positioned(
      top: 20,
      left: 20,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
    ),
    // 使用 Positioned 来定位子 widget，距离底部和右侧均为 20 逻辑像素
    Positioned(
      bottom: 20,
      right: 20,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
    ),
  ],
);
```
#### 4.3.3、流式布局
* `Wrap`
```dart
Wrap(
  // spacing 属性控制子 widget 在主轴方向上的间距，这里设置为 10 逻辑像素
  spacing: 10,
  // runSpacing 属性控制换行或换列后的间距，这里设置为 10 逻辑像素
  runSpacing: 10,
  children: [
    // 第一个子 widget，是一个红色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
    // 第二个子 widget，是一个绿色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
    ),
    // 第三个子 widget，是一个蓝色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    ),
    // 第四个子 widget，是一个黄色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.yellow,
    ),
    // 第五个子 widget，是一个紫色的容器，宽高均为 50 逻辑像素
    Container(
      width: 50,
      height: 50,
      color: Colors.purple,
    ),
  ],
);
```

#### 4.3.4 列表布局
* `List`
> ListView 用于创建可滚动的列表，可以是垂直或水平方向的。
```dart
ListView(
  children: [
    // 第一个列表项，使用 ListTile 显示文本 'Item 1'
    ListTile(
      title: Text('Item 1'),
    ),
    // 第二个列表项，使用 ListTile 显示文本 'Item 2'
    ListTile(
      title: Text('Item 2'),
    ),
    // 第三个列表项，使用 ListTile 显示文本 'Item 3'
    ListTile(
      title: Text('Item 3'),
    ),
  ],
);
```

* `GridView`
> GridView 用于创建可滚动的网格布局。
```dart
GridView.count(
  // crossAxisCount 属性指定了网格的列数，这里设置为 3，表示每行显示 3 个元素
  crossAxisCount: 3,
  children: [
    // 第一个网格项，是一个红色的容器，中间显示文本 '1'
    Container(
      color: Colors.red,
      child: Center(child: Text('1')),
    ),
    // 第二个网格项，是一个绿色的容器，中间显示文本 '2'
    Container(
      color: Colors.green,
      child: Center(child: Text('2')),
    ),
    // 第三个网格项，是一个蓝色的容器，中间显示文本 '3'
    Container(
      color: Colors.blue,
      child: Center(child: Text('3')),
    ),
    // 第四网格项，是一个黄色的容器，中间显示文本 '4'
    Container(
      color: Colors.yellow,
      child: Center(child: Text('4')),
    ),
    // 第五个网格项，是一个紫色的容器，中间显示文本 '5'
    Container(
      color: Colors.purple,
      child: Center(child: Text('5')),
    ),
  ],
);
```

## 五、路由
### 5.1 基本概念
#### 5.1.1 路由（Route）
> 在 Flutter 里，路由可理解为屏幕或页面，它代表了应用中的一个界面。每个路由通常对应一个 Widget。
#### 5.1.2 导航器
> 这是一个管理路由的组件，负责处理路由的入栈（push）和出栈（pop）操作，从而实现页面之间的切换。

#### 5.1.3 静态路由
> 静态路由是指在应用启动时就预先定义好的路由表。通过 MaterialApp 的 routes 属性来配置。
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 导航到 '/second' 路由
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 返回上一个路由
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
```
#### 5.1.4 动态路由
> 动态路由是指在运行时创建的路由，使用 MaterialPageRoute 来创建路由实例。
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 动态创建路由并导航
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ),
            );
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
```

### 5.2、路由传参
> 在实际开发中，经常需要在不同路由之间传递数据。以下是路由传参的示例：
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) {
          // 获取传递的参数
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          return SecondPage(message: args);
        },
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 传递参数到 '/second' 路由
            Navigator.pushNamed(
              context,
              '/second',
              arguments: 'Hello from Home Page!',
            );
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String? message;

  SecondPage({this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message ?? 'No message received'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
```
### 5.3 命名路由的嵌套导航
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _nestedNavigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nested Navigation'),
        ),
        body: Navigator(
          key: _nestedNavigatorKey,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (context) => HomePage(
                    navigatorKey: _nestedNavigatorKey,
                  ),
                );
              case '/second':
                return MaterialPageRoute(
                  builder: (context) => SecondPage(
                    navigatorKey: _nestedNavigatorKey,
                  ),
                );
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  HomePage({required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 使用嵌套导航器导航到 '/second' 路由
            navigatorKey.currentState?.pushNamed('/second');
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  SecondPage({required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 使用嵌套导航器返回上一个路由
            navigatorKey.currentState?.pop();
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
```

## 六、与原生交互

### 6.1 MethodChannel
#### 工作原理
> MethodChannel 通过传递方法名和参数，在 Flutter 和原生端之间建立通信桥梁。在 Flutter 端调用方法后，消息会通过底层通道传递到原生端，原生端接收到消息后执行相应的操作，并将结果返回给 Flutter 端。

#### Flutter 端代码
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 创建 MethodChannel 实例，注意 channel 名称要和原生端保持一致
  static const platform = MethodChannel('samples.flutter.dev/battery');

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      // 调用原生端的 'getBatteryLevel' 方法
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    print(batteryLevel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Battery Level'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _getBatteryLevel,
            child: const Text('Get Battery Level'),
          ),
        ),
      ),
    );
  }
}
```

#### Android 原生端代码（Kotlin）
```kotlin
package com.example.flutter_native_interaction

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // 创建 MethodChannel 实例，channel 名称要和 Flutter 端一致
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getBatteryLevel") {
                // 处理 Flutter 端调用的 'getBatteryLevel' 方法
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }
}
```
#### iOS 原生端代码（Swift）
```swift
import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        // 创建 MethodChannel 实例，channel 名称要和 Flutter 端一致
        let channel = FlutterMethodChannel(name: "samples.flutter.dev/battery", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler {
            (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "getBatteryLevel" {
                // 处理 Flutter 端调用的 'getBatteryLevel' 方法
                self.receiveBatteryLevel(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func receiveBatteryLevel(result: FlutterResult) {
        UIDevice.current.isBatteryMonitoringEnabled = true
        if UIDevice.current.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil))
        } else {
            result(Int(UIDevice.current.batteryLevel * 100))
        }
    }
}
```

### 6.2 EventChannel
> EventChannel 用于从原生代码向 Flutter 发送连续的事件流，比如传感器数据、网络状态变化等。
> EventChannel 允许原生代码向 Flutter 发送事件，Flutter 端可以监听这些事件。原生端通过 EventSink 来发送事件，Flutter 端通过 Stream 来接收事件。

#### Flutter 端代码
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 创建 EventChannel 实例，注意 channel 名称要和原生端保持一致
  static const eventChannel = EventChannel('samples.flutter.dev/sensor');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sensor Event'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: eventChannel.receiveBroadcastStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Waiting for data...');
              }
              return Text('Sensor data: ${snapshot.data}');
            },
          ),
        ),
      ),
    );
  }
}
```

#### Flutter 端代码
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 创建 EventChannel 实例，注意 channel 名称要和原生端保持一致
  static const eventChannel = EventChannel('samples.flutter.dev/sensor');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sensor Event'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: eventChannel.receiveBroadcastStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Waiting for data...');
              }
              return Text('Sensor data: ${snapshot.data}');
            },
          ),
        ),
      ),
    );
  }
}
```
#### Android 原生端代码（Kotlin）
```kotlin
package com.example.flutter_native_interaction

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/sensor"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // 创建 EventChannel 实例，channel 名称要和 Flutter 端一致
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var sensorManager: SensorManager? = null
                private val sensorListener = object : SensorEventListener {
                    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}

                    override fun onSensorChanged(event: SensorEvent?) {
                        if (event != null) {
                            eventSink?.success(event.values[0])
                        }
                    }
                }
                private var eventSink: EventChannel.EventSink? = null

                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    eventSink = events
                    sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
                    val sensor = sensorManager?.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
                    sensorManager?.registerListener(sensorListener, sensor, SensorManager.SENSOR_DELAY_NORMAL)
                }

                override fun onCancel(arguments: Any?) {
                    eventSink = null
                    sensorManager?.unregisterListener(sensorListener)
                }
            }
        )
    }
}
```

#### iOS 原生端代码（Swift）
```swift
import Flutter
import UIKit
import CoreMotion

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        // 创建 EventChannel 实例，channel 名称要和 Flutter 端一致
        let eventChannel = FlutterEventChannel(name: "samples.flutter.dev/sensor", binaryMessenger: controller.binaryMessenger)
        eventChannel.setStreamHandler(SensorStreamHandler())

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

class SensorStreamHandler: NSObject, FlutterStreamHandler {
    private let motionManager = CMMotionManager()
    private var eventSink: FlutterEventSink?

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1.0
            motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                if let accelerometerData = data {
                    events(accelerometerData.acceleration.x)
                }
            }
        }
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        motionManager.stopAccelerometerUpdates()
        eventSink = nil
        return nil
    }
}
```

### 6.3 BasicMessageChannel
> BasicMessageChannel 用于在 Flutter 和原生代码之间传递简单的消息，如字符串、JSON 数据等。
> BasicMessageChannel 可以在 Flutter 和原生端之间双向发送消息。它使用 MessageCodec 来对消息进行编码和解码。

#### Flutter 端代码
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 创建 BasicMessageChannel 实例，注意 channel 名称和消息编解码器要和原生端保持一致
  static const messageChannel = BasicMessageChannel('samples.flutter.dev/message', StringCodec());

  Future<void> _sendMessage() async {
    try {
      // 发送消息到原生端
      final String response = await messageChannel.send('Hello from Flutter!');
      print('Received from native: $response');
    } on PlatformException catch (e) {
      print("Failed to send message: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Message Channel'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _sendMessage,
            child: const Text('Send Message'),
          ),
        ),
      ),
    );
  }
}
```
#### Android 原生端代码（Kotlin）
```kotlin
package com.example.flutter_native_interaction

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/message"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // 创建 BasicMessageChannel 实例，channel 名称和消息编解码器要和 Flutter 端一致
        val messageChannel = BasicMessageChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL, StringCodec())
        messageChannel.setMessageHandler { message, reply ->
            // 处理来自 Flutter 端的消息
            println("Received from Flutter: $message")
            reply.reply("Hello from Android!")
        }
    }
}
```
#### iOS 原生端代码（Swift）
```swift
import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        // 创建 BasicMessageChannel 实例，channel 名称和消息编解码器要和 Flutter 端一致
        let messageChannel = FlutterBasicMessageChannel(name: "samples.flutter.dev/message", binaryMessenger: controller.binaryMessenger, codec: FlutterStringCodec.sharedInstance())
        messageChannel.setMessageHandler { (message, reply) in
            // 处理来自 Flutter 端的消息
            print("Received from Flutter: \(message ?? "")")
            reply("Hello from iOS!")
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
```


## 七、资源管理
> 资源是指应用程序中使用的非代码文件，如图片、字体、音频、视频等。在 Flutter 里，通过 pubspec.yaml 文件对资源进行管理。

### 图片资源
#### 添加图片资源
在 pubspec.yaml 文件中添加如下配置：
```yaml
flutter:
  assets:
    - assets/images/background.png
    - assets/images/icon.png
```
这里的 assets 字段指定了图片资源的路径，- 表示每个资源项。

#### 使用图片资源
```dart
 Image.asset('assets/images/background.png')
```

### 字体资源
#### 添加字体资源
```yaml
flutter:
  fonts:
    - family: MyCustomFont
      fonts:
        - asset: assets/fonts/MyCustomFont-Regular.ttf
        - asset: assets/fonts/MyCustomFont-Bold.ttf
          weight: 700
```
这里定义了一个名为 MyCustomFont 的字体家族，包含常规字体和粗体字体。

#### 使用字体资源
```dart
Text(
            'Hello, Flutter!',
            style: TextStyle(
              fontFamily: 'MyCustomFont',
              fontSize: 24,
            )
```
### 其他资源
除了图片和字体，还可以管理其他类型的资源，如 JSON 文件、文本文件等。配置方式与图片资源类似：
```yaml
flutter:
  assets:
    - assets/data/data.json
    - assets/texts/description.txt
```

#### 使用
```dart
  Future<String> loadText() async {
    return await rootBundle.loadString('assets/texts/description.txt');
  }
```

### 依赖管理
#### 从 Pub 仓库添加
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.4
```

#### 从 Git 仓库添加
```yaml
dependencies:
  flutter:
    sdk: flutter
  my_package:
    git:
      url: https://github.com/user/my_package.git
      ref: master
```

#### 本地依赖
```yaml
dependencies:
  flutter:
    sdk: flutter
  my_local_package:
    path: ../my_local_package
```

dart run serious_python:main package D:\temp\pydemo -p Windows








