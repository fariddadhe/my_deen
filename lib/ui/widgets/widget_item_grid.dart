part of 'widget.dart';

class WidgetItemGrid extends StatelessWidget {
  final String icon;
  final String background;
  final String title;
  final bool check;
  final double size;
  final String getTo;
  final box = GetStorage();

  WidgetItemGrid(this.icon, this.background, this.title, this.check, this.size,
      this.getTo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(getTo);
      },
      child: Container(
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: check
            ? InkWell(
                onTap: () {
                  Get.toNamed(PageTo.ayat, parameters: {
                    DataSend.surat_id: box.read(DataSend.surat_id),
                    DataSend.surat_name: box.read(DataSend.surat_name),
                    DataSend.surat_trans: box.read(DataSend.surat_id),
                    DataSend.surat_jumlah: box.read(DataSend.surat_jumlah),
                    DataSend.surat_jenis: box.read(DataSend.surat_jenis),
                    DataSend.last_read: "lastread",
                    DataSend.surat_nomor_ayat:
                        box.read(DataSend.surat_nomor_ayat).toString(),
                    DataSend.position: box.read(DataSend.position).toString()
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Read',
                          style: greyTextFont.copyWith(fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          box.read(DataSend.surat_name) ?? 'Ar Rahman',
                          style: whiteTextFont,
                        ),
                        Text(
                          'Verse No. ${box.read(DataSend.surat_nomor_ayat) ?? "1"}',
                          style: greyTextFont.copyWith(fontSize: 12),
                        ),
                        Text(
                          'Go to >',
                          style: whiteTextFont.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Image.asset('assets/lantern.png', height: 100, width: 70),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(icon, height: size, width: size),
                  Spacer(),
                  Text(
                    title,
                    style: whiteTextFont,
                  ),
                  Text(
                    'Go to >',
                    style: whiteTextFont.copyWith(fontSize: 10),
                  )
                ],
              ),
      ),
    );
  }
}
