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

class NetworkFailure extends Failure {
  @override
  List<Object> get props => [message];

  @override
  String get message => 'No connection to Internet';
}

class OtherFailure extends Failure {
  @override
  List<Object> get props => [message];

  @override
  String get message => 'Something went wrong';
}
