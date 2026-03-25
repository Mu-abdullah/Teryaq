import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/functions/select_data.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../admin_home/presentation/widgets/admin_section.dart';
import '../new_client_text_form_felid.dart';

class ProfessionalInformation extends StatefulWidget {
  const ProfessionalInformation({super.key});

  @override
  State<ProfessionalInformation> createState() =>
      _ProfessionalInformationState();
}

class _ProfessionalInformationState extends State<ProfessionalInformation> {
  final _specializationController = TextEditingController();
  final _degreeController = TextEditingController();
  final _universityController = TextEditingController();
  final _graduationController = TextEditingController();
  final _cityController = TextEditingController();
  final _aboutController = TextEditingController();

  bool _isEnabled = false;

  @override
  void dispose() {
    _specializationController.dispose();
    _degreeController.dispose();
    _universityController.dispose();
    _graduationController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPadding.symmetricPadding(),
      child: AdminSections(
        title: LangKeys.professionalInformation,
        icon: HugeIcons.strokeRoundedWork,
        child: Column(
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  "${context.tr(LangKeys.doctor)} ?",
                  fontSize: 16,
                  isBold: true,
                  maxLines: 3,
                  tr: false,
                ),
                Switch(
                  value: _isEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isEnabled = value;
                    });
                  },
                  activeThumbColor: AppColors.blueAccent,
                ),
              ],
            ),

            Column(
              spacing: 16,
              children: [
                Opacity(
                  opacity: _isEnabled ? 1.0 : 0.5,
                  child: IgnorePointer(
                    ignoring: !_isEnabled,
                    child: Column(
                      spacing: 16,
                      children: [
                        _buildTextField(
                          controller: _specializationController,
                          label: LangKeys.specialization,
                          icon: HugeIcons.strokeRoundedWork,
                          type: TextInputType.multiline,
                          enabled: _isEnabled,
                        ),

                        _buildTextField(
                          controller: _degreeController,
                          label: LangKeys.degree,
                          hint: LangKeys.degreehint,
                          icon: HugeIcons.strokeRoundedProfile,
                          type: TextInputType.multiline,
                          enabled: _isEnabled,
                        ),
                        _buildTextField(
                          controller: _graduationController,
                          label: LangKeys.graduation,
                          icon: HugeIcons.strokeRoundedCalendar01,
                          type: TextInputType.multiline,
                          onTap: () {
                            selectData(
                              context: context,
                              controller: _graduationController,
                              content: LangKeys.graduation,
                              format: 'yyyy',
                            );
                          },
                          enabled: _isEnabled,
                        ),
                      ],
                    ),
                  ),
                ),

                _buildTextField(
                  controller: _universityController,
                  label: LangKeys.university,
                  icon: HugeIcons.strokeRoundedUniversity,
                  type: TextInputType.text,
                ),

                _buildTextField(
                  controller: _cityController,
                  label: LangKeys.city,
                  icon: HugeIcons.strokeRoundedCity03,
                  type: TextInputType.text,
                ),
                _buildTextField(
                  controller: _aboutController,
                  label: LangKeys.about,
                  icon: HugeIcons.strokeRoundedInformationSquare,
                  type: TextInputType.multiline,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required TextInputType type,
    String? Function(String?)? validate,
    String? hint,
    bool isPassword = false,
    int? maxLength,
    int? maxLines,
    VoidCallback? onTap,
    bool enabled = true,
  }) {
    return NewClientTextFormFelid(
      controller: controller,
      type: type,
      label: label,
      hint: hint ?? label,
      icon: icon,
      validate: validate,
      isPassword: isPassword,
      maxLength: maxLength,
      maxLines: maxLines,
      onTap: onTap,
      enabled: enabled,
    );
  }
}
