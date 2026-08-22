import 'package:flutter/material.dart';

class DoctorSettingImage extends StatelessWidget {
  const DoctorSettingImage({required this.imageUrl, super.key, this.size = 56});
  final double size;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
