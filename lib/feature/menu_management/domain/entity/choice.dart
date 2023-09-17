import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  const Choice({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [
        name,
      ];
}
