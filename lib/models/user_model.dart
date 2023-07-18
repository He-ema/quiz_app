import 'package:quiz/Constants.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;

  UserModel(this.name, this.email, this.phone);

  factory UserModel.fromJson(JsonData) {
    return UserModel(JsonData[KUsername], JsonData[KEmail], JsonData[KPhone]);
  }
}
