import 'package:get/get.dart';

import 'package:flutter_getx/pages/counter_page.dart';
import 'package:flutter_getx/pages/hitungPerubahan_page.dart';
import 'package:flutter_getx/pages/homepage.dart';
import 'package:flutter_getx/routes/route_name.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.homepage,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.counter_page,
      page: () => CounterPages(),
    ),
    GetPage(
      name: RouteName.hitung_page,
      page: () => HitungPerubahan(),
    ),
  ];
}
