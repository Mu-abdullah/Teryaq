import 'package:flutter/material.dart';

import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../data/model/d_setting_model.dart';
import 'doctor_info.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody(this.doctor, {super.key});

  final DSettingModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _doctorImage(url: doctor.image ?? AppTest.bloger),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.35,
              padding: AppPadding.symmetricPadding(),
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.mediumRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.6),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: DoctorInfo(doctor: doctor),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _doctorImage({required String url}) {
    return BoxDecoration(
      image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
    );
  }
}
