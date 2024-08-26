class ProfileEntities {
  final String name;
  final String email;
  final String profileImageUrl;
  final String uid;

  ProfileEntities(
      {required this.name,
      required this.email,
      required this.profileImageUrl,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "profileImageUrl": profileImageUrl,
      "uId": uid,
    };
  }
}
