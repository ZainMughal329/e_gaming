import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String userName;
  final String phone;
  final String semester;
  final String rollNo;
  final String department;

  final String game;

  UserModel({
    this.id = '',
    required this.userName,
    required this.phone,
    required this.semester,
    required this.game,
    required this.department,
    required this.rollNo,
  });

  toJson() {
    return {
      'id': id,
      'userName': userName,
      'phone': phone,
      'semester': semester,
      'game': game,
      'department': department,
      'rollNo': rollNo,
    };
  }

  factory UserModel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final json = snapshot.data()!;
    return UserModel(
      id: json["id"],
      userName: json["userName"],
      phone: json["phone"],
      semester: json['semester'],
      game: json["game"],
      department: json['department'],
      rollNo: json['rollNo'],
    );
  }
}
