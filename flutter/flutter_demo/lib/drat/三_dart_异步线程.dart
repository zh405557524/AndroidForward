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

  //微队列
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
