

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';

class VerifyCodeController extends Controller{
  final formKey = GlobalKey<FormBuilderState>();



  verifyCode(context) {
    NavigationService
        .of(context)
        .navigateTo(
      const ResetPasswordScreenRoute(),
    );
  }
}