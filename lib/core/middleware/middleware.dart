import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/data_sources/auth_local_data_source.dart';

bool isLoged = false;
Future simpleMiddleware() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  AuthLocalDataSource authLocalDataSource =
      AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  String? token =
      authLocalDataSource.getCurrentUser().fold((l) => null, (r) => r.token);
  if (token != null) {
    isLoged = true;
  } else {
    isLoged = false;
  }
}
