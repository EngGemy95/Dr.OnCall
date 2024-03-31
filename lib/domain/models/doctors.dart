import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  final String name;
  final String specialty;
  final String img;
  final int star;

  const DoctorModel({
    required this.name,
    required this.specialty,
    required this.img,
    required this.star,
  });

  @override
  List<Object?> get props => [name, specialty, img, star];
}
