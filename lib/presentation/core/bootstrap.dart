import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:path_provider/path_provider.dart';

import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/domain/entities/product.dart';
import 'package:open_fashion/presentation/core/app.dart';
import 'package:open_fashion/presentation/core/bloc_observer.dart';

void bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  var appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive
    ..registerAdapter(ProductAdapter())
    ..registerAdapter(RatingAdapter())
    ..registerAdapter(CartItemAdapter());

  await Hive.openBox<CartItem>(AppStrings.cartBox);

  runZonedGuarded(
    () => runApp(const AppBuilder()),
    (error, stackTrace) {
      print(error);
      print(stackTrace);
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
