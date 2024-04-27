import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/widgets/atoms/app_label.dart';
import '../../../domain/entity/session_entity.dart';
import '../lesson_video_view_screen/lesson_video_view_screen.dart';

class LessonViewScreen extends StatelessWidget {
  const LessonViewScreen({super.key, required this.sessionsEntity});

  final SessionsEntity sessionsEntity;
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
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: AppLabel(
                                      text: sessionsEntity.category ?? "",
                                      fontSize: 24,
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: AppLabel(
                                      text:
                                          "${sessionsEntity.lesson.length} Lessons",
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: sessionsEntity.lesson.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(LessonVideoViewScreen(
                                url: sessionsEntity.lesson[index].videoUrl ??
                                    ''));
                          },
                          child: Card(
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
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: AppLabel(
                                              text: sessionsEntity.lesson[index]
                                                      .description ??
                                                  '',
                                              fontSize: 12,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              textColor: AppColors.appColorGray,
                                            ),
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
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: sessionsEntity.imageUrl ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
                color: AppColors.appColorBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
