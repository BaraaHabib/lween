part of 'transportation_entities_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();
}

class GetCompaniesEvent extends CompanyEvent {
  const GetCompaniesEvent({
    required this.params,
  });

  final GetCompaniesParams params;

  @override
  List<Object?> get props => [params,];
}

class ToggleFollowEvent extends CompanyEvent {
  const ToggleFollowEvent({
    required this.id,
    required this.follow,
  });

  final int id;
  final bool follow;

  @override
  List<Object?> get props => [follow,];
}
