import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app_test/core/constant/app_colors.dart';
import 'package:mobile_app_test/core/constant/app_const_string.dart';
import 'package:mobile_app_test/core/widgets/atoms/app_heading.dart';
import 'package:mobile_app_test/core/widgets/atoms/app_label.dart';
import 'package:mobile_app_test/core/widgets/containers/session_container.dart';
import 'package:mobile_app_test/features/home/presentation/screens/session_block/session_bloc.dart';
import 'package:mobile_app_test/features/home/presentation/screens/session_block/session_event.dart';
import 'package:mobile_app_test/features/home/presentation/screens/session_block/session_state.dart';

import '../../../../../core/widgets/bottom_sheets/app_bottom_sheets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<SessionBloc>().add(SessionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const CircleAvatar(
            foregroundImage: AssetImage('assets/person_img.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              userLogOutBottomSheet(context: context);
            },
            child: const Icon(
              FontAwesomeIcons.powerOff,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const AppLabel(
          text: "Good Morning",
          fontSize: 24,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/category/${index + 1}.png"),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 100,
                                width: 100,
                              ),
                              AppLabel(
                                text: menuCategory[index],
                                fontSize: 14,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.appColorLightPurple,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppHeading(
                        text: "Basic Yoga",
                        fontSize: 20,
                        color: AppColors.appColorWhite,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 5,
                            child: AppLabel(
                                textColor: AppColors.appColorWhite,
                                fontSize: 13,
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              FontAwesomeIcons.arrowRight,
                              color: AppColors.appColorWhite,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 1,
                      child: AppLabel(
                        text: "Top Sessions",
                        fontSize: 24,
                      )),
                  BlocBuilder<SessionBloc, SessionState>(
                    builder: (context, state) {
                      if (state is SessionInitial) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ));
                      } else if (state is SessionLoading) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 100, horizontal: 100),
                          child: CircularProgressIndicator(),
                        ));
                      } else if (state is SessionLoaded) {
                        return SessionContainer(
                          sessionEntityList: state.sessionEntity,
                        );
                      } else if (state is SessionError) {
                        return Text(state.message);
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
