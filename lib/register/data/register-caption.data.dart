import '/core/localization/translate.helper.dart';
import '/register/entities/entities.dart';

/// Register email page cation object
RegisterCaptionEntity get emailCaption => RegisterCaptionEntity(
      TranslateHelper.email,
      TranslateHelper.enterEmail,
    );

/// Register information page cation object
RegisterCaptionEntity get infoCaption => RegisterCaptionEntity(
      TranslateHelper.information,
      TranslateHelper.youCanChangeLater,
    );

/// Register password page cation object
RegisterCaptionEntity get passwordCaption => RegisterCaptionEntity(
      TranslateHelper.password,
      TranslateHelper.complateYourRegistration,
    );
