


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/lween/widgets/slider_indicator.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/generated/l10n.dart';
import 'package:preload_page_view/preload_page_view.dart';

@RoutePage()
class OrderPreviewVehicleScreen extends HookWidget {
  const OrderPreviewVehicleScreen({super.key, required this.images});

  final List<String?> images;

  @override
  Widget build(BuildContext context) {
    late PreloadPageController controller;
    useEffect(() {
      controller = PreloadPageController();
      return () {
        controller.dispose();
      };
    });
    final currentIndex = useState(0);
    return AppScaffold(
      title: S.current.previewVehicle,
      child: Stack(
        children: [
          SizedBox(
            height: 0.9.sh,
            child: PreloadPageView.builder(
              itemCount: images.length,
              itemBuilder: (ctx, index) {
                return AppImage(
                  path: images[index],
                  type: ImageType.cachedNetwork,
                  fit: BoxFit.contain,
                );
              },
              onPageChanged: (int position) {
                currentIndex.value = position;
              },
              preloadPagesCount: 2,
              controller: controller,
            ),
          ),
          Positioned(
            bottom: 10.hx,
            right: 0,
            left: 0,
            child: SliderIndicator(
              count: images.length, selectedIndex: currentIndex.value,),
          ),
        ],
      ),
    );
  }
}
