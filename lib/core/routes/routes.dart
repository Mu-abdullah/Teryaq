import 'package:flutter/material.dart';

import '../../features/admin/admin_home/presentation/views/admin_home.dart';
import '../../features/admin/new_client/presentation/view/new_client_screen.dart';
import '../../features/admin/test/test_screen.dart';
import '../../features/assistant/presentation/views/assistant_screen.dart';
import '../../features/auth/presentation/views/auth_screen.dart';
import '../../features/doctor/doctor_home/presentation/views/doctor_home.dart';
import '../../features/doctor/messenger/presentation/views/messenger_screen.dart';
import '../../features/doctor/messenger/presentation/widgets/chat_screen/chat_screen.dart';
import '../../features/doctor/patient_list_screen/presentation/views/patient_list_screen.dart';
import '../../features/doctor/patient_screen/presentation/views/patient_screen.dart';
import '../../features/doctor/search_screen/presentation/views/search_screen.dart';
import '../../features/doctor/settings_page/data/model/d_setting_model.dart';
import '../../features/doctor/settings_page/presentation/views/settings_page.dart';
import '../../features/doctor/settings_page/presentation/widgets/profile/profile_page.dart';
import '../../features/doctor/visits_screen/presentation/views/visits_screen.dart';
import '../../features/user/user_home/presentation/views/user_patient_screen.dart';
import '../../features/user/user_profile/presentation/views/user_profile.dart';
import '../app/image/image_preview.dart';
import '../app/language/language_screen.dart';
import '../app/no_internet/no_internet_screen.dart';
import 'base_routes.dart';
import 'routes_name.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    ///////// basic routes
    case RoutesNames.imagePreview:
      return BaseRoute(
        page: PreviewImage(
          imageUrl: args?['imageUrl'] as String?,
          title: args?['title'] as String?,
          imagesList: (args?['imagesList'] as List?)
              ?.whereType<String>()
              .toList(),
        ),
      );

    case RoutesNames.language:
      return BaseRoute(page: LanguageScreen());

    case RoutesNames.noInternet:
      return BaseRoute(page: NoInternetScreen());

    /////////
    /////////[admin feature routes]////////////
    /////////

    case RoutesNames.adminHome:
      return BaseRoute(page: const AdminHome());

    case RoutesNames.newClient:
      return BaseRoute(page: const NewClientScreen());

    case RoutesNames.test:
      return BaseRoute(page: const TestScreen());
    case RoutesNames.authScreen:
      return BaseRoute(page: const AuthView());

    /////////
    /////////[doctor feature routes]////////////
    /////////

    case RoutesNames.doctorHome:
      return BaseRoute(
        page: DoctorHomeScreen(
          isAdmin: args?['isAdmin'] as bool? ?? false,
          uid: args?['uid'] as String? ?? '',
        ),
      );

    case RoutesNames.settingsScreen:
      return BaseRoute(page: SettingsPage());

    case RoutesNames.doctorSearch:
      return BaseRoute(
        page: SearchScreen(searchQuery: args?['searchQuery'] as String?),
      );

    case RoutesNames.doctorProfile:
      return BaseRoute(
        page: ProfilePage(
          doctor: args?['doctor'] as DSettingModel,
        ),
      );

    case RoutesNames.patientScreen:
      return BaseRoute(page: PatientScreen());

    case RoutesNames.patientListScreen:
      return BaseRoute(page: PatientListScreen());

    case RoutesNames.visitsScreen:
      return BaseRoute(page: VisitsScreen());

    case RoutesNames.messengerScreen:
      return BaseRoute(page: MessengerScreen());

    case RoutesNames.chatScreen:
      return BaseRoute(page: ChatScreen());

    /////////
    /////////[Student feature routes]////////////
    /////////

    case RoutesNames.assistantScreen:
      return BaseRoute(
        page: AssistantScreen(isAdmin: args?['isAdmin'] as bool? ?? false),
      );

    /////////
    /////////[Patient feature routes]////////////

    case RoutesNames.userHomeScreen:
      return BaseRoute(
        page: UserScreen(isAdmin: args?['isAdmin'] as bool? ?? false),
      );
    case RoutesNames.userProfileScreen:
      return BaseRoute(page: UserProfile());

    /////////

    default:
      return BaseRoute(page: const MaterialApp());
  }
}
