import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/core/widgets/containers/register_container.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_bloc.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_state.dart';

import '../../../../../core/toast/toast_message.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: BlocConsumer<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              if (state is RegistrationError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(toastMessage(message: state.message));
              }
              if (state is RegistrationLoaded) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(toastMessage(message: state.message));
                Get.to(const LoginScreen());
              }
            },
            builder: (context, state) {
              if (state is RegistrationInitial) {
                return RegisterContainer();
              } else if (state is RegistrationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RegistrationLoaded) {
                return RegisterContainer();
              } else if (state is RegistrationError) {
                return RegisterContainer();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
