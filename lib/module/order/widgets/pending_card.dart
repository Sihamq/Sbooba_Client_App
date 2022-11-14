import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/shared/dot_line.dart';
import 'package:sizer/sizer.dart';

class PendingCard extends StatelessWidget {
  const PendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.h)),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(.5.w),
                  child: CircleAvatar(
                    backgroundColor: myGreen,
                    radius: 25,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/45.png"),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Ahmed Ali",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: myOrange,
                          size: 16,
                        ),
                        Text("77777777",
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(1.w),
              child: MySeparator(),
            ),
            Wrap(
              spacing: 2.w,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Icon(
                  Icons.calendar_month,
                  color: myOrange,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Text("24-3-2022",
                      style: TextStyle(
                          fontSize: 8.sp, fontWeight: FontWeight.bold)),
                ),
                Icon(
                  Icons.av_timer,
                  color: myOrange,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Text("10:00 PM",
                      style: TextStyle(
                          fontSize: 8.sp, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Text(
                "#76786",
                style: TextStyle(
                    color: myGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
              ),
            ),
            Spacer(),
            Container(
              color: myGreen.withOpacity(.1),
              height: 4.5.h,
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Row(children: [
                  Text(
                    "Total".tr,
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "${100.0}SAR",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: myOrange),
                  )
                ]),
              ),
            )
          ],
        )
        //  Column(
        //   children: [
        //     Row(
        //       children: [
        //         // CircleAvatar(
        //         //   backgroundImage: AssetImage("assets/1.png"),
        //         // ),
        //         Column(children: [
        //           Text("Ali Ahmed",
        //               style: TextStyle(fontWeight: FontWeight.bold)),
        //           Row(
        //             children: [
        //               Icon(
        //                 Icons.phone,
        //                 color: myOrange,
        //               ),
        //               Text("77777777")
        //             ],
        //           ),
        //         ]),
        //         Text("#56788"),
        //         Container(
        //           height: 6.h,
        //           width: 100.w,
        //           decoration: BoxDecoration(
        //             color: myGreen.withOpacity(.1),
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Row(children: [
        //             Text("Total"),
        //             Spacer(),
        //             Text("${100} SAR "),
        //           ]),
        //         ),
        //         MySeparator(),
        //         Wrap(
        //           crossAxisAlignment: WrapCrossAlignment.start,
        //           children: [
        //             Icon(
        //               Icons.calendar_month,
        //               color: myOrange,
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(top: 1.h),
        //               child: Text(
        //                 "24-3-2022",
        //                 style: TextStyle(fontSize: 11.sp),
        //               ),
        //             ),
        //             Icon(
        //               Icons.timer,
        //               color: myOrange,
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(top: 1.h),
        //               child:
        //                   Text("10:00 PM", style: TextStyle(fontSize: 11.sp)),
        //             )
        //           ],
        //         ),
        //       ],
        //     )
        //   ],
        // )
        );
  }
}
