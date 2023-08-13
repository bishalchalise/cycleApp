import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/domain/repository/cycle_details_repository.dart';

class GetAllCyclesUsecase {
  final CycleDetailsRepository cycleModelRepository;
  GetAllCyclesUsecase({
    required this.cycleModelRepository,
  });
  Stream<List<CycleDetaillEntity>> call(CycleDetaillEntity allCycles) {
    return cycleModelRepository.getAllCycles(allCycles);
  }
}
