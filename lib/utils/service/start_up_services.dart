import 'package:get/get.dart';

import 'authentication_serivces.dart';
import 'dio_services.dart';
import 'local_storage_service.dart';

class StartUpService extends GetxService {
  Future<StartUpService> init() async {
    Get.lazyPut<AuthenticationService>(() => AuthenticationService());
    await LocalStorageService.init();
    Get.put<DioService>(DioService()).init();
    return this;
  }
}
