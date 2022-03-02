part of 'pages.dart';

class PageQiblah extends GetView<ControllerQiblah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondMainColor,
      body: Stack(
        children: [
          SafeArea(
              child: Column(children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 20),
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
                  Text('Qiblah',
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
              height: 320,
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                heightFactor: 0.3,
                widthFactor: 2.5,
                child: QiblahMaps(),
              ),
            ),
            FutureBuilder(
              future: controller.deviceSupport,
              builder: (_, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator(
                    strokeWidth: 2,
                  );
                if (snapshot.hasError)
                  return Center(
                    child: Text("Error: ${snapshot.error.toString()}"),
                  );

                if (snapshot.data!)
                  return QiblahCompass();
                else
                  return CircularProgressIndicator();
              },
            ),
          ]))
        ],
      ),
    );
  }
}
