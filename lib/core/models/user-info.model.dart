import '/core/extension/extension.dart';

class UserInfoModel {
  final String? name;
  final DateTime? birthDate;
  final String? biography;

  const UserInfoModel({
    this.name,
    this.biography,
    this.birthDate,
  });

  UserInfoModel copyWith({
    String? uid,
    String? name,
    String? email,
    DateTime? birthDate,
    String? biography,
    String? password,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      biography: biography ?? this.biography,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthDate": birthDate.toString(),
        "biography": biography,
      };

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      name: json["name"],
      biography: json['biography'],
      birthDate: (json['birthDate'] as String?).toDate()!,
    );
  }
}
