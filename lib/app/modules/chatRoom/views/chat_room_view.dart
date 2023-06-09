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
                  label: 'Chats',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Ionicons.heart_circle),
                  label: 'Favourite',
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
            child: ListView.builder(
              itemCount: controller.chatRooms.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: Get.height * 0.12,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.greenColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/chat', arguments: {
                              'chatRoomId':
                                  '${controller.userId.value}xA5lRs5krEa3LKEeVhvT',
                            });
                          },
                          child: Container(
                            height: Get.height * 0.12,
                            width: Get.width * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.greenColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                controller.userImage.value == ''
                                    ? 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'
                                    : controller.userImage.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.userName.value,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greenColor,
                              ),
                            ),
                            // Text(
                            //   controller.chatRooms[index]['lastMessage'],
                            //   style: const TextStyle(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.bold,
                            //     color: AppColors.greenColor,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
