import 'package:equatable/equatable.dart';

class CycleDetaillEntity extends Equatable {
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
  const CycleDetaillEntity({
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
  });

  @override
  List<Object?> get props => [
        price,
        type,
        description,
        name,
        image,
        color,
        speed,
        rating,
        bookedStatus,
        id,
        // bookedDate,
        // returnDate,
      ];
}
