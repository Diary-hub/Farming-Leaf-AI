import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.email,
  });

  final String id;
  final String email;

  // Convert the UserModel instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'ID': id,
    };
  }

  static UserModel empty() => UserModel(
        id: '',
        email: '',
      );

  // Create a UserModel instance from a Map
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['Email'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
