import 'package:get/get.dart';
import 'httpHelper.dart';
import 'model.dart';

class PersonController extends GetxController {
  var isLoading = true.obs;
  var personList = RxList<PersonModel>();

  @override
  void onInit() {
    fetchPersons();
    super.onInit();
  }

  void fetchPersons() async {
    try {
      isLoading(true);
      var persons = await HttpHelper.fetchDetails();

      if (persons.isNotEmpty) {
        personList.assignAll(persons);
      } else {
        personList.clear();
      }
    } catch (e) {
      print('Error fetching persons: $e');
    } finally {
      isLoading(false);
    }
  }
}
