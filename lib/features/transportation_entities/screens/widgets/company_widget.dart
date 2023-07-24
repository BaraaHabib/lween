


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/lween/widgets/followed_widget.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/bordered_container.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/screens/widgets/controller.dart';
import 'package:lween/generated/l10n.dart';

class CompanyItemWidget extends HookWidget {
  const CompanyItemWidget({
    required this.item,
    super.key});

  final CompanyEntity item;

  @override
  Widget build(BuildContext context) {
    final CompanyItemController controller
    = Controller.get(instance: CompanyItemController(item),key: item.id?.toString(),);
    // final followedValue = useValueListenable(controller.isFollowedNotifier);
    return GestureDetector(
      onTap: (){
        NavigationService.of(context).navigateTo(CompanyProfileScreenRoute(companyEntity: item,));
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: SizedBox(
              height: 205.hx,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox.square(
                      dimension: 155.rx,
                      child: AppImage(
                        path: item.imageUrl ?? '',
                        fit: BoxFit.fill,
                        type: ImageType.cachedNetwork,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AppTextWidget(
                                  item.name ?? '',
                                  style: context
                                      .textTheme
                                      .titleSmall,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.tripCountSVG,),
                                2.hSpace,
                                AppTextWidget(
                                  S
                                      .of(context)
                                      .tripsCount,
                                  style: context.textTheme.headlineSmall,
                                ),
                                2.hSpace,
                                AppTextWidget(
                                  item.travelsCount.toString(),
                                  style: context
                                      .textTheme
                                      .headlineSmall?.copyWith(
                                    color: Styles.tripsCountTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.directional(
            end: 15,
            top: 15,
            textDirection: LocaleProvider
                .of(context)
                .textDirection,
            child: FollowedWidget(id: item.id ?? 0),
          ),
        ],
      ),
    );
  }
}


