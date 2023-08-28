

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_video.dart';
import 'package:lween/features/home/models/home_entity.dart';

class HomeSlider extends HookWidget {
  const HomeSlider(this.ads, {super.key});

  final List<AdvertisementEntity> ads;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive(wantKeepAlive: true,);
    final HomeSliderController controller =
    Controller.getInstance(instance: HomeSliderController(ads), permanent: true,);
    bool isVideo = false;

    if (ads.any((ad) => ad.isVideo)) {
      isVideo = true;
    }
    else {
      ads.removeWhere((e) => e.isVideo);
    }
    return Padding(
        padding: EdgeInsets.only(bottom: 20.hx,),
        child: Builder(builder: (ctx){
          if (isVideo) {
            final ad = ads.first;
            return InkWell(
              onTap: ad.url == null ? null
                  : () => controller.openAdPage(context,ad.url!),
              child: SizedBox(
                height: (9/16).sw,
                width: 1.sw,
                child: AppVideo(
                  key: Key(ad.attachmentUrl!),
                  fit: BoxFit.fill,
                  path: ad.attachmentUrl!,),
              ),
            );
          }
          else {
            return CarouselSlider(
              carouselController: controller.carouselController,
              options: CarouselOptions(
                height: 180.hx,
                autoPlay: ads.length > 1,
                enlargeCenterPage: false,
                padEnds: false,
                enableInfiniteScroll: ads.length > 1,
                viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                // aspectRatio: 1.5
              ),
              items: controller.ads.map((ad) {
                return GestureDetector(
                  onTap: ad.url == null ? null :
                      () => controller.openAdPage(context, ad.url!),
                  child: AppImage(
                    path: ad.attachmentUrl!,
                    width: 1.sw,
                    type: ImageType.cachedNetwork,
                  ),
                );
              }).toList(),
            );
          }
        }),
    );

  }
}

class HomeSliderController extends Controller{
  HomeSliderController(this.ads);

  final List<AdvertisementEntity> ads;
  final CarouselController carouselController = CarouselController();

  openAdPage(context,String url) {
    NavigationService
        .of(context)
        .navigateTo(AppWebViewRoute(url: url,),);
  }
}

