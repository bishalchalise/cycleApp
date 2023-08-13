import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/domain/repository/cycle_details_repository.dart';

class FetchCycleDetailsUsecase {
  final CycleDetailsRepository cycleDetailsRepository;
  FetchCycleDetailsUsecase({
    required this.cycleDetailsRepository,
  });
  Stream<List<CycleDetaillEntity>> call(String id) {
    return cycleDetailsRepository.fetchCycleDetail(id);
  }
}
