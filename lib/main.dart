import 'package:flutter/material.dart';
import 'package:news_app/dependency_injection/injection.dart';
import 'package:news_app/app.dart';

void main() {
  injectDependencies();
  runApp(const App());
}
