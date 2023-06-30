

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';

class LoginController extends Controller{
  final formKey = GlobalKey<FormBuilderState>();


  signup(context) {
    NavigationService.of(context).navigateTo(const RegisterScreenRoute());
  }

  logIn() {
    formKey.currentState?.save();
    formKey.currentState?.validate();
  }
}