import 'dart:io';

import 'package:flutter/foundation.dart';

@immutable
abstract class MainEvent {
  const MainEvent();
}

class MainInitEvent extends MainEvent {}