import '../../../../../core/entities/users/users_entity_model.dart';

class DHomeModel extends UsersEntity {
  DHomeModel({
    required super.dName,
    required super.userId,
    super.dId,
    super.dCreatedAt,
    super.dAbout,
    super.dSpecialization,
    super.dPhone,
    super.dEmail,
    super.dVerified,
    super.dImage,
    super.role = 'doctor',
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'd_name': dName,
      'user_id': userId,
      'd_id': dId,
      'd_created_at': dCreatedAt?.toIso8601String(),
      'd_about': dAbout,
      'd_specialization': dSpecialization,
      'd_phone': dPhone,
      'd_email': dEmail,
      'd_verified': dVerified,
      'd_image': dImage,
      'role': role,
    };
  }

  // fromJson
  factory DHomeModel.fromJson(Map<String, dynamic> json) {
    return DHomeModel(
      dName: json['d_name'],
      userId: json['user_id'],
      dId: json['d_id'],
      dCreatedAt: json['d_created_at'] != null
          ? DateTime.parse(json['d_created_at'])
          : null,
      dAbout: json['d_about'],
      dSpecialization: json['d_specialization'],
      dPhone: json['d_phone'],
      dEmail: json['d_email'],
      dVerified: json['d_verified'],
      dImage: json['d_image'],
      role: json['role'],
    );
  }
}
