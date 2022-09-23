class User {
  String name;
  String email;
  String? sessionkey;
  User({required this.name, required this.email, this.sessionkey});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        sessionkey: json['session_key'] as String?);
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        if (sessionkey != null) 'session_key': sessionkey
      };
}
