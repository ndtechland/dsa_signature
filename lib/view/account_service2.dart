import 'package:shared_preferences/shared_preferences.dart';
import '../model/login_model2.dart';

class AccountService2 {
  static const String _accountKey2 = 'accountData2';

  Future<LoginResponse?> get getAccountData2 async {
    final SharedPreferences getStorage = await SharedPreferences.getInstance();
    final String? accountDataEncoded2 = getStorage.getString(_accountKey2);
    if (accountDataEncoded2 == null) {
      return null;
    }

      return loginResponseFromJson(accountDataEncoded2);
  }

  Future<void> setAccountData2(LoginResponse? accountData2) async {

    final SharedPreferences getStorage = await SharedPreferences.getInstance();

   getStorage.setString(_accountKey2, loginResponseToJson(accountData2!));
  }
}

final accountService2 = AccountService2();