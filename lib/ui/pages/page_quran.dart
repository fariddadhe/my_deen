part of 'pages.dart';

class PageQuran extends GetView<ControllerQuran> {
  // final ControllerQuran _controllerQuran =
  //     Get.put(ControllerQuran(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: secondMainColor,
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 0),
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(children: [
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
                      Text('myDeen',
                          style: greenTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 35,
                        width: 35,
                        color: Colors.transparent,
                      ),
                    ]),
                  ),
                  PreferredSize(
                    preferredSize: (Size(200, 200)),
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 20, defaultMargin, 0),
                      child: TabBar(
                        controller: controller.tabController,
                        indicator: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            color: accentColor1,
                            width: 2.0,
                          )),
                        ),
                        labelColor: accentColor1,
                        unselectedLabelColor: accentColor3,
                        indicatorPadding: EdgeInsets.all(5),
                        tabs: controller.myTabs,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin),
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search',
                          style: greyTextFont.copyWith(fontSize: 10),
                        ),
                        Icon(
                          Icons.search,
                          size: 20,
                          color: accentColor3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.data.length,
                                itemBuilder: (_, index) =>
                                    SurahList(controller.data[index], index))),
                        Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.data.length,
                                itemBuilder: (_, index) =>
                                    SurahList(controller.data[index], index))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
