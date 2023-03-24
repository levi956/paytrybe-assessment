import 'package:flutter/material.dart';

import '../config/device_potrait.dart';

class Setups {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SetPotrait.init();
  }
}
