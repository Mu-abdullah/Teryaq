class UsersEntity {
  final String? id;
  final DateTime? createdAt;
  final String name;
  final String? about;
  final String? specialization;
  final String? phone;
  final String? email;
  final bool? verified;
  final String? image;
  final String role;
  final String? userId;
  final String? birth;
  final String? gender;

  const UsersEntity({
    this.id,
    this.createdAt,
    required this.name,
    this.about,
    this.specialization,
    this.phone,
    this.email,
    this.verified,
    this.image,
    this.role = 'doctor',
    this.userId,
    this.birth,
    this.gender,
  });
}
