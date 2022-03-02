part of 'widget.dart';

class WidgetDzikir extends StatelessWidget {
  final ModelDzikir data;

  WidgetDzikir(this.data);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(data.judul, style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(data.petunjuk, style: greenTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 15)),
            // Text(data.arab, style: blackTextFont.copyWith(fontSize: 25)),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                data.arab,
                style: greenTextFont.copyWith(
                    fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            // Text(data.baca, style: blackTextFont.copyWith(fontSize: 15)),
            Visibility(
              visible: BaseGlobal.showLatin.value,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  data.baca,
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
            data.baca == "" ? SizedBox(height: 0) : SizedBox(height: 20,),
            Text(data.arti, style: greenTextFont.copyWith(fontSize: 15)),
            Text(data.sumber, style: greenTextFont.copyWith(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
