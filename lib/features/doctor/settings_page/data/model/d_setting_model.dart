import '../../../../../core/entities/users/users_entity_model.dart';

class DSettingModel extends UsersEntity {
  DSettingModel({
    required super.name,
    required super.userId,
    super.id,
    super.createdAt,
    super.about,
    super.specialization,
    super.phone,
    super.email,
    super.verified,
    super.image,
    super.role = 'doctor',
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'user_id': userId,
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'about': about,
      'specialization': specialization,
      'phone': phone,
      'email': email,
      'verified': verified,
      'image': image,
      'role': role,
    };
  }

  // fromJson
  factory DSettingModel.fromJson(Map<String, dynamic> json) {
    return DSettingModel(
      name: json['name'],
      userId: json['user_id'],
      id: json['id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      about: json['about'],
      specialization: json['specialization'],
      phone: json['phone'],
      email: json['email'],
      verified: json['verified'],
      image: json['image'],
      role: json['role'],
    );
  }
}
