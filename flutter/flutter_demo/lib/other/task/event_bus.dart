import 'dart:async';

main() {
  EventBus.getInstance().register((s) {
    print("s:$s");
  });
  EventBus.getInstance().post("obj");
  EventBus.getInstance().destroy();
  EventBus.getInstance().post("obj");
}

class Event {
  var object;

  Event(this.object);
}

class EventBus {
  var map = Map<String, Event>();

  static EventBus? _instance;

  late StreamController _streamController;

  factory EventBus.getInstance() {
    _instance ??= EventBus._internal();
    return _instance!;
  }

  EventBus._internal() {
    _streamController = StreamController.broadcast();
  }

  /// 注册
  StreamSubscription<T> register<T>(void onData(T event)) {
    return _streamController.stream
        .where((type) => type is T)
        .cast<T>()
        .listen(onData);
  }

  void destroy() {
    _streamController.close();
  }

  ///发送事件
  void post(Object obj) {
    if (!_streamController.isClosed) {
      _streamController.add(obj);
    }
  }
}
