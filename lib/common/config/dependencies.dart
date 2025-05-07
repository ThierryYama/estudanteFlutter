import 'package:auto_injector/auto_injector.dart';
import 'package:novosistemaflu/data/repositories/student_repository_contract.dart';
import 'package:novosistemaflu/data/repositories/student_repository_impl.dart';
import 'package:novosistemaflu/data/services/fake_db_service.dart';
import 'package:novosistemaflu/data/services/local_storage_contract.dart';

import '../../ui/controllers/home_page_controller.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<StudentRepositoryContract>(StudentRepositoryImpl.new);
  injector.addSingleton<LocalStorageContract>(FakeDbService.new);
  injector.addSingleton(HomePageController.new);
  injector.commit();
}
