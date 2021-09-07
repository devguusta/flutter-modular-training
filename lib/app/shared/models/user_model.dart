import 'dart:convert';

class UserModel {
  String name;
  String username;
  String email;
  String website;
  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.website,
  });
  

  UserModel copyWith({
    String? name,
    String? username,
    String? email,
    String? website,
  }) {
    return UserModel(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'website': website,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      username: map['username'],
      email: map['email'],
      website: map['website'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, username: $username, email: $email, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.name == name &&
      other.username == username &&
      other.email == email &&
      other.website == website;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      website.hashCode;
  }
}
