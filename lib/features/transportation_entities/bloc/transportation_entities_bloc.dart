
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/params/follow_entity_params.dart';
import 'package:lween/features/transportation_entities/params/transportation_entities_params.dart';
import 'package:lween/features/transportation_entities/repo/transportation_entities_repository.dart';
import 'package:lween/injection_container.dart';


part 'transportation_entities_event.dart';
part 'transportation_entities_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompaniesRepository repo = sl<
      CompaniesRepository>();

  CompanyBloc() : super(CompanyInitial()) {
    on<GetCompaniesEvent>(_transportationCompanyEventCallback);
    on<ToggleFollowEvent>(_toggleFollowEventCallback);
  }

  static CompanyBloc get instance =>
      sl<CompanyBloc>();

  Future<FutureOr<void>> _transportationCompanyEventCallback(
      GetCompaniesEvent event,
      Emitter<CompanyState> emit) async {
    emit(CompaniesLoading(isFollowedCompaniesScreen: event.params.isFollowed ?? false,));
    var res = await repo.getCompanies(event.params,);
    emit(res.fold(
          (l) => CompaniesError(l.errorMessage,event.params.isFollowed ?? false,),
          (r) => CompaniesLoaded(items: r,isFollowedCompaniesScreen: event.params.isFollowed ?? false,),
    ));
  }

  Future<FutureOr<void>> _toggleFollowEventCallback(ToggleFollowEvent event,
      Emitter<CompanyState> emit) async {
    emit(ToggleFollowCompanyStateLoading(id: event.id,));
    var res = await repo.toggleFollowCompany(ToggleFollowCompanyParams(
      follow: event.follow,
      transportationId: event.id,
      ),
    );
    emit(res.fold(
          (l) => ToggleFollowCompanyStateError(l.errorMessage,id: event.id,),
          (r) =>  ToggleFollowCompanyStateLoaded(
            id: event.id,
            isFollowed: event.follow
          ),
    ));
  }
}
