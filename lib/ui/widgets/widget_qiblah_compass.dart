part of 'widget.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              // case LocationPermission.denied:
              //   return LocationErrorWidget(
              //     error: "Location service permission denied",
              //     callback: _checkLocationStatus,
              //   );
              // case LocationPermission.deniedForever:
              //   return LocationErrorWidget(
              //     error: "Location service Denied Forever !",
              //     callback: _checkLocationStatus,
              //   );
              // case GeolocationStatus.unknown:
              //   return LocationErrorWidget(
              //     error: "Unknown Location service error",
              //     callback: _checkLocationStatus,
              //   );
              default:
                return Container();
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset(
    'assets/compass.svg',
    height: 200,
    width: 200,
  );
  final _needleSvg = SvgPicture.asset(
    'assets/needle.svg',
    fit: BoxFit.contain,
    height: 200,
    width: 200,
    alignment: Alignment.center,
  );

  final _qiblah = Image.asset('assets/qiblah.png',
      color: accentColor1,
      height: 200,
      width: 200,
      alignment: Alignment.center,
      fit: BoxFit.contain);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();

        final qiblahDirection = snapshot.data!;

        return Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
              padding:
                  EdgeInsets.fromLTRB(defaultMargin, 15, defaultMargin, 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 15,
                    width: 15,
                    child: Image.asset('assets/compass.png'),
                  ),
                  Text("${qiblahDirection.offset.toStringAsFixed(3)}°")
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: (qiblahDirection.direction * (pi / 180) * -1),
                  child: _compassSvg,
                ),
                Transform.rotate(
                  angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                  alignment: Alignment.center,
                  child: _needleSvg,
                ),
                // Positioned(
                //   bottom: 8,
                //   child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
                // )
              ],
            )
          ],
        );
      },
    );
  }
}
