part of 'pages.dart';

class PageMain extends GetView<ControllerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(children: [
        SafeArea(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 0),
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: Row(children: [
                Icon(
                  Icons.menu,
                  color: accentColor1,
                  size: 30,
                ),
                Spacer(),
                Text(
                  'myDeen',
                  style: greenTextFont.copyWith(fontSize: 20),
                ),
                Spacer(),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/foto.jpg"),
                            fit: BoxFit.cover))),
              ]),
            ),
            Image.asset('assets/quran.png', height: 100, width: 100),
            Container(
              height: 400,
              margin: EdgeInsets.only(top: 20),
              child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
                  child: StaggeredGridView.count(
                    crossAxisCount: 2,
                    staggeredTiles: controller.staggeredTiles,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.all(4),
                    children: controller.tiles,
                  )),
            )
          ],
        ))
      ]),
    );
  }
}
