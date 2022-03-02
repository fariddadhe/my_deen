part of 'controllers.dart';

class ControllerQuran extends GetxController with SingleGetTickerProviderMixin{
  RxList<ModelSurat> data = <ModelSurat>[].obs;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Surah'),
    Tab(text: 'Juz'),
    // Tab(text: 'Doa-doa'),
  ];

  TabController? tabController;
  
  @override
  void onInit() {
    _getData();
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController!.addListener(() {
      // screen.value = tabController!.index;
    });
    super.onInit();
  }

  void _getData() async {
    try {
      await DbQuran.surat().then((value) => data.value = value);
    } catch (e) {}
  }
}