class APIConfig {
  static const String APIName = "Language Core";
  static const String APIUrl = "http://localhost:3000/";
  static const String loginUsernameAPI = "${APIUrl}user/login";
  static const String loginEmailAPI = "${APIUrl}user/logine";
  static const String registerAPI = "${APIUrl}user/register";
  static const String profileAPI = "${APIUrl}user/profile";
  static const String favoritesAPI = "${APIUrl}user/favorites";
  static const String wordsAPI = '${APIUrl}words';
  static const String tfquestionsAPI = '${APIUrl}question/truefalse';
}
