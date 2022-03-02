part of 'base.dart';

class BaseRoute {
  static List<GetPage> pages() => [
        _getPage(
          name: PageTo.main,
          page: PageMain(),
          binding: BindingMain(),
        ),
        _getPage(
          name: PageTo.quran,
          page: PageQuran(),
          binding: BindingQuran()
        ),
        _getPage(
          name: PageTo.ayat,
          page: PageAyat(),
          binding: BindingAyat()
        ),
        _getPage(
          name: PageTo.shalat,
          page: PageJadwalShalat(),
          binding: BindingJadwalShalat()
        ),
        _getPage(
          name: PageTo.qiblah,
          page: PageQiblah(),
          binding: BindingQIblah()
        ),
        _getPage(
          name: PageTo.listDzikir,
          page: PageListDzikir(),
        ),
        _getPage(
          name: PageTo.dzikir,
          page: PageDzikir(),
          binding: BindingDzikir()
        ),
      ];

  static GetPage _getPage({
    required var name,
    required var page,
    Bindings? binding,
  }) =>
      GetPage(
        name: name,
        page: () => page,
        binding: binding ?? null,
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 400),
      );
}

class PageTo {
  static const splash = "/";
  static const main = "/main";
  static const quran = "/quran";
  static const ayat = "/ayat";
  static const shalat = "/shalat";
  static const qiblah = "/qiblah";
  static const setting = "/setting";
  static const dzikir = "/dzikir";
  static const listDzikir = "/listDzikir";
}