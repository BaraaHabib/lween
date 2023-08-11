

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/app_video.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';

class VehiclesTypeWidget extends HookWidget {

  const VehiclesTypeWidget({
    required this.types,
    required this.onTap,
    super.key,
    this.currentType,
  });

  final List<VehicleType> types;
  final Function(VehicleType) onTap;
  final VehicleType? currentType;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 15),
      itemCount: types.length,
      separatorBuilder: (ctx, index) => 25.vSpace,
      itemBuilder: (ctx, index) => VehicleTypeWidget(
          type: types[index],
          onTap: onTap,
          isSelected: currentType == types[index],

      ),
      // children: types.map((e) => VehicleTypeWidget(type: e, onTap: onTap,isSelected : currentType == e))
      //     .toList(),
    );
  }
}

class VehicleTypeWidget extends HookWidget {
  const VehicleTypeWidget({
    super.key,
    required this.type,
    required this.onTap,
    required this.isSelected,
  });

  final bool isSelected;
  final VehicleType type;
  final Function(VehicleType) onTap;

  @override
  Widget build(BuildContext context) {
    String? name =
    useMemoized(() {
      final OrderWizardController controller = Controller.getInstance();
      return controller.travelsResult?.firstWhereOrNull((e) => e.travelMethodEnum == type)?.travelMethodText;
    },[type]);
    useEffect(() {
      return (){};
    },const [],);
    return GestureDetector(
      onTap: () => onTap.call(type),
      child: AnimatedToggle(
        value: '$type$isSelected',
        child: Column(
          children: [
            isSelected ? AppVideo(
                path: type.miniGgif,
                width: 40.wx,
                height: 20.hx,
            ):
            AppImage(
              path: type.icon,
              type: ImageType.asset,
              color: isSelected ? Styles.selectedVehicleStartColor(context,) : Styles
                  .unselectedVehicleColor(context,),
              width: 40.wx,
              height: 20.hx,
              fit: BoxFit.scaleDown,
            ),
            5.vSpace,
            FittedBox(
              fit: BoxFit.scaleDown,
              child: AppTextWidget(
                name ?? '',
                maxLines: 3,
                style: context
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                  color: isSelected ? Styles.selectedVehicleStartColor(context,) : Styles
                      .unselectedVehicleColor(context,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}