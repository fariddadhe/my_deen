part of 'widget.dart';

class WidgetJadwalShalat extends StatelessWidget {
  final String shalat;
  final int time;
  final String nameShalat;

  WidgetJadwalShalat(this.shalat, this.time, this.nameShalat);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
      padding: EdgeInsets.fromLTRB(defaultMargin, 15, defaultMargin, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny, color: Colors.black,),
              SizedBox(width: 10,),
              Text("$nameShalat", style: blackTextFont.copyWith(fontSize: 15),)
            ],
          ),
          Text("$shalat", style:  blackTextFont.copyWith(fontSize: 15),)
        ],
      ),
    );
  }
}
