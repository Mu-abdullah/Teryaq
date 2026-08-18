import '../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';

class GetDDataFromSharedRepo {
  Future<Map<String, dynamic>> getDocData() async {
    final data = await SharedPref.getUserFromPreferences(key: PrefKeys.doctorModel);
    return data ?? {};
  }
}
