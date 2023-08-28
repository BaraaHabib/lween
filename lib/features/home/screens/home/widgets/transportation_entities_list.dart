

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/context_ext.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/features/home/models/home_entity.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/screens/widgets/controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:provider/provider.dart';

class TopCompaniesList extends HookWidget {
  const TopCompaniesList(this.data, {super.key});

  final List<CompanyEntity> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.hx,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextWidget(
                S.current.transportationEntities,
                style: context.theme.textTheme.headlineLarge,
              ),
              TextButton(
                onPressed: () =>
                    NavigationService.of(context).navigateTo(
                        CompaniesScreenRoute(),
                    ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero,),
                  visualDensity: VisualDensity.compact,
                  alignment: AlignmentDirectional.centerEnd,
                ),
                child: Assets.arrowBackWidget(context),
              ),
              // AppButton(
              //   color: Colors.transparent,
              //     content: Assets.arrowBackWidget(context)),
            ],
          ),
          8.vSpace,
          SizedBox(
            height: 80.hx,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: data.length,
              separatorBuilder: (ctx, index) => SizedBox(width: 18.hx,),
              itemBuilder: (ctx, index) => _CompanyWidget(data[index],),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompanyWidget extends HookWidget{

  final CompanyEntity entity;

  const _CompanyWidget(this.entity);

  @override
  Widget build(BuildContext context) {
    Controller.getInstance<CompanyItemController>(
      instance: CompanyItemController(entity),
      key: entity.id.toString(),
    );
    return GestureDetector(
      onTap: () {
        NavigationService.of(context).navigateTo(
            CompanyProfileScreenRoute(companyEntity: entity,));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(
              50,)),
            child: AppImage(
              path: entity.imageUrl ?? '',
              type: ImageType.cachedNetwork,
              width: 50.rx,
              height: 50.rx,
            ),
          ),
          7.vSpace,
          AppTextWidget(entity.name ?? '',
            style: context.theme.textTheme.titleSmall,)
        ],
      ),
    );
  }

}
