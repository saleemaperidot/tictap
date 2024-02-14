import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class counterCounter extends GetxController {
  RxInt currentSecond = DateTime.now().second.obs;
  RxDouble percent = 0.0.obs;
  RxInt countdown = 5.obs;
  RxInt randomNumber = 0.obs;
  RxInt successIndicator = 0.obs;
  RxInt noOfAttempts = 0.obs;
  RxInt score = 0.obs;
  late Timer timer;
  RxBool gameStartIndicator = false.obs;
  RxBool gameWin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void gameStart() {
    gameStartIndicator.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      percent.value += 0.20; // Increment by 1% every second
      countdown.value = countdown.value - 1;

      if (percent.value >= 1.0) {
        // Reset the percentage after reaching 100%
        percent.value = 0.0;
        countdown.value = 5;
        successIndicator.value = successIndicator.value == 1 ? 0 : 2;
        score.value = 0;
        noOfAttempts.value = 0;
        gameStartIndicator.value = false;
        timer.cancel();
        gameWin.value = false;
        gameWin.refresh();
      }
    });
  }

  void tictap() {
    currentSecond.value = DateTime.now().second;
    randomNumber.value = Random().nextInt(60);
    noOfAttempts.value = noOfAttempts.value + 1;
    successIndicator.value = 0;
    if (currentSecond.value == randomNumber.value) {
      gameWin.value = true;
      successIndicator.value = 1;
      score.value = score.value + 1;
      gameStartIndicator.value = false;
    }

    // Update the currentSecond every second
  }
}
