import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '/core/widgets/widgets.dart';
import '/core/models/hobby.model.dart';
import '/home/controllers/home.controller.dart';
import 'widgets.dart';

class HobbyList extends GetView<HomeController> {
  const HobbyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.streamHobbies,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text("Error: ${snapshot.error}");
        if (!snapshot.hasData) return _buildLoading;
        if (snapshot.data!.isEmpty) return EmptyBox(title: TranslateHelper.noFoundHobbies);
        return _buildList(snapshot.data!);
      },
    );
  }

  Widget get _buildLoading {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      separatorBuilder: (context, index) => const SizedBox(height: 4.0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ShimmerCustom(
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        );
      },
    );
  }

  Widget _buildList(List<Hobby> hobbies) {
    int length = hobbies.length;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      separatorBuilder: (context, index) => const SizedBox(height: 4.0),
      itemCount: length,
      itemBuilder: (context, index) {
        final hobby = hobbies[index];
        return HobbyListItem(hobby: hobby);
      },
    );
  }
}
