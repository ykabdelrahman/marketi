import 'package:flutter/material.dart';
import 'core/data/cache_helper.dart';
import 'app.dart';
import 'core/di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper.init();
  runApp(const MyApp());
}
