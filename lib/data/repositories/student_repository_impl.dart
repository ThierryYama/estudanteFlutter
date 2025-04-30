import 'package:novosistemaflu/common/errors/errors_classes.dart';
import 'package:novosistemaflu/common/patterns/result.dart';
import 'package:novosistemaflu/data/repositories/student_repository_contract.dart';
import 'package:novosistemaflu/data/services/local_storage_contract.dart';
import 'package:novosistemaflu/domain/entities/studant_info_entity.dart';

class StudentRepositoryImpl implements StudentRepositoryContract {
  final LocalStorageContract _localStorageContract;

  StudentRepositoryImpl({required LocalStorageContract localStorageContract})
    : _localStorageContract = localStorageContract;

  @override
  Future<Result<StudentInfoEntity, Failure>> getStudent() async {
    var result = await _localStorageContract.fetchStudent();
    return result;
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student) async {
    var result = await _localStorageContract.saveStudent(student);
    return result;
  }
}
