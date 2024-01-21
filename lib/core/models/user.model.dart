import '/core/models/user-info.model.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? password;
  final UserInfoModel? info;

  const UserModel({
    this.uid,
    this.email,
    this.password,
    this.info,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
    UserInfoModel? info,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      info: info ?? this.info,
    );
  }
}
