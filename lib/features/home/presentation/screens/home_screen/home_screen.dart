import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/core/constant/app_colors.dart';
import 'package:mobile_app_test/core/constant/app_const_string.dart';
import 'package:mobile_app_test/core/widgets/atoms/app_heading.dart';
import 'package:mobile_app_test/core/widgets/atoms/app_label.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_screen.dart';

import '../../../../lesson/presentation/screens/lesson_view_screen/lesson_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              Get.to(const LoginScreen());
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
                  Expanded(
                    flex: 8,
                    child: GestureDetector(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(LessonViewScreen(
                                index: index,
                              ));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Column(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/category/${index + 1}.png")),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 100,
                                      width: 100,
                                    ),
                                  ]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const AppLabel(
                                          text: 'Yoga Pilates',
                                          fontSize: 14,
                                        ),
                                        const AppLabel(
                                          text: '5 lessons',
                                          fontSize: 12,
                                        ),
                                        Row(
                                          children: [
                                            const AppLabel(
                                              text: "By Sarah William",
                                              fontSize: 10,
                                              textColor:
                                                  AppColors.appColorLightGray,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 5,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .appColorLightGray,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const AppLabel(
                                              text: "All Level",
                                              fontSize: 10,
                                              textColor:
                                                  AppColors.appColorLightGray,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 5,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .appColorLightGray,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              FontAwesomeIcons.solidStar,
                                              color: AppColors.appColorOrange,
                                              size: 10,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const AppLabel(
                                              text: "4.5",
                                              fontSize: 10,
                                              textColor: AppColors.appColorGray,
                                            ),
                                          ],
                                        )
                                      ]),
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
