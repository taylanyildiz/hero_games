import 'package:equatable/equatable.dart';
import '/core/extension/extension.dart';

class Hobby extends Equatable {
  final String? uid;
  final String? name;
  final DateTime? date;

  const Hobby({
    this.uid,
    this.name,
    this.date,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "date": DateTime.now().toString(),
      };

  factory Hobby.fromJson(Map<String, dynamic> json) {
    return Hobby(
      uid: json['uid'],
      name: json['name'],
      date: (json['date'] as String?).toDate(),
    );
  }

  @override
  List<Object?> get props => [uid, name, date];
}
