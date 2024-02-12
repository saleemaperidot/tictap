import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tictap/controllers/counter_controller.dart';

class Tictap extends StatelessWidget {
  Tictap({super.key});
  final counterCounter controller = Get.put(counterCounter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TICTAP"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Current Second"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Text(
                        ' ${controller.currentSecond}',
                        style: TextStyle(fontSize: 24),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Current Random"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Text(
                        "${controller.randomNumber}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            return controller.successIndicator.value == 1
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(controller.successIndicator.value == 1
                              ? "success"
                              : controller.successIndicator.value == 2
                                  ? "time out"
                                  : "Sorry try Again!!");
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return controller.successIndicator.value == 0
                              ? Text("Score:0/${controller.noOfAttempts}")
                              : controller.successIndicator.value == 1
                                  ? Text(
                                      "score:${controller.score}+/+${controller.noOfAttempts}")
                                  : Text("sorry");
                        }),
                      ],
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(controller.successIndicator.value == 1
                              ? "success"
                              : controller.successIndicator.value == 2
                                  ? "time out"
                                  : "Sorry try Again!!");
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return controller.successIndicator.value == 0
                              ? Text("Score:0/${controller.noOfAttempts}")
                              : controller.successIndicator.value == 1
                                  ? Text(
                                      "score:${controller.score}+/+${controller.noOfAttempts}")
                                  : Text("sorry");
                        }),
                      ],
                    ),
                  );
          }),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            return CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: controller.percent.value,
              center: Text("${controller.countdown.value}"),

              // Text(
              //     "${(((1 - controller.percent.value) * 100) / 5).toInt()}"),
              progressColor: Colors.green,
            );
          }),
          Obx(() {
            return controller.gameStartIndicator.value == false
                ? ElevatedButton(
                    onPressed: () {
                      controller.gameStart();
                    },
                    child: Text("Start"))
                : ElevatedButton(
                    onPressed: () {
                      controller.tictap();
                      if (controller.countdown.value == 5) {}
                    },
                    child: Text("Click"));
          })
        ],
      )),
    );
  }
}
