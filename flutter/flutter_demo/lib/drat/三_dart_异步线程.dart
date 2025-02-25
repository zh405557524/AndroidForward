import 'dart:io';

void main() {
  // readFile().then(onValue);
}

Future<String> readFile() async {
  String content = await new File(
      r"D:\work\code\soul\AndroidForward\flutter\flutter_demo\lib\drat\a.txt")
      .readAsStringSync();

  return "content:${content}";
}
