import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnapp/statemanagement/getx/api/methods.dart';

class ApiGetxScreen extends StatefulWidget {
  const ApiGetxScreen({super.key});

  @override
  State<ApiGetxScreen> createState() => _ApiGetxScreenState();
}

class _ApiGetxScreenState extends State<ApiGetxScreen> {
  final controller = Get.put(ApiGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.apiResult.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.apiResult["status"] == "E") {
          return Center(child: Text(controller.apiResult["errMsg"]));
        } else if (controller.apiResult["status"] == "S") {
          return ListView.builder(
            itemCount: controller.apiResult["todos"].length,
            itemBuilder: (context, index) {
              return Text(controller.apiResult["todos"][index]["title"]);
            },
          );
        } else {
          return Center(child: Text("something went wrong"));
        }
      }),
    );
  }
}
