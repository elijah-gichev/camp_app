import 'package:flutter/material.dart';

@immutable
abstract class AccountsEvent {}

class AccountsDataLoadRequested extends AccountsEvent {}