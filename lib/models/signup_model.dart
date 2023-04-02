class SignUpModel {
  String? firstName;
  String? lastName;
  int? age;
  String? email;
  String? username;
  String? password;
  String? gender;

  SignUpModel(
      {this.firstName,
      this.lastName,
      this.age,
      this.email,
      this.username,
      this.password,
      this.gender});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['age'] = age;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['gender'] = gender;
    return data;
  }
}
