import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Controllers/controller.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Scaffold(
        body: ListView.builder(
            itemCount: controller.responseData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    leading: Image.network(
                        controller.responseData[index].image['medium']),
                    title: Text(
                      controller.responseData[index].name,
                    ),
                    subtitle: Text(
                      controller.responseData[index].phoneNumber,
                    ),
                  ),
                  Text(
                    controller.responseData[index].phoneNumber,
                  ),
                ],
              );
            }));
  }
}
