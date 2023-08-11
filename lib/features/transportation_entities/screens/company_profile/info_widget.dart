
part of 'company_profile_screen.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyProfileScreenController controller = Controller.getInstance();
    final CompanyItemController companyController = Controller.getInstance(key: controller.companyEntity.id.toString(),);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          AppTextWidget(
            S.of(context).companyInfo,
            style: context.textTheme.headlineLarge,
          ),
          10.vSpace,
          Flexible(
            child: Text.rich(
              TextSpan(text: companyController.item.description ?? '',style: context.textTheme.bodyMedium),
              maxLines: 20,
            ),
          )
        ],
      ),
    );
  }
}

class _DescriptionItem extends StatelessWidget{
  const _DescriptionItem({
    required this.value,
    required this.label,
    required this.icon,
});
  
  final String icon;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
        ),
        7.hSpace,
        AppTextWidget(label,style: context.textTheme.headlineMedium,),
        7.hSpace,
        AppTextWidget(
          value.toString(),
          style: context
              .textTheme
              .headlineSmall?.copyWith(
            color: Styles.tripsCountTextColor,
          ),
        ),
      ],
    );
  }

}
