part of 'pages.dart';

class PageListDzikir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text('Dzikir',
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
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(PageTo.dzikir,
                                parameters: {DataSend.jenis_dzikir: "pagi"});
                          },
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(defaultMargin),
                            margin: EdgeInsets.all(defaultMargin),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/1.png'),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "PAGI",
                                    style: whiteTextFont.copyWith(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    'assets/sunrise.png',
                                    width: 80,
                                    height: 80,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(PageTo.dzikir,
                                parameters: {DataSend.jenis_dzikir: "petang"});
                          },
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(defaultMargin),
                            margin: EdgeInsets.all(defaultMargin),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/2.png'),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "PETANG",
                                    style: whiteTextFont.copyWith(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    'assets/sunset.png',
                                    width: 80,
                                    height: 80,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
