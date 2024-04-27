import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/core/widgets/containers/login_container.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_bloc.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_state.dart';
import 'package:mobile_app_test/features/navigation/presentation/screens/navigation_screen/navigation_screen.dart';

import '../../../../../core/toast/toast_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(toastMessage(message: state.message));
          }
          if (state is LoginLoaded) {
            Get.to(const NavigationScreen());
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
            return LoginContainer();
          } else if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginLoaded) {
            return LoginContainer();
          } else if (state is LoginError) {
            return LoginContainer();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
