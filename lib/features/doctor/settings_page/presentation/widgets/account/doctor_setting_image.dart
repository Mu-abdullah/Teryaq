import 'package:flutter/material.dart';

import '../../../../../../core/style/statics/image_test.dart';

class DoctorSettingImage extends StatelessWidget {
  const DoctorSettingImage({super.key, this.size = 56});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(AppTest.bloger),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
