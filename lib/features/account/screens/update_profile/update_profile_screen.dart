

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/context_ext.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:lween/features/account/screens/account/account_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

@RoutePage()
class UpdateProfileScreen extends HookWidget {
  const UpdateProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AccountController controller = Controller.getInstance();

    useEffect(() {
      controller.resetSelectedImage();
      return (){};
    },
        const []);

    // final isImageSelected = useValueListenable(controller.isImageSelected);

    final cities = useState<List<DropdownItemDataModel>?>(
        controller.countryCities,
    );
    return BlocConsumer<AccountBloc,AccountState>(
        bloc: sl<AccountBloc>(),
        listener: controller.updateProfileListener,
        buildWhen: controller.updateProfileBuildWhen,
        builder: (context,state) {
          return IgnorePointer(
            ignoring: state is UpdateProfileLoading,
            child: AppScaffold(
              title: S.of(context).editProfile,
              child: FormBuilder(
                key: controller.formKey,
                initialValue: {
                  'name'  : controller.profile.name,
                  'country':controller.selectedCountry,
                  'city':controller.selectedCity,
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      42.vSpace,
                      Card(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 9.hx,
                            bottom: 11.hx,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsetsDirectional.only(
                                  start: 120.wx,
                                  end: 120.wx,
                                  top: 9.hx,
                                  bottom: 11.hx,
                                ),
                                child: Hero(
                                  tag: 'profile-image',
                                  child: Stack(
                                    children: [
                                      ValueListenableBuilder(
                                        valueListenable: controller.isImageSelected,
                                        builder: (ctx, isImageSelected, child) => AppImage(
                                          path: isImageSelected ? controller.localySelectedImage : controller.profile.imageUrl,
                                          errorImage: Assets.avatarPlaceHolderSVG,
                                          type: isImageSelected ? ImageType.file :  ImageType.cachedNetwork,
                                          width: 70.rx,
                                          height: 70.rx,
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                      ),
                                      Positioned.directional(
                                        textDirection: context.textDirection(context),
                                        start: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: () => controller.changeProfileImage(context,),
                                          child: SizedBox.square(
                                            dimension: 23.rx,
                                            child: AppImage(
                                              path: Assets.cameraSVG,
                                              type: ImageType.asset,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              // 8.vSpace,
                              Hero(
                                tag: 'user-name',
                                child: Text(
                                  controller.profile.name ?? '',
                                  style: context.textTheme.titleLarge,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      20.vSpace,
                      AppTextField(
                        name: 'name',
                        label: S
                            .of(context)
                            .fullName,
                        textCapitalization: TextCapitalization.words,
                        prefixIcon: SvgPicture.asset(Assets.profileIcon,),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      // fieldSeparator,
                      20.vSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          18.hSpace,
                          Assets.locationIconWidget,
                          13.hSpace,
                          Expanded(
                            child: Text(
                              S
                                  .of(context)
                                  .placeOfResidence,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium,
                            ),
                          )
                        ],
                      ),
                      20.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: AppDropDownField(
                              onChange: (v) {
                                controller.selectedCountry = v;
                                cities.value = controller.countryCities;
                              },
                              hintText: S.current.country,
                              name: 'country',
                              data: controller.countriesData,
                              validator: controller.validateDropDownCountry,
                              // initValue: controller.countriesData.firstOrNull,
                            ),
                          ),
                          10.hSpace,
                          Flexible(
                            child: AppDropDownField(
                              onChange: (v) {
                                controller.selectedCity = v;
                              },
                              hintText: S
                                  .of(context)
                                  .city,
                              name: 'city',
                              data: cities.value ?? [],
                              // validator: controller.validateDropDownCity,
                              // initValue: controller.selectedCity,
                            ),
                          ),
                        ],
                      ),
                      210.vSpace,
                      // const Spacer(),
                      AppGradientTextButton(
                        gradientType: AppTextButtonGradientType.primary,
                        isLoading: state is UpdateProfileLoading,
                        onTap: () => controller.save(context),
                        content: S
                            .of(context)
                            .editProfile,
                      ),
                      31.vSpace,

                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
