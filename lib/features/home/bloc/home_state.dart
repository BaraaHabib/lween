part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.message});
  final String? message;
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

//#region home
abstract class GetHomeDataState extends HomeState {
  const GetHomeDataState({String? message}) : super(message: message);
}

class GetHomeDataLoading extends GetHomeDataState {
  @override
  List<Object?> get props => [];
}

class GetHomeDataLoaded extends GetHomeDataState {
  const GetHomeDataLoaded({required this.homeEntity});
  final HomeEntity homeEntity;

  @override
  List<Object> get props => [homeEntity,];
}

class GetHomeDataError extends GetHomeDataState {

  const GetHomeDataError(String message,) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion login