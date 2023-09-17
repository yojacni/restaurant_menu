import 'package:equatable/equatable.dart';

class Size extends Equatable {
  const Size({
    required this.name,
    required this.disccount,
  });

  final String name;
  final String disccount;

  @override
  List<Object?> get props => [
        name,
        disccount,
      ];
}
