import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ChatRoomController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  controller.title.value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greenColor,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Ionicons.chevron_back,
                    size: 28,
                    color: AppColors.greenColor,
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              bottomNavigationBar: SizedBox(
                height: Get.height * 0.1,
                width: Get.width,
                child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Ionicons.home),
                      label: 'Home',
                      backgroundColor: Colors.white,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Ionicons.chatbubbles_outline),
                      label: 'Business',
                      backgroundColor: Colors.white,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Ionicons.heart_circle),
                      label: 'School',
                      backgroundColor: Colors.white,
                    ),
                  ],
                  currentIndex: 1,
                  selectedItemColor: AppColors.greenColor,
                  onTap: (index) {
                    controller.changeIndex(index);
                  },
                ),
              ),
              backgroundColor: Colors.white,
              body: Container(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.12,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.goldColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.12,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.goldColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.12,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.goldColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
