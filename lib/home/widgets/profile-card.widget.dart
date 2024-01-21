import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/home/controllers/home.controller.dart';
import '../../core/models/models.dart';
import '../../core/widgets/widgets.dart';
import '/core/extension/extension.dart';

class ProfileCard extends GetView<HomeController> {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.streamUserInfo,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text("Error");
        if (!snapshot.hasData) return _buildLoading;
        return _buildCard(snapshot.data);
      },
    );
  }

  Widget get _buildLoading {
    return ShimmerCustom(
      child: Container(
        color: Colors.white,
        width: Get.width,
        height: 110.0,
      ),
    );
  }

  Widget _buildCard(UserInfoModel? info) {
    String email = controller.email;
    String name = info?.name ?? "";
    String biography = info?.biography ?? "";
    String birthDate = info?.birthDate?.locale() ?? "";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: Get.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(email),
                    Text(birthDate),
                    Text(biography),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
