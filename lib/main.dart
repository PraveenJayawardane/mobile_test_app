import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/core/middleware/middleware.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/launch_screen/launch_screen.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_bloc.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_bloc.dart';
import 'package:mobile_app_test/features/home/presentation/screens/session_block/session_bloc.dart';
import 'package:mobile_app_test/features/navigation/presentation/screens/navigation_screen/navigation_screen.dart';

import 'features/navigation/presentation/screens/navigation_screen/navigation_block.dart';
import 'injection_container.dart';

bool middle = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await simpleMiddleware();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBlock>(
            create: (context) => sl<NavigationBlock>()),
        BlocProvider<RegistrationBloc>(
            create: (context) => sl<RegistrationBloc>()),
        BlocProvider<LoginBloc>(create: (context) => sl<LoginBloc>()),
        BlocProvider<SessionBloc>(create: (context) => sl<SessionBloc>()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isLoged ? const NavigationScreen() : const LaunchScreen(),
      ),
    );
  }
}
