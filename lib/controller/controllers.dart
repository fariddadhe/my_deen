import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:my_deen/api/api_service.dart';
import 'package:my_deen/api/api_url.dart';
import 'package:my_deen/base/base.dart';
import 'package:my_deen/db/db_dzikir.dart';
import 'package:my_deen/db/db_quran.dart';
import 'package:my_deen/model/models.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:my_deen/ui/widgets/widget.dart';
import 'package:get_storage/get_storage.dart';

part 'quran.dart';
part 'ayat.dart';
part 'jadwal_shalat.dart';
part 'kota.dart';
part 'qiblah.dart';
part 'main.dart';
part 'dzikir.dart';