import 'package:flutter/material.dart';
import 'package:luvit/entry.dart';
import 'package:luvit/injection_container/injection_container.dart';

Future<void> main() async {
  await init();
  runApp(const Entry());
}
