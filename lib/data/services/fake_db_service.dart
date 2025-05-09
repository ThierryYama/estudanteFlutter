import 'package:novosistemaflu/common/errors/errors_classes.dart';
import 'package:novosistemaflu/common/patterns/result.dart';
import 'package:novosistemaflu/data/services/local_storage_contract.dart';
import 'package:novosistemaflu/domain/entities/studant_info_entity.dart';
import 'package:novosistemaflu/helper/studente_fake_repository.dart';

class FakeDbService implements LocalStorageContract {
  StudentFakeApiDataBase fakeDB = StudentFakeApiDataBase();

  @override
  Future<Result<StudentInfoEntity, Failure>> fetchStudent() async {
    try {
      var result = await fakeDB.getData();
      StudentInfoEntity student = StudentInfoEntity.fromJson(result);
      return Success(student);
    } on DatasourceResultEmpty catch (e) {
      return Error(DatasourceResultEmpty(e.toString()));
    } on APIFailure catch (e) {
      return Error(APIFailure(e.toString()));
    } on Exception catch (e) {
      return Error(
        DefaultError('Erro ao buscar o estudante: ${(e.toString())}'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      fakeDB.updateData(student.toJson());
      return const Success(null);
    } on APIFailureOnSave catch (e) {
      return Error(APIFailureOnSave(e.toString()));
    } on Exception catch (e) {
      return Error(
        DefaultError(
          'Erro desconhecido ao salvar estudante: ${(e.toString())}',
        ),
      );
    }
  }
}
