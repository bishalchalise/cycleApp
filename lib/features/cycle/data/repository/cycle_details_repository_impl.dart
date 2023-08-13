import 'package:cyclego/features/cycle/data/data_source/remote/cycle_remote_data_source.dart';
import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/domain/repository/cycle_details_repository.dart';

class CycleDetailsRepositoryImpl implements CycleDetailsRepository {
  final CycleRemoteDataSoure cycleRemoteDataSoure;
  CycleDetailsRepositoryImpl({
    required this.cycleRemoteDataSoure,
  });
  @override
  Stream<List<CycleDetaillEntity>> fetchCycleDetail(String id) =>
      cycleRemoteDataSoure.fetchCycleDetail(id);

  @override
  Stream<List<CycleDetaillEntity>> getAllCycles(CycleDetaillEntity allCycles) =>
      cycleRemoteDataSoure.getAllCycles(allCycles);

  @override
  Stream<List<CycleDetaillEntity>> fetchCycleByCategory(String category) {
   return cycleRemoteDataSoure.fetchCycleByCategory(category);
  }
}
