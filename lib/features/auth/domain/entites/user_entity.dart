class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String profileImageUrl;

  UserEntity(
      {required this.name,
      required this.email,
      required this.uId,
      required this.profileImageUrl});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "uId": uId,
      "profileImageUrl": profileImageUrl
    };
  }
}
