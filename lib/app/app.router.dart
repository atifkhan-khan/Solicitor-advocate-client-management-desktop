// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/data/userForm/ledgersDataModel.dart'
    as _i8;
import 'package:flutter_desktop_app_advocate/ui/views/add_update_legders/add_update_legders_view.dart'
    as _i6;
import 'package:flutter_desktop_app_advocate/ui/views/client_account/client_account_view.dart'
    as _i4;
import 'package:flutter_desktop_app_advocate/ui/views/home/home_view.dart'
    as _i2;
import 'package:flutter_desktop_app_advocate/ui/views/ledger_form/ledger_form_view.dart'
    as _i5;
import 'package:flutter_desktop_app_advocate/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const clientAccountView = '/client-account-view';

  static const ledgerFormView = '/ledger-form-view';

  static const addUpdateLegdersView = '/add-update-legders-view';

  static const all = <String>{
    homeView,
    startupView,
    clientAccountView,
    ledgerFormView,
    addUpdateLegdersView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.clientAccountView,
      page: _i4.ClientAccountView,
    ),
    _i1.RouteDef(
      Routes.ledgerFormView,
      page: _i5.LedgerFormView,
    ),
    _i1.RouteDef(
      Routes.addUpdateLegdersView,
      page: _i6.AddUpdateLegdersView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.ClientAccountView: (data) {
      final args = data.getArgs<ClientAccountViewArguments>(
        orElse: () => const ClientAccountViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.ClientAccountView(key: args.key),
        settings: data,
      );
    },
    _i5.LedgerFormView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LedgerFormView(),
        settings: data,
      );
    },
    _i6.AddUpdateLegdersView: (data) {
      final args = data.getArgs<AddUpdateLegdersViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.AddUpdateLegdersView(
            key: args.key, ledgersData: args.ledgersData),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ClientAccountViewArguments {
  const ClientAccountViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ClientAccountViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddUpdateLegdersViewArguments {
  const AddUpdateLegdersViewArguments({
    this.key,
    required this.ledgersData,
  });

  final _i7.Key? key;

  final _i8.LedgersData ledgersData;

  @override
  String toString() {
    return '{"key": "$key", "ledgersData": "$ledgersData"}';
  }

  @override
  bool operator ==(covariant AddUpdateLegdersViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.ledgersData == ledgersData;
  }

  @override
  int get hashCode {
    return key.hashCode ^ ledgersData.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToClientAccountView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.clientAccountView,
        arguments: ClientAccountViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLedgerFormView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ledgerFormView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddUpdateLegdersView({
    _i7.Key? key,
    required _i8.LedgersData ledgersData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addUpdateLegdersView,
        arguments:
            AddUpdateLegdersViewArguments(key: key, ledgersData: ledgersData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithClientAccountView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.clientAccountView,
        arguments: ClientAccountViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLedgerFormView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ledgerFormView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddUpdateLegdersView({
    _i7.Key? key,
    required _i8.LedgersData ledgersData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addUpdateLegdersView,
        arguments:
            AddUpdateLegdersViewArguments(key: key, ledgersData: ledgersData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
