import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/statics/image_test.dart';
import '../widgets/doctor_info.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(),
      width: context.width(),
      decoration: _doctorImage(url: AppTest.bloger),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: context.height(percent: 0.35),
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.mediumRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: AppPadding.symmetricPadding(),
              child: DoctorInfo(),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _doctorImage({String url = AppTest.bloger}) {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          url,
          webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
