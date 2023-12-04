import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

class UserModel {
  String? firstName;
  String? lastName;

  String? email;
  String? phone;
  String? password;
  String? height;
  String? weight;
  String? goal;
  String? age;
  bool? subscribed;
  bool? week_1_done;
  bool? week_2_done;

  bool? week_3_done;
  bool? week_4_done;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.age,
    this.goal,
    this.height,
    this.weight,
    this.week_1_done,
    this.week_2_done,
    this.week_3_done,
    this.week_4_done,
    this.subscribed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'height': height,
      'weight': weight,
      'goal': goal,
      'age': age,
      'subscribed': subscribed,
      'week_1_done': week_1_done,
      'week_2_done': week_2_done,
      'week_3_done': week_3_done,
      'week_4_done': week_4_done,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      goal: map['goal'] != null ? map['goal'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      subscribed: map['subscribed'] != null ? map['subscribed'] as bool : null,
      week_1_done:
          map['week_1_done'] != null ? map['week_1_done'] as bool : null,
      week_2_done:
          map['week_2_done'] != null ? map['week_2_done'] as bool : null,
      week_3_done:
          map['week_3_done'] != null ? map['week_3_done'] as bool : null,
      week_4_done:
          map['week_4_done'] != null ? map['week_4_done'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
