

import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/params/transportation_entities_params.dart';

class CompaniesController extends Controller{

  @override
  void init() {
    super.init();
    getCompanies();
  }
  bool buildWhen(CompanyState previous, CompanyState current) {
    return current is GetCompaniesState;
  }

  refresh() {
    getCompanies(0);
  }

  getCompanies([int page = 0]){
    CompanyBloc.instance.add(
        GetCompanyEvent(
            params: GetCompaniesParams(
              page: page,
            ),
        ),
    );
  }
}