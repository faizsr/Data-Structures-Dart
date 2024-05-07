import 'dart:isolate';

void isolateFunction(SendPort sendPort) {
  sendPort.send(42);
}

void main() async {
  ReceivePort receivePort = ReceivePort();
  Isolate isolate = await Isolate.spawn(isolateFunction, receivePort.sendPort);
  receivePort.listen((data) {
    print(data);
    receivePort.close();
    isolate.kill();
  });
}
