import 'package:flutter/material.dart';

@immutable
abstract class BoomEvent {}

class BoomShaked extends BoomEvent {}
class BoomClicked extends BoomEvent {}
