import 'package:flutter/material.dart';
import 'package:open_fashion/presentation/core/injections.dart';
import 'package:open_fashion/presentation/core/bootstrap.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap();
}
