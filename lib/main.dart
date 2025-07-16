import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/data/cache_helper.dart';
import 'app.dart';
import 'core/di/get_it.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/check_logged_user.dart';
import 'core/utils/hive_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper.init();
  await HiveSetup.init();
  await checkIfLoggedInUser();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
