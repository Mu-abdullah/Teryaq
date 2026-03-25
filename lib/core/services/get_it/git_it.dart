import 'package:get_it/get_it.dart';

import '../graph_ql/graph_ql.dart';
import '../supabase/auth_service/auth_services.dart';
import '../supabase/data_base_services.dart';
import '../supabase/supabase_services_repo.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  _registerRepositories();
  _registerServices();
}

void _registerRepositories() {
  // locator.registerLazySingleton(() => AuthRepo(locator()));
}

void _registerServices() {
  locator.registerLazySingleton(() => GraphQLService());
  locator.registerLazySingleton(() => AuthServices());
  locator.registerLazySingleton(() => SupabaseServicesRepo());
  locator.registerLazySingleton<DataService>(
    () => SupabaseDataService(locator()),
  );
}
