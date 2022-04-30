import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sriwijaya/models/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("user");

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snap = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snap["email"],
        name: snap["name"],
        hobby: snap["hobby"],
        balance: snap["balance"],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> updateBalance(String id, int newBalance) async {
    try {
      await _userReference.doc(id).update({'balance': newBalance});
      DocumentSnapshot snap = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snap["email"],
        name: snap["name"],
        hobby: snap["hobby"],
        balance: snap["balance"],
      );
    } catch (e) {
      rethrow;
    }
  }
}
