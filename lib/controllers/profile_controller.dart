import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_todo_app/models/profile_model.dart';

class ProfileController {
  static const view_ip = 'http://192.168.0.15/my_todo_app/lib/db/view.php';

  
  List<profileModel> profilesFromJson(String jsonString) {
    final data = json.decode(jsonString);

    return List<profileModel>.from(
        data.map((item) => profileModel.fromMap(item)));
  }

  Future<List<profileModel>> getProfiles() async {
    
    final response = await http.get(Uri.parse(view_ip));
    if (response.statusCode == 200) {
      List<profileModel> list = profilesFromJson(response.body);
      return list;
    } else {
      return <profileModel>[];
    }
  }
}
