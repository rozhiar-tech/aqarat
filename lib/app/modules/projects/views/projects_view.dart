import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ProjectsController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  controller.sharedLang.value == 'Arabic'
                      ? controller.arabicTitle.value
                      : controller.sharedLang.value == 'Arabic_EG'
                          ? controller.kurdishTitle.value
                          : controller.title.value,
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: controller.projects.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/project-detail', arguments: [
                            controller.projects[index]['name'],
                            controller.projects[index]['description'],
                            controller.projects[index]['location'],
                            controller.projects[index]['grassArea'],
                            controller.projects[index]['client'],
                            controller.projects[index]['photos'],
                            controller.projects[index]['videoUrl'],
                            controller.projects[index]['latitude'],
                            controller.projects[index]['longtitude'],
                          ]);
                        },
                        child: Container(
                          height: Get.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        controller.projects[index]['photos'][0],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.projects[index]['name'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.projects[index]
                                                        ['description']
                                                    .toString()
                                                    .length >
                                                50
                                            ? controller.projects[index]
                                                        ['description']
                                                    .toString()
                                                    .substring(0, 50) +
                                                '...'
                                            : controller.projects[index]
                                                    ['description']
                                                .toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                controller.projects[index]
                                                    ['location'],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                controller.sharedLang.value ==
                                                        'Arabic'
                                                    ? 'مساحة العشب'
                                                    : controller.sharedLang
                                                                .value ==
                                                            'Arabic_EG'
                                                        ? 'ڕووبەری سەوزای'
                                                        : 'Grass Area',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                controller.projects[index]
                                                            ['grassArea']
                                                        .toString() +
                                                    '%',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                controller.projects[index]
                                                    ['client'],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.attach_money,
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                controller.sharedLang.value ==
                                                        'Arabic'
                                                    ? 'السعر عند الطلب'
                                                    : controller.sharedLang
                                                                .value ==
                                                            'Arabic_EG'
                                                        ? 'نرخ لەسەر داواکاری'
                                                        : 'Price on Request',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ));
        });
  }
}
