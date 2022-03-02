part of 'pages.dart';

class PageJadwalShalat extends GetView<ControllerJadwalShalat> {
  // @override
  // Widget build(BuildContext context) {
  //   return Obx(() => Scaffold(
  //         backgroundColor: mainColor,
  //         body: Stack(
  //           children: [
  //             SafeArea(
  //                 child: Column(
  //               children: [
  //                 Container(
  //                   height: 120,
  //                   color: Colors.white,
  //                   padding: EdgeInsets.fromLTRB(
  //                       defaultMargin, 40, defaultMargin, 20),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "Lokasi anda sekarang",
  //                                   style: greyTextFont.copyWith(fontSize: 15),
  //                                 ),
  //                                 SizedBox(height: 5),
  //                                 Row(
  //                                   children: [
  //                                     Icon(Icons.location_searching,
  //                                         color: accentColor3, size: 15),
  //                                     SizedBox(
  //                                       width: 5,
  //                                     ),
  //                                     Text(
  //                                       controller.loadingS.value
  //                                           ? "-----------"
  //                                           : "${controller.kotaName}",
  //                                       style: blackTextFont.copyWith(
  //                                           fontSize: 25),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                             Container(
  //                               height: 45,
  //                               width: 45,
  //                               child: Image.asset('assets/compass.png'),
  //                             )
  //                           ])
  //                     ],
  //                   ),
  //                 ),
  //                 Container(
  //                   margin: EdgeInsets.fromLTRB(
  //                       defaultMargin, 25, defaultMargin, 0),
  //                   child: DatePicker(
  //                     DateTime.now(),
  //                     width: 42,
  //                     height: 62,
  //                     controller: controller.pickerController,
  //                     initialSelectedDate: DateTime.now(),
  //                     selectedTextColor: Colors.black,
  //                     daysCount: 31,
  //                     selectionColor: Color(0xff00d2d3),
  //                     monthTextStyle: greyTextFont.copyWith(fontSize: 10),
  //                     dateTextStyle: greyTextFont.copyWith(fontSize: 10),
  //                     dayTextStyle: greyTextFont.copyWith(fontSize: 10),
  //                     onDateChange: (date) {
  //                       // controller.selectedValue = date;
  //                       controller.dateNow.value =
  //                           "${date.year}/${date.month}/${date.day}";
  //                       controller.setTime();
  //                       // print('${controller.selectedValue}');
  //                     },
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 15,
  //                 ),
  //                 controller.loading.value
  //                     ? CircularProgressIndicator(
  //                         strokeWidth: 2,
  //                       )
  //                     : Expanded(
  //                         child: Container(
  //                             child: ListView.builder(
  //                                 shrinkWrap: true,
  //                                 scrollDirection: Axis.vertical,
  //                                 itemCount: controller.shalat.length,
  //                                 itemBuilder: (_, index) => WidgetJadwalShalat(
  //                                     controller.shalat[index],
  //                                     controller.timeShalat[index],
  //                                     controller.nameShalat[index]))))
  //               ],
  //             ))
  //           ],
  //         ),
  //       ));
  // }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: secondMainColor,
          body: Stack(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 20),
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.home,
                            color: accentColor1,
                            size: 30,
                          ),
                        ),
                        Spacer(),
                        Text('Prayer Times',
                            style: greenTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 35,
                          width: 35,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    padding:
                        EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: accentColor5),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    0, defaultMargin, 0, defaultMargin),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Next Prayer ${controller.subTime.value}",
                                      style: greenTextFont.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      controller.timeTo.value,
                                      style:
                                          greenTextFont.copyWith(fontSize: 35),
                                    )
                                    // Row(
                                    //   children: [
                                    //     Icon(Icons.location_searching,
                                    //         color: accentColor3, size: 15),
                                    //     SizedBox(
                                    //       width: 5,
                                    //     ),
                                    //     Text(
                                    //       controller.loadingS.value
                                    //           ? "-----------"
                                    //           : "${controller.kotaName}",
                                    //       style: blackTextFont.copyWith(
                                    //           fontSize: 25),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 110,
                                width: 110,
                                child: Image.asset('assets/mosque.png'),
                              )
                            ])
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 25, defaultMargin, 0),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: accentColor1),
                      child: Column(
                        children: [
                          Text(
                            DateFormat("E, dd MMM yyyy").format(DateTime.now()),
                            style: whiteTextFont.copyWith(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            controller.loadingS.value
                                ? "-----------"
                                : "${controller.kotaName}",
                            style: greyTextFont.copyWith(fontSize: 12),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  controller.loading.value
                      ? CircularProgressIndicator(
                          strokeWidth: 2,
                        )
                      : Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 25, defaultMargin, 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: accentColor3),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: defaultMargin),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: accentColor4,
                                    width: 0.5,
                                  )),
                                ),
                                child: Row(
                                  children: [
                                    Text(controller.nameShalat[0],
                                        style: whiteTextFont.copyWith(
                                            fontSize: 15)),
                                    Spacer(),
                                    Text(controller.shalat[0],
                                        style: whiteTextFont),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: accentColor4,
                                    width: 0.5,
                                  )),
                                ),
                                child: Row(
                                  children: [
                                    Text(controller.nameShalat[1],
                                        style: whiteTextFont.copyWith(
                                            fontSize: 15)),
                                    Spacer(),
                                    Text(controller.shalat[1].toString(),
                                        style: whiteTextFont),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: accentColor4,
                                    width: 0.5,
                                  )),
                                ),
                                child: Row(
                                  children: [
                                    Text(controller.nameShalat[2],
                                        style: whiteTextFont.copyWith(
                                            fontSize: 15)),
                                    Spacer(),
                                    Text(controller.shalat[2].toString(),
                                        style: whiteTextFont),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: accentColor4,
                                    width: 0.5,
                                  )),
                                ),
                                child: Row(
                                  children: [
                                    Text(controller.nameShalat[3],
                                        style: whiteTextFont.copyWith(
                                            fontSize: 15)),
                                    Spacer(),
                                    Text(controller.shalat[3].toString(),
                                        style: whiteTextFont),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: accentColor4,
                                    width: 0.5,
                                  )),
                                ),
                                child: Row(
                                  children: [
                                    Text(controller.nameShalat[4],
                                        style: whiteTextFont.copyWith(
                                            fontSize: 15)),
                                    Spacer(),
                                    Text(controller.shalat[4].toString(),
                                        style: whiteTextFont),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                child: Row(
                                  children: [
                                    Text(controller.nameShalat[5],
                                        style: whiteTextFont.copyWith(
                                            fontSize: 15)),
                                    Spacer(),
                                    Text(controller.shalat[5].toString(),
                                        style: whiteTextFont),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ))
                  // controller.loading.value
                  //     ? CircularProgressIndicator(
                  //         strokeWidth: 2,
                  //       )
                  //     : Expanded(
                  //         child: Container(
                  //             child: ListView.builder(
                  //                 shrinkWrap: true,
                  //                 scrollDirection: Axis.vertical,
                  //                 itemCount: controller.shalat.length,
                  //                 itemBuilder: (_, index) => WidgetJadwalShalat(
                  //                     controller.shalat[index],
                  //                     controller.timeShalat[index],
                  //                     controller.nameShalat[index]))))
                ],
              ))
            ],
          ),
        ));
  }
}
