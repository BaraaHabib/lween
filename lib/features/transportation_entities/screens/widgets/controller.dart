

import 'package:flutter/cupertino.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';

class CompanyItemController extends Controller {

  @override
  void init() {
    super.init();
    // isFollowed = item.isFollowed ?? false;
  }

  final ValueNotifier<bool> isFollowedNotifier = ValueNotifier<bool>(false);
  CompanyEntity item;

  CompanyItemController(this.item);

  // bool get isFollowed => isFollowedNotifier.value;
  //
  // set isFollowed(bool value) {
  //   isFollowedNotifier.value = value;
  // }

  void listener(BuildContext context, CompanyState state) {
    if(state is ToggleFollowCompanyStateLoaded){
      item.isFollowed = state.isFollowed;
      // isFollowed = state.isFollowed;
    }
    else if(state is ToggleFollowCompanyStateError){
      AppToast(state.message ?? '').show();
    }
  }

  bool listenWhen(CompanyState previous,
      CompanyState current) {
    if(current is ToggleFollowCompanyState && current.id == item.id){
      return true;
    }
    return false;
  }

  bool buildWhen(CompanyState previous,
      CompanyState current) {
    if(current is ToggleFollowCompanyState && current.id == item.id){
      // AppLogger.log('buildWhen true');
      return true;
    }
    return false;
  }

  void toggleFollow() {
    CompanyBloc
        .instance
        .add(
      ToggleFollowEvent(
        id: item.id ?? 0,
        follow: !(item.isFollowed ?? false),
      ),
    );
  }
}