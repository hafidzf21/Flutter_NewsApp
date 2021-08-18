import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/shop_controller.dart';
import 'package:get/get.dart';

import 'package:flutter_getx/pages/menu/shop/widgets/shop_item.dart';

class ShopPage extends StatelessWidget {
  final shopC = Get.put(ShopC(), tag: 'total');
  final quantityC = Get.create(() => ShopC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shop Page"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ShopItem(),
      ),
      floatingActionButton: CircleAvatar(
        child: Obx(
          () => Text("${shopC.total}"),
        ),
      ),
    );
  }
}
