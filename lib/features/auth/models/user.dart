class User {
  final String id;
  final String email;
  final String? fullName;
  final String? avatar;

  User({required this.id, required this.email, this.fullName, this.avatar});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullName': fullName,
      'avatar': avatar,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] != null ? json['fullName'] as String : null,
      avatar: json['avatar'] != null ? json['avatar'] as String : null,
    );
  }
}
