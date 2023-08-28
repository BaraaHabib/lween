

import 'package:flutter/material.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/params/transportation_entities_params.dart';
import 'package:lween/features/transportation_entities/repo/transportation_entities_repository.dart';

class CompaniesController extends Controller{
  CompaniesController({
    this.isFollowed,
});

  bool? isFollowed;
  List<CompanyEntity> companies = CompaniesRepository.companies;

  @override
  void init() {
    super.init();
    if(isFollowed ?? false){
      getCompanies();
    }
    // getCompanies();
  }
  bool buildListenWhen(CompanyState previous, CompanyState current) {
    return (current is GetCompaniesState
        && current.isFollowedCompaniesScreen == isFollowed)
      || current is ToggleFollowCompanyStateLoaded
        ;
  }

  refresh() {
    getCompanies(0);
  }

  getCompanies([int page = 0]){
    CompanyBloc.instance.add(
        GetCompaniesEvent(
            params: GetCompaniesParams(
              page: page,
                isFollowed:isFollowed,
            ),
        ),
    );
  }

  void listener(BuildContext context, CompanyState state) {
    if (state is CompaniesLoaded) {
      companies = state.items.items ?? [];
    }
    else if (state is ToggleFollowCompanyStateLoaded) {
      companies.removeWhere((e) => e.id == state.id);
    }
  }

  bool listenWhen(CompanyState previous, CompanyState current) {
    return (current is GetCompaniesState
        && current.isFollowedCompaniesScreen == isFollowed)
        || ((isFollowed ?? false) && current is ToggleFollowCompanyStateLoaded)
    ;
  }

  bool buildWhen(CompanyState previous, CompanyState current) {
    return (current is GetCompaniesState
        && current.isFollowedCompaniesScreen == isFollowed)
        || ((isFollowed ?? false) && current is ToggleFollowCompanyStateLoaded)
    ;
  }
}