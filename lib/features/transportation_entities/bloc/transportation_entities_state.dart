part of 'transportation_entities_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState({this.message});
  final String? message;
}

class CompanyInitial extends CompanyState {
  @override
  List<Object> get props => [];
}

//#region get entities
abstract class GetCompaniesState extends CompanyState {
  const GetCompaniesState({
    String? message,
    required this.isFollowedCompaniesScreen,
  }) : super(message: message);
  final bool isFollowedCompaniesScreen;
}

class CompaniesLoading extends GetCompaniesState {
  const CompaniesLoading({required super.isFollowedCompaniesScreen});

  @override
  List<Object?> get props => [];
}

class CompaniesLoaded extends GetCompaniesState {
  const CompaniesLoaded({required this.items, required super.isFollowedCompaniesScreen});
  final CompaniesEntity items;

  @override
  List<Object> get props => [items,];
}

class CompaniesError extends GetCompaniesState {


  const CompaniesError(String message, bool isFollowedCompaniesScreen) : super(
    message: message, isFollowedCompaniesScreen: isFollowedCompaniesScreen,);

  @override
  List<Object?> get props => [message];
}
//#endregion get entities

//#region toggle follow entity
abstract class ToggleFollowCompanyState extends CompanyState {
  const ToggleFollowCompanyState({
    required this.id,
    String? message,
  }) : super(message: message);
  final int id;

}

class ToggleFollowCompanyStateLoading extends ToggleFollowCompanyState {
  const ToggleFollowCompanyStateLoading({required super.id});

  @override
  List<Object?> get props => [];
}

class ToggleFollowCompanyStateLoaded extends ToggleFollowCompanyState {
  const ToggleFollowCompanyStateLoaded({
    required super.id,
    required this.isFollowed,
  });
  final bool isFollowed;
  @override
  List<Object> get props => [];
}

class ToggleFollowCompanyStateError extends ToggleFollowCompanyState {

  const ToggleFollowCompanyStateError(String message,{required super.id} ) : super(message: message,);

  @override
  List<Object?> get props => [message];
}
//#endregion get entities