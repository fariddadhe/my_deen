part of 'pages.dart';

class PageDzikir extends GetView<ControllerDzikir> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: secondMainColor,
        body: Stack(
          children: [
            SafeArea(
              child: controller.data.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        // SizedBox(
                        //   height: 350,
                        //   child: DefaultTabController(
                        //     length: controller.data.length,
                        //     child: Scaffold(
                        //       appBar: PreferredSize(
                        //         child: AppBar(
                        //           bottom: TabBar(
                        //             controller: controller.tabController,
                        //             indicatorColor: Colors.green,
                        //             indicatorSize: TabBarIndicatorSize.tab,
                        //             indicatorWeight: 3,
                        //             unselectedLabelColor: Colors.black.withOpacity(0.5),
                        //             labelColor: Colors.yellow,
                        //             isScrollable: true,
                        //             tabs: controller.data.map((ModelDzikir dzikir) {
                        //               return Tab(text: dzikir.judul);
                        //             }).toList(),
                        //           ),
                        //         ),
                        //         preferredSize: Size.fromHeight(50),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                                  Icons.arrow_back_ios_new,
                                  color: accentColor1,
                                  size: 30,
                                ),
                              ),
                              Spacer(),
                              Text(controller.jenisDzikir.value == "pagi" ? "Dzikir Pagi" : "Dzikir Petang",
                                  style: greenTextFont.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
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
                          margin: EdgeInsets.symmetric(horizontal: 30),
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
                            isScrollable: true,
                            tabs: controller.jenisDzikir.value == 'pagi'
                                ? BaseConst.dzikirPagi
                                : BaseConst.dzikirPetang,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: TabBarView(
                              controller: controller.tabController,
                              children: controller.widget),
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
