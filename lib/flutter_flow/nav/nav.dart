import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
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

  void update(BaseAuthUser newUser) {
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
          appStateNotifier.loggedIn ? AddArticleWidget() : ArtricleListWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? AddArticleWidget()
              : ArtricleListWidget(),
        ),
        FFRoute(
          name: WelcomeWidget.routeName,
          path: WelcomeWidget.routePath,
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: Evaluationf2Widget.routeName,
          path: Evaluationf2Widget.routePath,
          builder: (context, params) => Evaluationf2Widget(),
        ),
        FFRoute(
          name: Evaluationf1Widget.routeName,
          path: Evaluationf1Widget.routePath,
          builder: (context, params) => Evaluationf1Widget(),
        ),
        FFRoute(
          name: Evaluationb1Widget.routeName,
          path: Evaluationb1Widget.routePath,
          builder: (context, params) => Evaluationb1Widget(),
        ),
        FFRoute(
          name: CoursWidget.routeName,
          path: CoursWidget.routePath,
          builder: (context, params) => CoursWidget(),
        ),
        FFRoute(
          name: CreateCourseWidget.routeName,
          path: CreateCourseWidget.routePath,
          builder: (context, params) => CreateCourseWidget(),
        ),
        FFRoute(
          name: ChaplistWidget.routeName,
          path: ChaplistWidget.routePath,
          builder: (context, params) => ChaplistWidget(
            cousId: params.getParam(
              'cousId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: AddchapWidget.routeName,
          path: AddchapWidget.routePath,
          builder: (context, params) => AddchapWidget(
            coursId: params.getParam(
              'coursId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: QuizListWidget.routeName,
          path: QuizListWidget.routePath,
          builder: (context, params) => QuizListWidget(),
        ),
        FFRoute(
          name: QuizPageWidget.routeName,
          path: QuizPageWidget.routePath,
          builder: (context, params) => QuizPageWidget(
            quizSetRef: params.getParam(
              'quizSetRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['quizset'],
            ),
            quizDuration: params.getParam(
              'quizDuration',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EventsListWidget.routeName,
          path: EventsListWidget.routePath,
          builder: (context, params) => EventsListWidget(),
        ),
        FFRoute(
          name: EventDetailsWidget.routeName,
          path: EventDetailsWidget.routePath,
          asyncParams: {
            'eventdetails': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventDetailsWidget(
            eventdetails: params.getParam(
              'eventdetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ReservationWidget.routeName,
          path: ReservationWidget.routePath,
          asyncParams: {
            'eventreservation': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => ReservationWidget(
            eventreservation: params.getParam(
              'eventreservation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddEventWidget.routeName,
          path: AddEventWidget.routePath,
          builder: (context, params) => AddEventWidget(
            ltdlgt: params.getParam(
              'ltdlgt',
              ParamType.LatLng,
            ),
          ),
        ),
        FFRoute(
          name: ChatbotWidget.routeName,
          path: ChatbotWidget.routePath,
          builder: (context, params) => ChatbotWidget(),
        ),
        FFRoute(
          name: ReservedeventsWidget.routeName,
          path: ReservedeventsWidget.routePath,
          builder: (context, params) => ReservedeventsWidget(),
        ),
        FFRoute(
          name: ListtestWidget.routeName,
          path: ListtestWidget.routePath,
          builder: (context, params) => ListtestWidget(
            idcour: params.getParam(
              'idcour',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: AjouttestWidget.routeName,
          path: AjouttestWidget.routePath,
          builder: (context, params) => AjouttestWidget(
            idcour: params.getParam(
              'idcour',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: ModifiertestWidget.routeName,
          path: ModifiertestWidget.routePath,
          builder: (context, params) => ModifiertestWidget(
            idevaluation: params.getParam(
              'idevaluation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
          ),
        ),
        FFRoute(
          name: ListiuserstestWidget.routeName,
          path: ListiuserstestWidget.routePath,
          builder: (context, params) => ListiuserstestWidget(
            idtest: params.getParam(
              'idtest',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
            idcour: params.getParam(
              'idcour',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: AjouquestionWidget.routeName,
          path: AjouquestionWidget.routePath,
          builder: (context, params) => AjouquestionWidget(
            idtest: params.getParam(
              'idtest',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
          ),
        ),
        FFRoute(
          name: ListdesquestionsWidget.routeName,
          path: ListdesquestionsWidget.routePath,
          builder: (context, params) => ListdesquestionsWidget(
            idevaluation: params.getParam(
              'idevaluation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
          ),
        ),
        FFRoute(
          name: ListdesquestionsetudiantWidget.routeName,
          path: ListdesquestionsetudiantWidget.routePath,
          builder: (context, params) => ListdesquestionsetudiantWidget(
            idevaluation: params.getParam(
              'idevaluation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
          ),
        ),
        FFRoute(
          name: ModifierquestionWidget.routeName,
          path: ModifierquestionWidget.routePath,
          builder: (context, params) => ModifierquestionWidget(
            idquestion: params.getParam(
              'idquestion',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['question'],
            ),
          ),
        ),
        FFRoute(
          name: ListdesquestionsreponseWidget.routeName,
          path: ListdesquestionsreponseWidget.routePath,
          builder: (context, params) => ListdesquestionsreponseWidget(
            idevaluation: params.getParam(
              'idevaluation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
            idusers: params.getParam(
              'idusers',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            idcou: params.getParam(
              'idcou',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: RepondreaquestionteacherWidget.routeName,
          path: RepondreaquestionteacherWidget.routePath,
          builder: (context, params) => RepondreaquestionteacherWidget(
            idreponse: params.getParam(
              'idreponse',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reponse'],
            ),
            idtest: params.getParam(
              'idtest',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
            idcour: params.getParam(
              'idcour',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: MesevaluationsWidget.routeName,
          path: MesevaluationsWidget.routePath,
          builder: (context, params) => MesevaluationsWidget(
            idevaluation: params.getParam(
              'idevaluation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
            idusers: params.getParam(
              'idusers',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            idcou: params.getParam(
              'idcou',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: MestestWidget.routeName,
          path: MestestWidget.routePath,
          builder: (context, params) => MestestWidget(
            idcour: params.getParam(
              'idcour',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: RepondreaquestionWidget.routeName,
          path: RepondreaquestionWidget.routePath,
          builder: (context, params) => RepondreaquestionWidget(
            idquestion: params.getParam(
              'idquestion',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['question'],
            ),
          ),
        ),
        FFRoute(
          name: ScorePageWidget.routeName,
          path: ScorePageWidget.routePath,
          builder: (context, params) => ScorePageWidget(
            scoreAchieved: params.getParam(
              'scoreAchieved',
              ParamType.int,
            ),
            totalQuestions: params.getParam(
              'totalQuestions',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: CreateQuizWidget.routeName,
          path: CreateQuizWidget.routePath,
          builder: (context, params) => CreateQuizWidget(),
        ),
        FFRoute(
          name: AddQuizWidget.routeName,
          path: AddQuizWidget.routePath,
          builder: (context, params) => AddQuizWidget(
            quizSet: params.getParam(
              'quizSet',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['quizset'],
            ),
          ),
        ),
        FFRoute(
          name: ReservedeventdetailsWidget.routeName,
          path: ReservedeventdetailsWidget.routePath,
          asyncParams: {
            'eventref': getDoc(
                ['eventregistration'], EventregistrationRecord.fromSnapshot),
          },
          builder: (context, params) => ReservedeventdetailsWidget(
            eventref: params.getParam(
              'eventref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdatereservationWidget.routeName,
          path: UpdatereservationWidget.routePath,
          asyncParams: {
            'reservation': getDoc(
                ['eventregistration'], EventregistrationRecord.fromSnapshot),
          },
          builder: (context, params) => UpdatereservationWidget(
            reservation: params.getParam(
              'reservation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateeventWidget.routeName,
          path: UpdateeventWidget.routePath,
          asyncParams: {
            'eventdetails': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateeventWidget(
            eventdetails: params.getParam(
              'eventdetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: TeacherEventsWidget.routeName,
          path: TeacherEventsWidget.routePath,
          builder: (context, params) => TeacherEventsWidget(),
        ),
        FFRoute(
          name: ListeCoursEtudiantsWidget.routeName,
          path: ListeCoursEtudiantsWidget.routePath,
          builder: (context, params) => ListeCoursEtudiantsWidget(),
        ),
        FFRoute(
          name: DetailsCourseEtudiantWidget.routeName,
          path: DetailsCourseEtudiantWidget.routePath,
          builder: (context, params) => DetailsCourseEtudiantWidget(
            cours: params.getParam(
              'cours',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: ListeDesChapitreWidget.routeName,
          path: ListeDesChapitreWidget.routePath,
          builder: (context, params) => ListeDesChapitreWidget(
            co: params.getParam(
              'co',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: SinginWidget.routeName,
          path: SinginWidget.routePath,
          builder: (context, params) => SinginWidget(),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: AddArticleWidget.routeName,
          path: AddArticleWidget.routePath,
          builder: (context, params) => AddArticleWidget(),
        ),
        FFRoute(
          name: ListOfUsersWidget.routeName,
          path: ListOfUsersWidget.routePath,
          builder: (context, params) => ListOfUsersWidget(),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: ForgetPasswordWidget.routeName,
          path: ForgetPasswordWidget.routePath,
          builder: (context, params) => ForgetPasswordWidget(),
        ),
        FFRoute(
          name: EmailPageWidget.routeName,
          path: EmailPageWidget.routePath,
          builder: (context, params) => EmailPageWidget(),
        ),
        FFRoute(
          name: CompletePageWidget.routeName,
          path: CompletePageWidget.routePath,
          builder: (context, params) => CompletePageWidget(),
        ),
        FFRoute(
          name: DashBoradWidget.routeName,
          path: DashBoradWidget.routePath,
          builder: (context, params) => DashBoradWidget(),
        ),
        FFRoute(
          name: EditArticleWidget.routeName,
          path: EditArticleWidget.routePath,
          asyncParams: {
            'article': getDoc(['blog'], BlogRecord.fromSnapshot),
          },
          builder: (context, params) => EditArticleWidget(
            article: params.getParam(
              'article',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ArtricleListWidget.routeName,
          path: ArtricleListWidget.routePath,
          builder: (context, params) => ArtricleListWidget(),
        ),
        FFRoute(
          name: BlogPageWidget.routeName,
          path: BlogPageWidget.routePath,
          builder: (context, params) => BlogPageWidget(),
        ),
        FFRoute(
          name: ArticlePageWidget.routeName,
          path: ArticlePageWidget.routePath,
          asyncParams: {
            'article': getDoc(['blog'], BlogRecord.fromSnapshot),
          },
          builder: (context, params) => ArticlePageWidget(
            article: params.getParam(
              'article',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetailsCourseEnseignantWidget.routeName,
          path: DetailsCourseEnseignantWidget.routePath,
          builder: (context, params) => DetailsCourseEnseignantWidget(
            cours: params.getParam(
              'cours',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: UpdateCourseWidget.routeName,
          path: UpdateCourseWidget.routePath,
          builder: (context, params) => UpdateCourseWidget(
            cours: params.getParam(
              'cours',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: DetailsChapitreEtudiantWidget.routeName,
          path: DetailsChapitreEtudiantWidget.routePath,
          builder: (context, params) => DetailsChapitreEtudiantWidget(
            chapitre: params.getParam(
              'chapitre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chapitre'],
            ),
          ),
        ),
        FFRoute(
          name: DetailsChapitreEnseignantWidget.routeName,
          path: DetailsChapitreEnseignantWidget.routePath,
          builder: (context, params) => DetailsChapitreEnseignantWidget(
            chapitre: params.getParam(
              'chapitre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chapitre'],
            ),
          ),
        ),
        FFRoute(
          name: UpdatechapWidget.routeName,
          path: UpdatechapWidget.routePath,
          builder: (context, params) => UpdatechapWidget(
            chapitreId: params.getParam(
              'chapitreId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chapitre'],
            ),
          ),
        ),
        FFRoute(
          name: TttWidget.routeName,
          path: TttWidget.routePath,
          builder: (context, params) => TttWidget(
            idtest: params.getParam(
              'idtest',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
            idcour: params.getParam(
              'idcour',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
        ),
        FFRoute(
          name: FdvdfvdWidget.routeName,
          path: FdvdfvdWidget.routePath,
          builder: (context, params) => FdvdfvdWidget(
            idtest: params.getParam(
              'idtest',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evaluation'],
            ),
            idreponse: params.getParam(
              'idreponse',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reponse'],
            ),
            ifoucr: params.getParam(
              'ifoucr',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cours'],
            ),
          ),
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
    List<String>? collectionNamePath,
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
      collectionNamePath: collectionNamePath,
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
            return '/artricleList';
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
