import 'package:phsps_api_work/logic/provider/provider.dart';
import 'package:phsps_api_work/model/sign_up_model.dart';
import 'dart:developer' as developer;

import '../../model/dashboard_data_model.dart';
import '../../model/sign_in_model.dart';
import '../../model/user_model.dart';

class Repository {
  final Provider authProvider;

  Repository(this.authProvider);

  Future<UserModel?> createAccount({required SignUpModel signUpData}) async {
    try {
      var data = await authProvider.createAccount(signUpData: signUpData);
      showMessage(msg: data!.user!.email.toString());
      return data;
    } catch (e) {
      showMessage(msg: e.toString());
      return null;
    }
  }

  Future<UserModel?> login({required SignInModel signinData}) async {
    try {
      var data = await authProvider.login(signInData: signinData);
      showMessage(msg: data!.user!.email.toString());
      return data;
    } catch (e) {
      showMessage(msg: e.toString());
      return null;
    }
  }

  Future<List<CustomerDataModel>?> fetchData() async {
    try {
      var data = await authProvider.fetchData();
      showMessage(msg: data.toString());
      return data;
    } catch (e) {
      showMessage(msg: e.toString());
      return null;
    }
  }

  showMessage({msg}) => developer.log(msg, name: 'auth_repository_logs');
}
