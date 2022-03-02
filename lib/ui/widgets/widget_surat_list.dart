part of 'widget.dart';

class SurahList extends StatelessWidget {
  final ModelSurat data;
  final int? index;

  SurahList(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    var no = index! + 1;
    return InkWell(
      onTap: () {
        Get.toNamed(PageTo.ayat, parameters: {
          DataSend.surat_id: data.sId.toString(),
          DataSend.surat_name: data.sName,
          DataSend.surat_trans: data.sArti,
          DataSend.surat_jumlah: data.sJumlah.toString(),
          DataSend.last_read: "not",
          DataSend.surat_jenis: data.sJenis,
        });
      },
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/numberlogo.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      '$no',
                      style: blackTextFont.copyWith(fontSize: 12),
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.sName,
                            style: blackTextFont,
                          ),
                          SizedBox(height: 5),
                          Text('${data.sJenis} | ${data.sJumlah} Ayat',
                              style: greyTextFont.copyWith(fontSize: 10))
                          // data.sArti.length == 25
                          //     ? Text('${data.sArti.substring(0, 18)}.....',
                          //         overflow: TextOverflow.ellipsis)
                          //     : Text(data.sArti,
                          //         overflow: TextOverflow.ellipsis),
                        ],
                      ))
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  data.sArab,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: greenTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}
