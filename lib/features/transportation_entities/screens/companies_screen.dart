import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/bordered_container.dart';
import 'package:lween/core/widgets/empty_widget.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/screens/controller.dart';
import 'package:lween/features/transportation_entities/screens/widgets/company_skeleton.dart';
import 'package:lween/features/transportation_entities/screens/widgets/company_widget.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';

@RoutePage()
class CompaniesScreen extends HookWidget {
  const CompaniesScreen({
    super.key,
    this.isFollowed = false,
  });

  final bool? isFollowed;
  @override
  Widget build(BuildContext context) {
    CompaniesController controller =
    Controller.getInstance(
      instance: CompaniesController(isFollowed: isFollowed), key: isFollowed.toString(),);
    return AppScaffold(
      title: (isFollowed ?? false) ? S.current.favoriteCompanies : S.current.transportationEntities,
      withBackButton: isFollowed ?? false,
      centerTitle: !(isFollowed ?? false),
      child: BlocConsumer<CompanyBloc, CompanyState>(
          bloc: CompanyBloc.instance,
          listener: controller.listener,
          buildWhen: controller.buildWhen,
          listenWhen: controller.listenWhen,
          builder: (context, state) {
            return Builder(
                builder: (context) {
                  if (
                  // true
                  state is CompaniesLoading
                  )
                  {
                    return  ShimmerUI.widgetLoader(
                      enabled: true,
                      child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5
                          ),
                          padding: EdgeInsets.only(top: 15.hx),
                          itemCount: 6,
                          itemBuilder: (ctx, index) {
                            return const CompanyItemSkeletonWidget();
                          }
                      ),
                    );
                  }
                  else if (state is CompaniesError) {
                    return AppErrorWidget(
                      message: state.message,
                      actionTitle: S
                          .of(context)
                          .retry,
                      onAction: controller.refresh,
                    );
                  }
                else if (controller.companies.isEmpty) {
                  return EmptyWidget(
                    actionTitle: S.of(context).browseCompanies,
                    fullMessage: S.of(context).youHaveNoFavoriteCompanies,
                    onAction: () {
                      NavigationService.of(context).pop();
                      NavigationService.of(context).navigateTo(
                          const CompaniesStackRoute(),
                      );
                    },
                  );
                  }
                  return Stack(
                    children: [
                      RefreshIndicator(
                        onRefresh: () async => controller.refresh(),
                        child: Positioned.fill(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              // maxCrossAxisExtent: 110.hx,
                              // mainAxisSpacing: 110.hx,
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              // mainAxisExtent: (context.mediaQuery.size.height) * 0.27,
                            ),
                            padding: EdgeInsets.only(top: 15.hx),
                            itemCount:  controller.companies.length,
                            itemBuilder: (ctx, index) {
                              final item = controller.companies[index];
                              return CompanyItemWidget(item: item);
                            },
                          ),
                        ),
                      ),
                    ],
                  );

                }
            );
          }
      ),
    );
  }

}

@RoutePage()
class CompaniesStack extends HookWidget {
  const CompaniesStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

}