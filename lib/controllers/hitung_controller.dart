import 'package:get/get.dart';

class HitungController extends GetxController {
  var count = 0.obs;

  void change() => count++;

  void reset() => count.value = 0;
}
