import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../my_colors.dart';
import 'orange_container.dart';

class ClientDetails extends StatelessWidget {
  Color? colorContainer;
  String? titleContainer,
      street,
      region,
      buildingName,
      nearTo,
      city,
      floorNo,
      apartNo,
      name,
      phone,
      email;

  IconData? icon;
  ClientDetails({
    super.key,
    this.icon,
    this.colorContainer,
    this.apartNo,
    this.buildingName,
    this.email,
    this.city,
    this.floorNo,
    this.name,
    this.nearTo,
    this.phone,
    this.region,
    this.street,
    this.titleContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      // height: MediaQuery.of(context).size.height * .23,
      decoration: BoxDecoration(
        color: colorContainer,
        // borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text(titleContainer!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text(name!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                OrangeContainer(
                  icon: Icons.phone,
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text(phone!, style: TextStyle(fontSize: 11.sp)),
                ),
                SizedBox(
                  width: 1.h,
                ),
                OrangeContainer(
                  icon: Icons.email,
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text(email!, style: TextStyle(fontSize: 11.sp)),
                ),
              ],
              spacing: 1.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                Text(region!, style: TextStyle(fontSize: 11.sp)),
                Text(city!, style: TextStyle(fontSize: 11.sp))
              ],
              spacing: 70,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text(street!, style: TextStyle(fontSize: 12.sp)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                Text(buildingName!, style: TextStyle(fontSize: 11.sp)),
                Text(floorNo!, style: TextStyle(fontSize: 11.sp)),
                Text(apartNo!,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp))
              ],
              spacing: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text(nearTo!, style: TextStyle(fontSize: 12.sp)),
          ),
        ]),
      ),
    );
    ;
  }
}
