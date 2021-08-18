import 'package:flutter_getx/pages/menu/count_page.dart';
import 'package:flutter_getx/pages/menu/shop/shop.dart';
import 'package:get/get.dart';

import 'package:flutter_getx/pages/menu/counter_page.dart';
import 'package:flutter_getx/pages/menu/hitungPerubahan_page.dart';
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
    GetPage(
      name: RouteName.count_page,
      page: () => CountPage(),
    ),
    GetPage(
      name: RouteName.shop_page,
      page: () => ShopPage(),
    ),
  ];
}
