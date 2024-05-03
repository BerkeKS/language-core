import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginAPI {
  static const List<String> scopes = <String>[
    'email',
  ];
  static final _clientID =
      "283418927858-0oc563pugv4n4ogrg0bfbf2ub1edrneg.apps.googleusercontent.com";
  static GoogleSignInAccount? currentUser;
  static final _googleLogin = GoogleSignIn(clientId: _clientID, scopes: scopes);
  static Future<GoogleSignInAccount?> login() => _googleLogin.signIn();
  static Future logout() => _googleLogin.disconnect();
}
