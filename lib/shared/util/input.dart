import 'package:nwdi/core.dart';

class Input {
  static Map<String, dynamic> values = {};
  static Map<String,InputContrrollerState> inputController = {};

  static set(key, value) {
    values[key] = value;
  }

  static get(key) {
    return values[key];
  }

  static clear(Key) {
    values.remove(Key);
  }

  static resetValues() {
    inputController.forEach((key, value) {
      value.resetValue();
    });
  }
}


