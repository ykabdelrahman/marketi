import '../data/cache_helper.dart';
import 'constants.dart';

Future<void> checkIfLoggedInUser() async {
  String? userToken = await CacheHelper.getSecureData(key: Constants.tokenKey);
  if (userToken != null || userToken == "") {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
