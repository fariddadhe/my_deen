part of 'widget.dart';

class AyatList extends StatelessWidget {
  final List<ModelAyat> data;
  final index;
  final ControllerAyat _controllerAyat =
      Get.put(ControllerAyat(), permanent: false);

  AyatList(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondMainColor,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: accentColor3,
            width: 0.5,
          )),
        ),
        child: Column(
          children: [
            Container(
              height: 35,
              padding: EdgeInsets.only(right: 10),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: accentColor5),
                      child: Center(
                          child: Text('${index + 1}', style: whiteNumberFont)),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child:
                              Icon(Icons.share, size: 20, color: accentColor5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            _controllerAyat.addLastRead(data[index].qVerse);
                            Get.snackbar('HI', '${_controllerAyat.suratName} ditambahkan sebagai terakhir baca');
                          },
                          child: Icon(Icons.bookmark_outline,
                              size: 20, color: accentColor5),
                        )
                      ],
                    )
                  ]),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                '${data[index].qAyat} ${BaseFunc.converToArabicNumber((index + 1).toString())}',
                style: greenTextFont.copyWith(
                    fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            Visibility(
              visible: BaseGlobal.showLatin.value,
              child: Container(
                margin: EdgeInsets.only(top: 16),
                alignment: Alignment.topLeft,
                child: Text(
                  data[index].qRead,
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              alignment: Alignment.topLeft,
              child: Text(
                data[index].qIndo,
                style: greenTextFont.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
