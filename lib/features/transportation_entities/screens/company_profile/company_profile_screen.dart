
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/lween/widgets/followed_widget.dart';
import 'package:lween/core/lween/widgets/trip_card_skelton.dart';
import 'package:lween/core/lween/widgets/trip_card_widget.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/screens/company_profile/controller.dart';
import 'package:lween/features/transportation_entities/screens/widgets/controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';
part 'info_widget.dart';
part 'trips_widget.dart';
@RoutePage()
class CompanyProfileScreen extends HookWidget {
  const CompanyProfileScreen({
    required this.companyEntity,
    super.key,
  });

  final CompanyEntity companyEntity;

  @override
  Widget build(BuildContext context) {
    final tabsController = useTabController(initialLength: 2,initialIndex: 0);
    final CompanyProfileScreenController controller =
    Controller.getInstance(instance: CompanyProfileScreenController(companyEntity, tabsController),);
    final CompanyItemController companyController = Controller.getInstance(
      key: controller.companyEntity.id.toString(),
    );

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: AppScaffold(
        title: companyEntity.name ?? '',
        child: Column(
          // shrinkWrap: true,
          // mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Styles.liteGrayColor,
                        width: 0.7,
                      )
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex:1,
                      child: TabItem(index: 0, text: S.current.trips,),
                  ),
                  Expanded(
                      flex:1,
                      child: TabItem(index: 1, text: S.current.description,),
                  ),
                ],
              ),
            ),
            30.vSpace,
            Card(
              child: Padding(
                padding: EdgeInsets.all(12.rx),
                child: Row(
                  children: [
                    AppImage(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      path: companyController.item.imageUrl ?? '',
                      type: ImageType.cachedNetwork,
                      width: 60.rx,
                      height: 60.rx,
                    ),
                    22.hSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextWidget(
                                companyController.item.name ?? '',
                                style: context.textTheme.titleMedium,
                              ),
                              FollowedWidget(id: companyController.item.id ?? 0)
                            ],
                          ),
                          5.vSpace,
                          _DescriptionItem(icon: Assets.locationIcon,label: S.current.centersCount,value: companyController.item.centersCount ?? 0,),
                          7.vSpace,
                          _DescriptionItem(icon: Assets.tripCountSVG,label: S.current.tripsCount,value: companyController.item.travelsCount ?? 0,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            32.vSpace,
            Expanded(
              child: TabBarView(
                controller: controller.tabsController,
                children: const [
                  TripsWidgets(),
                  InfoWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TabItem extends StatelessWidget {
  const TabItem({
    required this.text,
    required this.index,
    super.key,
  });

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    final CompanyProfileScreenController controller = Controller.getInstance();
    return ValueListenableBuilder(
        valueListenable: controller.currentIndexNotifier,
        builder: (context, currentIndex, child) {
          return GestureDetector(
          onTap: () => controller.changeTab(index),
          child: Container(
            // width: 0.4.sw,
            padding: const EdgeInsets.symmetric(vertical: 8,),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: currentIndex == index ? Styles.selectedNavItemBackgroundColor : Colors.transparent,
                      width: 1,

                    )
                )
            ),
            child: Center(
                child: Text(
                  text,
                  style: context
                      .textTheme
                      .titleMedium?.copyWith(
                    color:  currentIndex == index ? Styles.selectedNavItemBackgroundColor : null,
                  ),
                ),
            ),
          ),
        );
      }
    );
  }
}
