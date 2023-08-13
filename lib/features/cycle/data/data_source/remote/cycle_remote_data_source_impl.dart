import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclego/core/constants/constatns.dart';
import 'package:cyclego/features/cycle/data/data_source/remote/cycle_remote_data_source.dart';
import 'package:cyclego/features/cycle/data/models/cycle_details_model.dart';
import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';

class CycleRemoteDataSourceImpl implements CycleRemoteDataSoure {
  FirebaseFirestore firebaseFirestore;
  CycleRemoteDataSourceImpl({
    required this.firebaseFirestore,
  });
  @override
  Stream<List<CycleDetaillEntity>> getAllCycles(CycleDetaillEntity fetchCycle) {
    final cycleCollection = firebaseFirestore.collection(FirebaseConsts.cycles);
    return cycleCollection.snapshots().map(
          (event) => (event.docs
              .map(
                (e) => CycleDetailsModel.fromSnapshot(e),
              )
              .toList()),
        );
  }

  @override
  Stream<List<CycleDetaillEntity>> fetchCycleDetail(String id) {
    final userCollection = firebaseFirestore
        .collection(FirebaseConsts.cycles)
        .where('id', isEqualTo: id)
        .limit(1);

    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((e) => CycleDetailsModel.fromSnapshot(e))
        .toList());
  }
  
  @override
  Stream<List<CycleDetaillEntity>> fetchCycleByCategory(String category) {
     final userCollection = firebaseFirestore
        .collection(FirebaseConsts.cycles)
        .where('type', isEqualTo: category)
        .limit(1);

    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((e) => CycleDetailsModel.fromSnapshot(e))
        .toList());
  }
}
