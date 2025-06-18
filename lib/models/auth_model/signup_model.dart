class UserModel {
  String username;
  String role;
  String email;
  String password;

  UserModel({
    required this.username,
    required this.role,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'role': role,
      'email': email,
      'password': password,
    };
  }
}
