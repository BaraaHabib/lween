

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';

class CompanyProfileScreenController extends Controller{
  CompanyProfileScreenController(this.companyEntity, this.tabsController);

  final TabController tabsController;
  final CompanyEntity  companyEntity;

  int get currentTab => tabsController.index;

  ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(1);

  @override
  init(){
    super.init();
    getTravels();
    tabsController.addListener(() {
      currentIndexNotifier.value = tabsController.index;
    });

  }

  changeTab(int index) {
    tabsController.animateTo(index);
  }


  getTravels() {
    OrdersBloc.instance.add(GetTravelsEvent(companyId: companyEntity.id,));
  }

  bool buildWhen(OrdersState previous, OrdersState current) {
    return current is CompanyTravelsState && current.companyId == companyEntity.id;
  }
}