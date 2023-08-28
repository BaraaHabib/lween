

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/features/account/screens/account_settings/account_settings_controller.dart';
import 'package:lween/features/account/screens/account_settings/widgets/account_settings_item_widget.dart';
import 'package:lween/generated/l10n.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AccountSettingsScreen extends HookWidget {
  const AccountSettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final AccountSettingsController controller = Controller.getInstance(
      instance: AccountSettingsController(), permanent: true,);

    final divider = Divider(
      thickness: 0.1,
      height: 25,
      endIndent: 0,
      indent: 40.wx,
    );
    return Consumer<AppStateModel>(
      builder: (BuildContext context, value, Widget? child) {
        return  AppScaffold(
          title: S.of(context).accountSettings,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              25.vSpace,
              SizedBox(
                height: 22.hx,
                child: Row(
                  children: [
                    SizedBox(
                      width: 18.wx,
                      child: AppImage(path: Assets.lightModeIconSVG,type: ImageType.asset,),
                    ),
                    8.hSpace,
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CupertinoSwitch(
                        value: !value.isLightTheme,
                        onChanged: (v) {
                          AppStateModel.of(context).toggleTheme();
                        },
                        activeColor: Styles.blueColor,
                        // activeTrackColor: context.theme.primaryColor,
                        thumbColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      ),
                    ),
                    8.hSpace,
                    SizedBox(
                      width: 12.wx,
                      child: AppImage(path: Assets.darkModeIconSVG,type: ImageType.asset,),
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: 26.hx,
                      horizontal: 15.wx
                  ),
                  child: Column(
                    children: [
                      AccountSettingsItemWidget(
                        icon: Assets.languageSVG,
                        title: S.of(context).language,
                        value: LocaleProvider.of(context).selectedLanguageText,
                        onTap: () => controller.showLanguageDialog(context,),
                      ),
                      divider,
                      AccountSettingsItemWidget(
                        icon: Assets.changePasswordSVG,
                        title: S.of(context).changePassword,
                        onTap: () => controller.changePassword(context,),

                      ),
                      divider,
                      AccountSettingsItemWidget(
                        icon: Assets.changePhoneNumberSVG,
                        title: S.of(context).changePhoneNumber,
                        onTap: () => controller.changePhone(context,),
                      ),
                    ],
                  ),
                ),
              ),
              25.vSpace,
              Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: 26.hx,
                      horizontal: 15.wx
                  ),
                  child: Column(
                    children: [
                      AccountSettingsItemWidget(
                        icon: Assets.logOutSVG,
                        title: S.of(context).logOut,
                        onTap: () => controller.logOut(context),
                      ),
                      divider,
                      AccountSettingsItemWidget(
                        icon: Assets.deleteAccountSVG,
                        title: S.of(context).deleteAccount,
                        onTap: () => controller.deleteAccount(context),
                      ),
                      // divider,
                      // AccountItemWidget(
                      //   icon: Assets.deactivateAccountSVG,
                      //   title: S.of(context).deactivateAccount,
                      // ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}



