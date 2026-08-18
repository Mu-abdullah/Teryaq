class DoctorEntity {
  final String? dId;
  final DateTime? dCreatedAt;
  final String? dName;
  final String? dAbout;
  final String? dSpecialization;
  final String? dPhone;
  final String? dEmail;
  final bool? dVerified;
  final String? dImage;
  final String role;

  DoctorEntity({
    this.dId,
    this.dCreatedAt,
    this.dName,
    this.dAbout,
    this.dSpecialization,
    this.dPhone,
    this.dEmail,
    this.dVerified,
    this.dImage,
    this.role = 'doctor',
  });
}
