

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/bordered_container.dart';
import 'package:lween/core/widgets/shadowed_widget.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/screens/widgets/controller.dart';

class FollowedWidget extends HookWidget {

  const FollowedWidget({
    super.key,
    required this.id,
  });

  final int id;
  @override
  Widget build(BuildContext context) {
    final CompanyItemController controller
    = Controller.getInstance<CompanyItemController>(key: id.toString());
    return  BlocConsumer<CompanyBloc,CompanyState>(
      bloc: CompanyBloc.instance,
      listener: controller.listener,
      listenWhen: controller.listenWhen,
      buildWhen: controller.buildWhen,
      builder:(ctx, state) {
        return AbsorbPointer(
          absorbing: state is ToggleFollowCompanyStateLoading,
          child: GestureDetector(
            onTap: controller.toggleFollow,
            child: Container(
              height: 30.rx,
              width: 30.rx,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: Styles.borderRadius30px,
                boxShadow: const [
                  BoxShadow(
                    color: Styles.shadowColor,
                    offset: Offset(0, 1),
                    blurRadius: 1.5,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: AnimatedToggle(
                keyId: 'TFollowed${controller.item.id}',
                value: controller.item.isFollowed,
                child: Center(
                  child: state is ToggleFollowCompanyStateLoading
                      ? const WaitingWidget(scale: 0.5,)
                      : Assets.followIconSVG(controller.item
                      .isFollowed ?? false,),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
