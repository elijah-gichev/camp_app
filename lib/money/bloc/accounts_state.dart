import 'package:camp_app/core/models/account.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AccountsState {}

class AccountsInitial extends AccountsState {}

class AccountsLoadInProgress extends AccountsState {}

class AccountsLoadSuccess extends AccountsState {
  final List<User> accounts;

  AccountsLoadSuccess({required this.accounts});
}

class AccountsLoadError extends AccountsState {
  final Exception error;

  AccountsLoadError(this.error);
}