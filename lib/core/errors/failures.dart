import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  String get message => '';
}

class ServerFailure extends Failure {
  ServerFailure({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => [message];
}
