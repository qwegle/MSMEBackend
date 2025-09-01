import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  MsmeAuthUser? initialUser;
  MsmeAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(MsmeAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? LoginWidget() : LandingpageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? LoginWidget() : LandingpageWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: DashboardOsicWidget.routeName,
          path: DashboardOsicWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DashboardOsicWidget(),
        ),
        FFRoute(
          name: ApplicationListAdminWidget.routeName,
          path: ApplicationListAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ApplicationListAdminWidget(),
        ),
        FFRoute(
          name: NoDueCertificateAdminWidget.routeName,
          path: NoDueCertificateAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NoDueCertificateAdminWidget(),
        ),
        FFRoute(
          name: NewOtsFormWidget.routeName,
          path: NewOtsFormWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NewOtsFormWidget(),
        ),
        FFRoute(
          name: AcknowledgementWidget.routeName,
          path: AcknowledgementWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AcknowledgementWidget(),
        ),
        FFRoute(
          name: DashboardUserWidget.routeName,
          path: DashboardUserWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DashboardUserWidget(),
        ),
        FFRoute(
          name: OtsFormStatusWidget.routeName,
          path: OtsFormStatusWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OtsFormStatusWidget(),
        ),
        FFRoute(
          name: TrackOtsFormStatusFlowWidget.routeName,
          path: TrackOtsFormStatusFlowWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TrackOtsFormStatusFlowWidget(),
        ),
        FFRoute(
          name: NoDueCertificatesUserWidget.routeName,
          path: NoDueCertificatesUserWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NoDueCertificatesUserWidget(),
        ),
        FFRoute(
          name: ExsitingLoanApplicationStatusWidget.routeName,
          path: ExsitingLoanApplicationStatusWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ExsitingLoanApplicationStatusWidget(),
        ),
        FFRoute(
          name: NoDueCertificateviewWidget.routeName,
          path: NoDueCertificateviewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NoDueCertificateviewWidget(),
        ),
        FFRoute(
          name: ViewUserWidget.routeName,
          path: ViewUserWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ViewUserWidget(),
        ),
        FFRoute(
          name: DashboardOsfcWidget.routeName,
          path: DashboardOsfcWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DashboardOsfcWidget(),
        ),
        FFRoute(
          name: ApplicationListBranchWidget.routeName,
          path: ApplicationListBranchWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ApplicationListBranchWidget(),
        ),
        FFRoute(
          name: MemorandomBranchWidget.routeName,
          path: MemorandomBranchWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MemorandomBranchWidget(),
        ),
        FFRoute(
          name: ClosingStockWidget.routeName,
          path: ClosingStockWidget.routePath,
          builder: (context, params) => ClosingStockWidget(),
        ),
        FFRoute(
          name: OpeningStockListWidget.routeName,
          path: OpeningStockListWidget.routePath,
          builder: (context, params) => OpeningStockListWidget(),
        ),
        FFRoute(
          name: ViewSumbitedClaimDocumentWidget.routeName,
          path: ViewSumbitedClaimDocumentWidget.routePath,
          builder: (context, params) => ViewSumbitedClaimDocumentWidget(),
        ),
        FFRoute(
          name: MemberWidget.routeName,
          path: MemberWidget.routePath,
          builder: (context, params) => MemberWidget(),
        ),
        FFRoute(
          name: ClosingStockListWidget.routeName,
          path: ClosingStockListWidget.routePath,
          builder: (context, params) => ClosingStockListWidget(),
        ),
        FFRoute(
          name: DocumentsWidget.routeName,
          path: DocumentsWidget.routePath,
          builder: (context, params) => DocumentsWidget(),
        ),
        FFRoute(
          name: GovtOrderWidget.routeName,
          path: GovtOrderWidget.routePath,
          requireAuth: true,
          builder: (context, params) => GovtOrderWidget(),
        ),
        FFRoute(
          name: FloatTenderWidget.routeName,
          path: FloatTenderWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FloatTenderWidget(),
        ),
        FFRoute(
          name: TenderDetailsWidget.routeName,
          path: TenderDetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TenderDetailsWidget(),
        ),
        FFRoute(
          name: ChoseL1bidderWidget.routeName,
          path: ChoseL1bidderWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChoseL1bidderWidget(),
        ),
        FFRoute(
          name: SupplyOrderWidget.routeName,
          path: SupplyOrderWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SupplyOrderWidget(),
        ),
        FFRoute(
          name: ExsitingLoanApplicationStatusAdminWidget.routeName,
          path: ExsitingLoanApplicationStatusAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) =>
              ExsitingLoanApplicationStatusAdminWidget(),
        ),
        FFRoute(
          name: ExLoanAplicStaBranchWidget.routeName,
          path: ExLoanAplicStaBranchWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ExLoanAplicStaBranchWidget(),
        ),
        FFRoute(
          name: DashboardOsfcAdminWidget.routeName,
          path: DashboardOsfcAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DashboardOsfcAdminWidget(),
        ),
        FFRoute(
          name: AcknowledgementSlipUserWidget.routeName,
          path: AcknowledgementSlipUserWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AcknowledgementSlipUserWidget(),
        ),
        FFRoute(
          name: AcknowledgementSlipAdminWidget.routeName,
          path: AcknowledgementSlipAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AcknowledgementSlipAdminWidget(),
        ),
        FFRoute(
          name: AckSlipBranchWidget.routeName,
          path: AckSlipBranchWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AckSlipBranchWidget(),
        ),
        FFRoute(
          name: LandingpageWidget.routeName,
          path: LandingpageWidget.routePath,
          builder: (context, params) => LandingpageWidget(),
        ),
        FFRoute(
          name: OtsFormViewUsersWidget.routeName,
          path: OtsFormViewUsersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OtsFormViewUsersWidget(),
        ),
        FFRoute(
          name: MemorandomAdminWidget.routeName,
          path: MemorandomAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MemorandomAdminWidget(),
        ),
        FFRoute(
          name: MemoApprovalStatusWidget.routeName,
          path: MemoApprovalStatusWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MemoApprovalStatusWidget(
            memoID: params.getParam(
              'memoID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ViewFormDetailsWidget.routeName,
          path: ViewFormDetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ViewFormDetailsWidget(),
        ),
        FFRoute(
          name: SettlementOrderWidget.routeName,
          path: SettlementOrderWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SettlementOrderWidget(),
        ),
        FFRoute(
          name: OtsFormViewUsersadminWidget.routeName,
          path: OtsFormViewUsersadminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OtsFormViewUsersadminWidget(),
        ),
        FFRoute(
          name: SettlementOrderUserWidget.routeName,
          path: SettlementOrderUserWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SettlementOrderUserWidget(),
        ),
        FFRoute(
          name: ClaimDocumentsWidget.routeName,
          path: ClaimDocumentsWidget.routePath,
          builder: (context, params) => ClaimDocumentsWidget(),
        ),
        FFRoute(
          name: RegisterOkviWidget.routeName,
          path: RegisterOkviWidget.routePath,
          builder: (context, params) => RegisterOkviWidget(),
        ),
        FFRoute(
          name: DashboardOkviWidget.routeName,
          path: DashboardOkviWidget.routePath,
          builder: (context, params) => DashboardOkviWidget(),
        ),
        FFRoute(
          name: OpeningStocksWidget.routeName,
          path: OpeningStocksWidget.routePath,
          builder: (context, params) => OpeningStocksWidget(),
        ),
        FFRoute(
          name: ClosingStockLatestWidget.routeName,
          path: ClosingStockLatestWidget.routePath,
          builder: (context, params) => ClosingStockLatestWidget(),
        ),
        FFRoute(
          name: ViewClaimDocumentsWidget.routeName,
          path: ViewClaimDocumentsWidget.routePath,
          builder: (context, params) => ViewClaimDocumentsWidget(),
        ),
        FFRoute(
          name: ProfileUserWidget.routeName,
          path: ProfileUserWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileUserWidget(),
        ),
        FFRoute(
          name: PasswordChangeWidget.routeName,
          path: PasswordChangeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PasswordChangeWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: TermsofServiceWidget.routeName,
          path: TermsofServiceWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TermsofServiceWidget(),
        ),
        FFRoute(
          name: ViewUserDetailsWidget.routeName,
          path: ViewUserDetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ViewUserDetailsWidget(),
        ),
        FFRoute(
          name: SanctionOrderWidget.routeName,
          path: SanctionOrderWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SanctionOrderWidget(),
        ),
        FFRoute(
          name: ProfileOsicWidget.routeName,
          path: ProfileOsicWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileOsicWidget(),
        ),
        FFRoute(
          name: TermsofServiceOsicWidget.routeName,
          path: TermsofServiceOsicWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TermsofServiceOsicWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyosicWidget.routeName,
          path: PrivacyPolicyosicWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PrivacyPolicyosicWidget(),
        ),
        FFRoute(
          name: PasswordChangeOsicWidget.routeName,
          path: PasswordChangeOsicWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PasswordChangeOsicWidget(),
        ),
        FFRoute(
          name: ViewUserDetailsPageWidget.routeName,
          path: ViewUserDetailsPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ViewUserDetailsPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/landingpage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
