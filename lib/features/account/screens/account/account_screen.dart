

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:lween/features/account/screens/account/account_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';

@RoutePage()
class AccountScreen extends HookWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Controller.getInstance(
      instance: AccountController(
        AppStateModel.of(context).profile,
      ),
    );
    return BlocConsumer<AccountBloc, AccountState>(
      bloc: AccountBloc.instance,
      listener: controller.listener,
      listenWhen: controller.listenWhen,
      buildWhen: controller.buildWhen,
      builder:(ctx, state) {
        final profile = controller.profile; 
        return AppScaffold(
        title: S.of(context).myAccount,
        centerTitle: true,
        withBackButton: false,
        child: RefreshIndicator(
          onRefresh: () async => AccountBloc.instance.add(const GetProfileEvent()),
          child: ListView(
            children: [
              50.vSpace,
              Card(
                child: Container(
                  padding: EdgeInsets.all(20.rx,),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'profile-image',
                        child: AppImage(
                            path: profile.imageUrl,
                            errorImage: Assets.avatarPlaceHolderSVG,
                            type: ImageType.cachedNetwork,
                            width: 70.rx,
                            height: 70.rx,
                            borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      15.hSpace,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex:8,
                                    child: Hero(
                                      tag: 'user-name',
                                      child: AppTextWidget(
                                        profile.name ?? '',
                                        maxLines: 2,
                                        style: context
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                ),
                                const Spacer(),
                                Expanded(
                                    flex:2,
                                    child: GestureDetector(
                                      onTap: () => controller.editProfile(context,),
                                      child: AppImage(
                                        path: Assets.editAccountSVG,
                                        type: ImageType.asset,
                                        fit: BoxFit.scaleDown,
                                        width: 32.rx,
                                        height: 32.rx,
                                      ),
                                    ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: AppTextWidget(
                                      profile.phoneNumber ?? '',
                                      maxLines: 2,
                                      style: context.textTheme.headlineMedium,
                                    ),
                                ),
                              ],
                            ),
                            if(controller.profile.balanceText != null)
                              Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppTextWidget(
                                  '${S.of(context).currentBalance}:',
                                  strutStyle: const StrutStyle(
                                    height: 1.0
                                  ),
                                ),
                                const Spacer(),
                                // const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    AppImage(
                                        path: Assets.rewardIconSVG,
                                        type: ImageType.asset,
                                        fit: BoxFit.scaleDown,
                                        height: 13.rx,
                                        width: 13.rx,
                                    ),
                                    3.hSpace,
                                    FittedBox(
                                      // fit: BoxFit.scaleDown,
                                      child: AppTextWidget(
                                        controller.profile.balanceText!,
                                        style: context.textTheme.bodyMedium?.copyWith(
                                          color: Styles.rewardFontColor,
                                        ),
                                        overflow: TextOverflow.visible,
                                        maxLines: 1,
                                        strutStyle: const StrutStyle(
                                            height: 1.1
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              40.vSpace,
              Card(
                child: InkWell(
                  onTap: () => controller.goToActiveOrders(context,),
                  borderRadius: Styles.borderRadius12px,
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 20.wx,
                      bottom: 15.hx,
                      top: 15.hx,
                    ),
                    child: Row(
                      children: [
                        AppImage(
                            path: Assets.ordersCountPNG,
                            type: ImageType.asset,
                            fit: BoxFit.scaleDown,
                            height: 33.rx,
                            width: 33.rx,
                        ),
                        12.hSpace,
                        AppTextWidget(
                            S.of(context).myReservations,
                            style: context.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              13.vSpace,
              Row(
                children: [
                  _MyAccountElementWidget(
                    icon: Assets.favouriteAccountPNG,
                    onTap: () => controller.goToFavoriteCompanies(context,),
                    title: S.of(context).favoriteCompanies,
                  ),
                  13.hSpace,
                  _MyAccountElementWidget(
                    icon: Assets.previousTripsIconPNG,
                    onTap: () => controller.goToMyOrders(context,),

                    title: S.of(context).previousTrips,
                  ),
                  // Expanded(child: Card()),
                ],
              ),
              13.vSpace,
              Row(
                children: [
                  _MyAccountElementWidget(
                    icon: Assets.accountSettingsPNG,
                    onTap:() => controller.openAccountSettings(context),

                    title: S.of(context).accountSettings,
                  ),
                  13.hSpace,
                  _MyAccountElementWidget(
                    icon: Assets.questionMarkIconPNG,
                    onTap: () => controller.openSupport(context,),
                    title: S.of(context).helpAndSupport,
                  ),
                  // Expanded(child: Card()),
                ],
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}

class _MyAccountElementWidget extends StatelessWidget {
  const _MyAccountElementWidget({super.key, required this.icon, required this.onTap, required this.title});

  final String icon;
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
              vertical: 16.hx,
              horizontal: 21.wx,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(
                  path: icon,
                  type: ImageType.asset,
                  width: 30.rx,
                  height: 30.rx,
                  fit: BoxFit.scaleDown,
                ),
                8.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AppTextWidget(
                          title,
                          // maxLines: 2,
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

