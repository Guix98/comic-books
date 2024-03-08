import 'package:get/get.dart';

class UserController extends GetxController {
  // Define los parámetros del usuario como observables
  var uid = ''.obs;
  var email = ''.obs;
  var displayName = ''.obs;

  // Función para establecer los parámetros del usuario
  void setUserParams(
      {String uid = '', String email = '', String displayName = ''}) {
    this.uid.value = uid;
    this.email.value = email;

    this.displayName.value = displayName;
  }
}
