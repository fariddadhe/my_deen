part of 'controllers.dart';

class ControllerMain extends GetxController {
  final List<StaggeredTile> staggeredTiles = <StaggeredTile>[
    StaggeredTile.count(2, 0.8),
    StaggeredTile.count(1, 1.2),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1.2),
    StaggeredTile.count(1, 1),
  ];

  final List<Widget> tiles = <Widget>[
    WidgetItemGrid('icon', 'assets/top.png', 'Quran', true, 0, PageTo.quran),
    WidgetItemGrid('assets/icon1.png', 'assets/1.png', 'Quran', false, 45, PageTo.quran),
    WidgetItemGrid('assets/icon2.png', 'assets/2.png', 'Qiblah', false, 33, PageTo.qiblah),
    WidgetItemGrid('assets/icon4.png', 'assets/3.png', 'Praying Time', false, 45, PageTo.shalat),
    WidgetItemGrid('assets/icon3.png', 'assets/4.png', 'Dzikir', false, 40, PageTo.listDzikir),
  ];

  @override
  void onInit() {
    _reqPermissionLocation();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _reqPermissionLocation() async {
    Location location = Location();
    bool service;
    PermissionStatus permissionStatus;

    service = await location.serviceEnabled();
    if (!service) {
      service = await location.requestService();
      if (!service) return;
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) return;
    }
  }
}
