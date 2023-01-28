import 'dart:convert';

class User {
  final String name;
  final String email;
  final bool isBusiness;
  late final String token;
  final String password;
  User({
    required this.name,
    required this.email,
    required this.isBusiness,
    required this.token,
    required this.password,
  });

  User copyWith({
    String? name,
    String? email,
    bool? isBusiness,
    String? token,
    String? password,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      isBusiness: isBusiness ?? this.isBusiness,
      token: token ?? this.token,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'isBusiness': isBusiness});
    result.addAll({'token': token});
    result.addAll({'password': password});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      isBusiness: map['isBusiness'] ?? false,
      token: map['token'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, email: $email, isBusiness: $isBusiness, token: $token, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.email == email &&
        other.isBusiness == isBusiness &&
        other.token == token &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        isBusiness.hashCode ^
        token.hashCode ^
        password.hashCode;
  }
}
