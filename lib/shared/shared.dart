import 'dart:convert';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:retaurant_app/data/models/models.dart';
import 'package:retaurant_app/data/response/response.dart';
import 'package:retaurant_app/services/services.dart';
import 'package:retaurant_app/ui/pages/pages.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supercharged/supercharged.dart';

import '../main.dart';

part 'asset_variables.dart';
part 'background_service.dart';
part 'constants.dart';
part 'date_time_helper.dart';
part 'notification_helper.dart';
part 'result_state.dart';
