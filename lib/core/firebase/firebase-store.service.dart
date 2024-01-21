import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '/core/models/hobby.model.dart';
import '/core/snackbar/app.snackbar.dart';
import '/core/models/models.dart';

class FirebaseStoreService extends GetxService {
  /// Fire store
  final FirebaseFirestore instace = FirebaseFirestore.instance;

  /// Add User Informations
  Future<void> addUserInfo(String uid, UserInfoModel info) async {
    try {
      await instace.collection("users").doc(uid).set(info.toJson());
    } catch (e) {
      print(e);
    }
  }

  /// Get User Informations
  Future<UserInfoModel?> getUserInfo(String uid) async {
    final result = await instace.collection("users").doc(uid).get();
    final data = result.data();
    if (!result.exists || data == null) return null;
    return UserInfoModel.fromJson(data);
  }

  Stream<UserInfoModel?> streamUserInfo(String uid) {
    return instace.collection("users").doc(uid).snapshots().map((event) {
      if (!event.exists) return null;
      return UserInfoModel.fromJson(event.data()!);
    });
  }

  Future<void> addHobby(String uuid, Hobby hobby) async {
    try {
      await instace.collection("users").doc(uuid).collection("hobbies").add(hobby.toJson());
      AppSnackbar.success(TranslateHelper.adddedHobbySuccessed);
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Hobby>> streamHobby(String uid) {
    final collections = instace.collection("users").doc(uid).collection("hobbies");
    return collections.snapshots().map((snapShot) {
      final hobbies = snapShot.docs.map((e) {
        final data = e.data();
        return Hobby.fromJson(data);
      });
      return hobbies.cast<Hobby>().toList();
    });
  }
}
