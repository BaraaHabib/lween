import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/resources/constants.dart';
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
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CompaniesController controller =
    Controller.get(
      instance: CompaniesController(), );
    return AppScaffold(
      title: S.current.transportationEntities,
      navTab: NavTab.bookTrip,
      withBackButton: false,
      centerTitle: true,
      child: BlocBuilder<CompanyBloc, CompanyState>(
          bloc: CompanyBloc.instance,
          buildWhen: controller.buildWhen,
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
                  } else if (state is CompaniesError) {
                    return AppErrorWidget(
                      message: state.message,
                      actionTitle: S
                          .of(context)
                          .retry,
                      onAction: controller.refresh,
                    );
                  }
                  else if (state is CompaniesLoaded) {
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
                              itemCount:  state.items.items?.length ?? 0,
                              itemBuilder: (ctx, index) {
                                final item = state.items.items![index];
                                return CompanyItemWidget(item: item);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const EmptyWidget(
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
class CompaniesRoutesScreen extends HookWidget {
  const CompaniesRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

}