import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/features/lesson/domain/entity/session_entity.dart';

import '../../../features/lesson/presentation/screens/lesson_view_screen/lesson_view_screen.dart';
import '../../constant/app_colors.dart';
import '../atoms/app_label.dart';

class SessionContainer extends StatelessWidget {
  const SessionContainer({super.key, required this.sessionEntityList});
  final List<SessionsEntity> sessionEntityList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: GestureDetector(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: sessionEntityList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(LessonViewScreen(
                  sessionsEntity: sessionEntityList[index],
                ));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Column(children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: sessionEntityList[index].imageUrl ?? '',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => SizedBox(
                              height: 10,
                              width: 10,
                              child: Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: AppLabel(
                              text: sessionEntityList[index].title ?? '',
                              textOverflow: TextOverflow.ellipsis,
                              fontSize: 14,
                            ),
                          ),
                          AppLabel(
                            text:
                                '${sessionEntityList[index].lesson.length} lessons',
                            fontSize: 12,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: AppLabel(
                                  text:
                                      "By ${sessionEntityList[index].instructor}",
                                  fontSize: 10,
                                  textOverflow: TextOverflow.ellipsis,
                                  textColor: AppColors.appColorLightGray,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color: AppColors.appColorLightGray,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const AppLabel(
                                text: "All Level",
                                fontSize: 10,
                                textColor: AppColors.appColorLightGray,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color: AppColors.appColorLightGray,
                                    borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
