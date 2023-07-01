

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/generated/l10n.dart';

class SignupController extends Controller {
  final formKey = GlobalKey<FormBuilderState>();

  final passwordController = TextEditingController();

  List<DropdownItemDataModel> countriesData = [
    // const HelperModel(name: 'البلد',code: '0'),
    const DropdownItemDataModel(name: 'SY', code: '1'),
    const DropdownItemDataModel(name: 'USA', code: '2'),
    const DropdownItemDataModel(name: 'UAE', code: '3'),
  ];

  DropdownItemDataModel? selectedCountry;

  String? validateDropDownGender(DropdownItemDataModel? value) {
    if (selectedCountry == null) {
      return S.current.country;
    }
    return null;
  }

  next(BuildContext context) {
    NavigationService.of(context).navigateTo(const VerifyCodeScreenRoute(),);
  }
}