import 'package:get_it/get_it.dart';

import 'features/navigation/presentation/screens/navigation_screen/navigation_block.dart';

var sl = GetIt.instance;

Future<void> setup() async {
  sl.registerFactory(() => NavigationBlock());
}
