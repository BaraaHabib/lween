
part of 'company_profile_screen.dart';

class TripsWidgets extends StatelessWidget {
  const TripsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyProfileScreenController controller = Controller.get();
    final CompanyItemController companyController = Controller.get(key: controller.companyEntity.id.toString(),);
    return SizedBox(
      width: 1.sw,
      child: BlocBuilder<OrdersBloc,OrdersState>(
          bloc: sl<OrdersBloc>(),
          buildWhen: controller.buildWhen,
          builder: (context, state) {
            if(state is CompanyTravelsLoading){
              return const WaitingWidget();
            }
            if(state is CompanyTravelsError){
              return AppErrorWidget(
                topMargin: 30,
                actionTitle: S.current.retry,
                onAction: controller.getTravels,
                message: S.of(context).trips,
              );
            }
            else if(state is CompanyTravelsLoaded){
              final orders = state.travelsResult.travels ?? [];
              if(orders.isEmpty){
                return const SizedBox.shrink();
              }
              return RefreshIndicator(
                onRefresh: () => controller.getTravels(),
                child: ListView.separated(
                  itemCount: orders.length ,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (ctx,index) => 12.hSpace,
                  itemBuilder: (ctx,index) {
                    final item = orders[index];
                    return TripCard(
                      type: TripCardType.future,
                      subtitle: item.availableDaysText ?? '',
                      date: item.travelTime ?? '',
                      from: item.fromCity?.text ?? '',
                      to: item.toCity?.text ?? '',
                      imageUrl: Assets.tripOrderIcon,
                      // imageUrl: item.?.imageUrl,
                    );
                  },
                ),
              );
            }
            return Container();
          }
      ),
    );
  }
}
