// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';

class CycleDetailsModel extends CycleDetaillEntity {
  final String? price;
  final String? type;
  final String? description;
  final String? name;
  final String? image;
  final String? color;
  final num? speed;
  final num? rating;
  final bool? bookedStatus;
  final String? id;
  // final String? bookedDate;
  // final String? returnDate;
  const CycleDetailsModel({
    this.price,
    this.type,
    this.description,
    this.name,
    this.image,
    this.color,
    this.speed,
    this.rating,
    this.bookedStatus,
    this.id,
    // this.bookedDate,
    // this.returnDate,
  }) : super(
          // bookedDate: bookedDate,
          bookedStatus: bookedStatus,
          color: color,
          description: description,
          id: id,
          image: image,
          name: name,
          price: price,
          rating: rating,
          // returnDate: returnDate,
          speed: speed,
          type: type,
        );

  factory CycleDetailsModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return CycleDetailsModel(
      price: snapshot['price'],
      type: snapshot['type'],
      description: snapshot['description'],
      name: snapshot['name'],
      image: snapshot['image'],
      color: snapshot['color'],
      speed: snapshot['speed'],
      rating: snapshot['rating'],
      bookedStatus: snapshot['bookedStatus'],
      id: snapshot['id'],
      // bookedDate: snapshot['bookedDate'],
      // returnDate: snapshot['returnDate'],
    );
  }
  Map<String, dynamic> toJson() => {
        'price': price,
        'type': type,
        'description': description,
        'name': name,
        'image': image,
        'color': color,
        'speed': speed,
        'rating': rating,
        'bookedStatus': bookedStatus,
        'id': id,
        // 'bookedDate': bookedDate,
        // 'returnDate': returnDate
      };
}
