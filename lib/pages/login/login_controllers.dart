import 'package:flutter/material.dart';
import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../provider/user_provider.dart';
import '../../utils/my_snackbard.dart';
import '../../utils/shared_pref.dart';

class LoginController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  BuildContext context;

  UserProvider usersProvider = new UserProvider();
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if (user?.token != null) {
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  logout() {
    _sharedPref.logout(context);
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);

    if (email.isEmpty || password.isEmpty) {
      MySnackbar.show(context, 'Debes ingresar todos los campos');
      return;
    }
    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    } else {
      MySnackbar.show(context, responseApi.message);
    }
  }
}
