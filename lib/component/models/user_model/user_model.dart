import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String userName;
  final String phone;
  final String semester;
  final String rollNo;
  final String department;
  String? isLose;
  final String game;

  UserModel({
    this.id = '',
    required this.userName,
    required this.phone,
    required this.semester,
    required this.game,
    required this.department,
    this.isLose = 'false',
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
      'isLose' : isLose,
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
      isLose: json['isLose'],
      rollNo: json['rollNo'],
    );
  }
}
