import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '/register/validators/reigster.validator.dart';
import '/register/data/register-caption.data.dart';
import '/core/widgets/widgets.dart';
import '/register/controllers/register.controller.dart';
import '/register/widgets/widgets.dart';

class RegisterInfoPage extends GetView<RegisterController> {
  const RegisterInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.infoKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterCaption(caption: infoCaption),
              TextOutlinedLabelField(
                label: TranslateHelper.name,
                controller: controller.nameController,
                prefixIcon: const Icon(Icons.person),
                validator: RegisterValidator.nameValidator,
              ),
              const SizedBox(height: 10.0),
              TextOutlinedLabelField(
                label: TranslateHelper.biography,
                hintText: TranslateHelper.biographyHint,
                maxLines: 4,
                minLines: 4,
                controller: controller.bioController,
                validator: RegisterValidator.bioValidator,
              ),
              const SizedBox(height: 10.0),
              ExpandableDateTimePicker(
                label: TranslateHelper.birthDate,
                onChanged: controller.onChangedBirthDate,
                dateTime: controller.birtDate,
                maxDate: DateTime.now(),
                validator: RegisterValidator.bioValidator,
              ),
              _buildNextButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildNextButton {
    return RegisterNextButton(
      onPressed: controller.onNextPage,
      title: TranslateHelper.next,
    );
  }
}
