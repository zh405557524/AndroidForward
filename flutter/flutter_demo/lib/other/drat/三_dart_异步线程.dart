import 'dart:async';
import 'dart:io';
import 'dart:isolate';

var i = 0;

void main() {
  //事件循环
  i = 100;
  //事件接收器
  var receivePort = new ReceivePort();
  Isolate.spawn(entryPoint, receivePort.sendPort);
  receivePort.listen((t) {
    print(t);
  });
  //微任务
  Future.microtask(() {
    print("i:${i++}");
  });
  var f = Future.delayed(Duration(seconds: 3), () {
    //3秒后执行
    print("i:${i}");
  });

  // Futrue f1 == readFile();

  Future f1 = Future.delayed(Duration(seconds: 3));
  f1.then((t) {
    print("f1:${t}");
  });

  new File(
      r"D:\work\code\soul\AndroidForward\flutter\flutter_demo\lib\drat\a.txt")
      .readAsString()
      .then((String s) {
    //一次性读取
    // print(s);
    return "1";
  }).catchError((e, s) {
    print("error:${e}");
  });

  Future.wait([
    Future.delayed(Duration(seconds: 1)),
    Future.delayed(Duration(seconds: 2))
  ]).then((_) {
    print(1);
  });

  Future.forEach([1, 2, 3, 4], (i) {
    print(i);
  });

  var dst = File(
      r"D:\work\code\soul\AndroidForward\flutter\flutter_demo\lib\drat\b.txt");
  var write = dst.openWrite();
  //steam
  Stream<List<int>> steam = new File(
      r"D:\work\code\soul\AndroidForward\flutter\flutter_demo\lib\drat\a.txt")
      .openRead();
  // var listen = steam.listen((s) { //单订阅
  //   //分段读取
  //   print("stream:执行");
  //   // dst.writeAsBytes(s, mode: FileMode.append);
  // });

  // listen.cancel(); //取消订阅
  // listen.onData((s) {
  //   //替代订阅
  //   print("steam2:执行");
  //   // dst.writeAsBytes(s, mode: FileMode.append);
  // });
  // write.addStream(steam);
  // listen.onDone(() {
  //   print("读完整个文件");
  // });
  //多订阅，广播模式
  var broadcastStream = steam.asBroadcastStream();
  broadcastStream.listen((_) {});
  broadcastStream.listen((_) {});
  broadcastStream.listen((_) {});

  var steam2 = Stream.fromIterable([1, 2, 3, 4]);
  var broadcastStream2 = steam2.asBroadcastStream();
  broadcastStream2.listen((i) {
    print("订阅者1:${i}");
  });
  broadcastStream2.listen((i) {
    print("订阅者2:${i}");
  });

  //直接创建一个广播
  var streamController = StreamController.broadcast();
  streamController.stream.listen((i) {
    print("streamController:${i}");
  });
  streamController.add("1");
  streamController.add("2");
  streamController.add("3");

  Future.delayed(Duration(seconds: 3)).then((_) {
    broadcastStream2.listen((i) {
      print("转行的广播:${i}");
    });
  });

  broadcastStream2.listen((i) {
    print("订阅者3:${i}");
  });

  //async 异步方法
  add3(1, 2).then((value) {
    print("add3:${value}");
  });
}

void entryPoint(SendPort sendPort) {
  i = 200;
  sendPort.send("Hello from entryPoint");
}

Future<String> readFile() async {
  String content = await new File(
      r"D:\work\code\soul\AndroidForward\flutter\flutter_demo\lib\drat\a.txt")
      .readAsString();
  return "content:${content}";
}

//异步方法
Future<int> add3(int a, int b) async {
  // await 阻塞当前代码。
  String content = await new File(
      r"D:\work\code\soul\AndroidForward\flutter\flutter_demo\lib\drat\a.txt")
      .readAsString();

  print("content:${content}");
  return a + b;
}
