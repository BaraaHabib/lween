
part of '../../screens/order_travels_screen.dart';

class CompanyCardWidget extends HookWidget {
  const CompanyCardWidget({
    required this.companyEntity,
    required this.from,
    required this.to,
    required this.date,
    super.key,
  });

  final CompanyEntity companyEntity;
  final String from;
  final String to;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 13),
        child: Row(
          children: [
            AppImage(
              path: companyEntity.imageUrl ?? '',
              type: ImageType.cachedNetwork,
              height: 90.rx,
              width: 90.rx,
              borderRadius: Styles.borderRadius12px,
            ),
            9.hSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    companyEntity.name ?? '',
                    style: context.textTheme.titleMedium,
                  ),
                  10.vSpace,
                  _InfoRowWidget(icon: Assets.locationIcon, text1: S
                      .of(context)
                      .startFrom, text2: from,),
                  _InfoRowWidget(icon: Assets.locationIcon, text1: S
                      .of(context)
                      .arriveTo, text2: to,),
                  _InfoRowWidget(icon: Assets.calendarSVG,
                    text1: S
                        .of(context)
                        .travelDate,
                    text2: AppConfigurations.appDisplayDateFormat.format(date),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InfoRowWidget extends StatelessWidget {
  const _InfoRowWidget({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  final String icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 15.hx,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(
                Styles.headLineFontColor, BlendMode.srcIn,),
              fit: BoxFit.scaleDown,
            ),
          ),
          5.hSpace,
          AppTextWidget(text1, style: context.textTheme.headlineMedium,),
          10.hSpace,
          AppTextWidget(text2, style: Theme
              .of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
              color: Styles.textButtonColor
          ),),
        ],
      ),
    );
  }
}

