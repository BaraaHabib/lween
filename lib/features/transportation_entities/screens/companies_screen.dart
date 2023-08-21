import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/controller/base_controller.dart';
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
                  if (state is CompaniesLoading) {
                    return  GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7.rx
                        ),
                        itemCount: 6,
                        itemBuilder: (ctx, index) {
                          return _shimmer;
                        }
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
                    entity: S.of(context).favoriteCompanies,
                    actionTitle: S.of(context).browseCompanies,
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
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // childAspectRatio: 0.7.rx,
                              mainAxisExtent: 210.hx,
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

  Widget get _shimmer => ShimmerUI.widgetLoader(
    enabled: true,
    child: SizedBox(
        height: 205.hx,
        child: const Card(),
    )
  );
}

@RoutePage()
class CompaniesStack extends HookWidget {
  const CompaniesStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

}