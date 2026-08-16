import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';

class FaceingTroubleBottomSheet extends StatelessWidget {
  const FaceingTroubleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricPadding(horizontal: 16, vertical: 32),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText(LangKeys.facingTroubleDescription),
          Center(
            child: QrImageView(
              data: 'https://wa.me/+201007007453',

              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}
