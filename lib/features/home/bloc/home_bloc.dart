
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/features/home/models/home_entity.dart';
import 'package:lween/features/home/repo/account_repository.dart';
import 'package:lween/injection_container.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final accountRepo = sl<HomeRepository>();

  HomeBloc() : super(HomeInitial()) {
    on<GetHomeData>(_getHomeDateHandler);
  }

  static HomeBloc get instance => sl<HomeBloc>();

  Future<FutureOr<void>> _getHomeDateHandler(GetHomeData event,
      Emitter<HomeState> emit) async {
    emit(GetHomeDataLoading());
    final res = await sl<HomeRepository>().getHomeData();
    emit(res.fold(
          (l) => GetHomeDataError(l.errorMessage,),
          (r) => GetHomeDataLoaded(homeEntity: r,),
    ));
  }
}
