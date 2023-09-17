import 'package:equatable/equatable.dart';

class ExtraChoice extends Equatable {
  const ExtraChoice({
    required this.name,
    required this.cost,
  });

  final String name;
  final String cost;

  @override
  List<Object?> get props => [
        name,
        cost,
      ];
}
