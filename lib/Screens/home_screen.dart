import 'dart:html';
import 'dart:ui';

import 'package:crypto/controller/coin_controller.dart';
import 'package:crypto/models/coin_model.dart';
import 'package:crypto/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Crypto Market",
                  style: textStyle(25, Colors.white, FontWeight.bold),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[700],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey[700]!,
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 5)
                                                ]),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Image.network(controller
                                                  .coinsList[index].name),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                controller
                                                    .coinsList[index].name,
                                                style: textStyle(
                                                    18,
                                                    Colors.white,
                                                    FontWeight.w600),
                                              ),
                                              Text(
                                                "${controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(2)}%",
                                                style: textStyle(
                                                    18,
                                                    Colors.white,
                                                    FontWeight.w600),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "\$ ${controller.coinsList[index].currentPrice.toStringAsFixed(2)}",
                                            style: textStyle(18, Colors.white,
                                                FontWeight.w600),
                                          ),
                                          Text(
                                            controller.coinsList[index].symbol,
                                            style: textStyle(18, Colors.white,
                                                FontWeight.w600),
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                            );
                          },
                        ),
                )
              ],
            )),
      ),
    );
  }
}
