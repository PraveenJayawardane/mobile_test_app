import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/core/widgets/atoms/app_label.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/widgets/buttons/app_text_button.dart';

class SingleLessonViewScreen extends StatelessWidget {
  const SingleLessonViewScreen({super.key, required this.index});
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
        minHeight: MediaQuery.of(context).size.height * 0.3,
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        panel: Column(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AppLabel(text: '1:30'),
                Image.asset("assets/audio_vector.jpg"),
                const AppLabel(text: '5:00')
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(FontAwesomeIcons.backward),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.appColorPurple,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    FontAwesomeIcons.play,
                    size: 25,
                    color: AppColors.appColorWhite,
                  ),
                ),
                const Icon(FontAwesomeIcons.forward)
              ],
            ))
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
            ),
            Positioned(
              left: 20,
              top: MediaQuery.of(context).size.height * 0.6,
              child: Align(
                alignment: Alignment.topCenter,
                child: AppTextButton(
                  textColor: AppColors.appColorBlack,
                  event: () {},
                  textSpan: const TextSpan(children: [
                    TextSpan(
                        text: "Lesson 01",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.appColorWhite,
                            fontFamily: 'Poppins')),
                    TextSpan(
                        text:
                            "\nLorem Ipsum is simply dummy text of \nthe printing and typesetting industry.",
                        style: TextStyle(
                            color: AppColors.appColorWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Poppins')),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
