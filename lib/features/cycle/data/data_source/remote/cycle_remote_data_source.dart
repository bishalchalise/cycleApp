import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';

abstract class CycleRemoteDataSoure {
  Stream<List<CycleDetaillEntity>> getAllCycles(CycleDetaillEntity allCycles);
  Stream<List<CycleDetaillEntity>> fetchCycleDetail(String id);
  Stream<List<CycleDetaillEntity>> fetchCycleByCategory(String category);
}
