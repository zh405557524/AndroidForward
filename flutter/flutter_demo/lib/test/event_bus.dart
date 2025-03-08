main() {
  var bus = EventBus.getInstance();
  // var event = Event();
  // bus.register(event);
  // bus.post(event);
  // bus.unRegister(event);
}

class Event {
  var object;

  Event(this.object);
}

class EventBus {
  var map = Map<String, Event>();

  static EventBus? _instance;

  factory EventBus.getInstance() {
    _instance ??= EventBus._internal();
    return _instance!;
  }

  EventBus._internal();

  /// 注册
  void register(Event obj) {
    var key = obj.toString();
    print("key:${key}");
    map[key] = obj;
  }

  /// 注销
  void unRegister(Event obj) {
    var key = obj.toString();
    map.remove(key);
  }

  ///发送事件
  void post(Event obj) {
    var key = obj.toString();
    if (map.containsKey(key)) {
    }
  }



}









