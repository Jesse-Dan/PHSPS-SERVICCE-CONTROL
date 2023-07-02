import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as fetcher;
import 'dart:developer' as developer;
import 'package:phsps_api_work/global/constants.dart';
import 'package:phsps_api_work/logic/db/local_db.dart';
import 'package:phsps_api_work/model/sign_in_model.dart';
import 'package:phsps_api_work/model/sign_up_model.dart';
import '../../model/dashboard_data_model.dart';
import '../../model/user_model.dart';

class Provider {
  final LocalStorageService localStorageService = LocalStorageService();
  Future<UserModel?> login({required SignInModel signInData}) async {
    try {
      var response = await fetcher.post(
          Uri.parse('${Constants.BASE_URL}${Constants.endPoints['login']}'),
          body: signInData.toMap());
      UserModel data = UserModel.fromJson(json.decode(response.body));
      saveToken(data);
      return checkCodesAndReturnSuit(data: data, response: response);
    } catch (e, s) {
      developer.log(e.toString(), stackTrace: s, name: 'Login Error');
      return null;
    }
  }

  Future<UserModel?> createAccount({required SignUpModel signUpData}) async {
    try {
      var response = await fetcher.post(
          Uri.parse('${Constants.BASE_URL}${Constants.endPoints['reg']}'),
          body: signUpData.toMap());
      UserModel data = UserModel.fromJson(json.decode(response.body));
      saveToken(data);
      return checkCodesAndReturnSuit(data: data, response: response);
    } catch (e, s) {
      developer.log(e.toString(), stackTrace: s, name: 'Registration Error');
      return null;
    }
  }

  Future<List<CustomerDataModel>?> fetchData() async {
    try {
      var url = Uri.parse(
          '${Constants.BASE_URL}${Constants.endPoints['get_costumers']}');
      var headers = {
        'Authorization': 'Bearer ${await getToken()}',
        'Content-Type': 'application/json'
      };
      var response = await fetcher.get(url, headers: headers);
      showMessage(msg: 'Response Code: ${response.statusCode}');
      showMessage(msg: 'Response Uri: ${response.request?.url}');
      showMessage(msg: response.body.toString());
      List<CustomerDataModel> data =
          dashBoardDataModelFromJson((response.body));
      return data;
    } catch (e, s) {
      developer.log(e.toString(), stackTrace: s, name: 'Load Data Error');
      return null;
    }
  }

  /// save bearer token
  saveToken(UserModel user) async =>
      localStorageService.saveToDisk('token', user.token);

  /// get bearer token
  Future<String> getToken() async =>
      await localStorageService.getFromDisk('token');

  /// check status codes
  UserModel? checkCodesAndReturnSuit(
      {required UserModel data, required fetcher.Response response}) {
    switch (response.statusCode) {
      case 201:
        showMessage(msg: '201');
        return data;
      case 401:
        showMessage(msg: '401');
        return null;
      default:
        showMessage(msg: 'unknown error');
        return null;
    }
  }

  showMessage({msg}) => developer.log(msg, name: 'auth_provider_logs');
}
