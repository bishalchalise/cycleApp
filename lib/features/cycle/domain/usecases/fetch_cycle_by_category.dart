import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/domain/repository/cycle_details_repository.dart';

class FetchCycleByCategoryUsecase {
  final CycleDetailsRepository cycleDetailsRepository;
  FetchCycleByCategoryUsecase({
    required this.cycleDetailsRepository,
  });
  Stream<List<CycleDetaillEntity>> call(String category) {
    return cycleDetailsRepository.fetchCycleByCategory(category);
  }
}