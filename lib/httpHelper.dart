import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:developer' as developer;

class HttpHelper {
  static Future<List<PersonModel>> fetchDetails() async {
    try {
      var response = await http
          .get(Uri.parse("http://10.0.2.2:8000/v1/person/getAllPerson"));

      if (response.statusCode == 200) {
        List<dynamic> personListData = json.decode(response.body);
        developer.log("Fetched data: $personListData", name: 'HttpHelper');

        List<PersonModel> personList =
            personListData.map((item) => PersonModel.fromJson(item)).toList();

        return personList;
      } else {
        developer.log(
            'Failed to fetch data. Status code: ${response.statusCode}',
            name: 'HttpHelper');
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      developer.log('Error occurred while fetching data: $e',
          name: 'HttpHelper');
      throw Exception('Error fetching person details: $e');
    }
  }
}
