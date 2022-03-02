part of 'pages.dart';

class PageAyat extends GetView<ControllerAyat> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: secondMainColor,
          child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: secondMainColor,
                  title: Text(controller.suratName.value, style: greenTextFont),
                  centerTitle: true,
                  elevation: controller.elevation.value,
                  pinned: true,
                  expandedHeight: 350,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          Container(
                            height: 190,
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage("assets/top.png"),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/numberlogowhite.png"),
                                            fit: BoxFit.cover)),
                                    child: Center(
                                        child: Text(
                                      '${controller.suratId.value}',
                                      style:
                                          whiteTextFont.copyWith(fontSize: 12),
                                    )),
                                  ),
                                  Text('${controller.suratName.value}',
                                      style:
                                          whiteTextFont.copyWith(fontSize: 20)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('${controller.suratTrans.value}',
                                      style:
                                          whiteTextFont.copyWith(fontSize: 15)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                      '${controller.suratJenis.value} - ${controller.suratJumlah.value} Verses',
                                      style:
                                          whiteTextFont.copyWith(fontSize: 12))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 12),
                              height: 40,
                              child: Image.asset(BaseImage.bismillah,
                                  color: accentColor5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => AyatList(
                      controller.suratId.value == '1' ? controller.data.sublist(1, 7) : controller.data,
                      index,
                    ),
                    childCount: controller.suratId.value == '1'
                        ? controller.data.length - 1
                        : controller.data.length,
                  ),
                ),
              ]),
        ));
  }
}
