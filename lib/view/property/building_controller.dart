import 'package:get/get.dart';

class BuildingController extends GetxController {
  static const tag = 'BuildingController';

  final isFloorDisplayed = false.obs;
  final isGroupDisplayed = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initSettings();
    _onFocusGained();
  }

  void _initSettings() {
    print('$tag _initSettings');
  }

  void _onFocusGained() {
    print('$tag _onFocusGained');
  }

  void onBuildingCardClicked() {
    isFloorDisplayed.value = true;
  }

  void onFloorCardClicked() {
    isGroupDisplayed.value = true;
  }
}
