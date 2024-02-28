class CurrentUser {
  String id;

  String name;

  String email;

  String photo;

  String? number;

  bool? isVerified;

  CurrentUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    this.number,
    this.isVerified,
  }) {
    // Initialize default values for optional parameters if not provided

    this.number ??= '000';

    this.isVerified ??= false;
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,

      'name': name,

      'email': email,

      'photo': photo,

      // 'number': number ?? 'Unknown',

      'isVerified': isVerified,
    };
  }

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
      number: json['number'],
      isVerified: json['isVerified'],
    );
  }
}
