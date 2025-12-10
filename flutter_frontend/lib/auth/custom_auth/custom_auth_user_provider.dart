import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class MsmeAuthUser {
  MsmeAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<MsmeAuthUser> msmeAuthUserSubject =
    BehaviorSubject.seeded(MsmeAuthUser(loggedIn: false));
Stream<MsmeAuthUser> msmeAuthUserStream() =>
    msmeAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
