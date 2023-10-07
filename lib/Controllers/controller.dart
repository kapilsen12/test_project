import 'dart:convert';

import 'package:test_project/helper/network_helper.dart';
import 'package:get/get.dart';

import '../Models/user_data_model.dart';

class Controller extends GetxController {
  List<UserDataModel> responseData = <UserDataModel>[].obs;
  RxBool isErrorTrue = false.obs;
  RxBool loading = false.obs;
  static const apiUrl = "https://randomuser.me/api/";
  Future<void> getAllData() async {
    loading.value = true;
    NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
    String getData = await networkHelper.getData();
    responseData.clear();
    if (getData != "error") {
      var data = jsonDecode(getData);
      for (var i = 0; i < data['results'].length; i++) {
        responseData.add(UserDataModel.fromJson(data['results'][i], i));
      }
    }
    loading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }
}
