import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/app.dart';
import 'package:roome/src/config/services/notification_service.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/bloc_observer.dart';
import 'package:roome/src/core/utils/firebase_options.dart';
import 'package:roome/src/core/utils/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationService.initAwesomeNotifications();

  Bloc.observer = MyBlocObserver();

  setUpServiceLocator();

  await CacheHelper.initSharedPref();

  Helper.uId = CacheHelper.getIntData(key: 'uId');

  runApp(const RoomeApp());
}
