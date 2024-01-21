import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/home/validators/home.validator.dart';
import '/home/widgets/widgets.dart';
import '../controllers/home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: _buildAppBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileCard(),
                const Divider(),
                _buildHobbies,
              ],
            ),
          ),
        ),
      );
    });
  }

  AppBar get _buildAppBar {
    return AppBar(
      actions: [
        TextButton(
          onPressed: controller.onLogout,
          child: const Text("Logout"),
        ),
      ],
    );
  }

  Widget get _buildHobbies {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hobbies",
            style: Get.textTheme.labelLarge,
          ),
          Form(
            key: controller.formKey,
            child: AddHobbyField(
              focusNode: controller.focusNode,
              controller: controller.hobbyController,
              onAdd: controller.onAddHobbie,
              validator: HomeValidator.hobbieValidator,
            ),
          ),
          const HobbyList()
        ],
      ),
    );
  }
}
