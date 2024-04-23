import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/features/lesson/presentation/screens/single_lesson_view_screen/single_lesson_view_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/widgets/atoms/app_label.dart';

class LessonViewScreen extends StatelessWidget {
  const LessonViewScreen({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
              ),
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColors.appColorLightGray,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
        minHeight: MediaQuery.of(context).size.height * 0.4,
        maxHeight: MediaQuery.of(context).size.height * 0.4,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        panel: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: AppLabel(
                                      text: "Yoga Pilates Full Body",
                                      fontSize: 24,
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: AppLabel(
                                      text: "5 Lessons",
                                      textColor: AppColors.appColorPurple,
                                      fontSize: 12,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(SingleLessonViewScreen(
                          index: index,
                        ));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/single_icon.png")),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 30,
                                        width: 30,
                                      ),
                                    ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppLabel(
                                            text: 'Lesson ${index + 1}',
                                            fontSize: 14,
                                          ),
                                          const AppLabel(
                                            text:
                                                'Lorem Ipsum is simply dummy text of ',
                                            fontSize: 12,
                                            textColor: AppColors.appColorGray,
                                          ),
                                        ]),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: AppColors.appColorBlack,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Icon(
                                        FontAwesomeIcons.play,
                                        size: 15,
                                        color: AppColors.appColorWhite,
                                      ),
                                    )
                                  ]),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/lessons/${index + 1}.png",
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 30,
              top: 70,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.appColorWhite,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(FontAwesomeIcons.xmark),
                ),
              ),
            ),
            const Positioned(
              left: 30,
              top: 50,
              child: BackButton(
                color: AppColors.appColorWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
