
part of 'app_scaffold.dart';

class AppNavWidget extends HookWidget{
  AppNavWidget({
    required this.index,
    required this.setActiveIndex,
    required this.tabsRouter,
    super.key,
  });

  final int index;
  final TabsRouter tabsRouter;
  final void Function(int index, {bool notify}) setActiveIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Controller.get(instance: NavController(),);
    return GNav(
        backgroundColor: Styles.navbarBackgroundColor(context,),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        hoverColor: Styles.selectedNavItemBackgroundColor, // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 20.rx,
        tabActiveBorder: Border.all(color: Colors.transparent, width: 1), // tab button border
        tabBorder: Border.all(color: Colors.transparent,), // tab button border
        // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
        curve: Curves.easeIn, // tab animation curves
        duration: 250.milliseconds, // tab animation duration
        gap: 2 .wx, // the tab button gap between icon and text
        color: Styles.navUnselectedIcon,
        iconSize: 25, // tab button icon size
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7), // navigation bar padding
        tabMargin: const EdgeInsets.symmetric(vertical: 14,),
        selectedIndex:NavTab.values.length - index - 1,
        onTabChange: (index){
          controller.changeTab(context,tabsRouter, index);
          setActiveIndex.call(index,notify: true);
        },
        tabs: [
          _NabButton(
            icon: NavIcons.notifications,
            text: S.of(context).notifications,
          ),
          _NabButton(
            icon: NavIcons.user,
            text: S.of(context).myAccount,
          ),
          _NabButton(
            icon: NavIcons.ticket,
            text: S.of(context).myTrips,
          ),
          _NabButton(
            icon: NavIcons.seo,
            text: S.of(context).bookATrip,
          ),
          _NabButton(
            icon: NavIcons.home,
            text: S.of(context).home,
          ),
        ]
    );
  }
}

class _NabButton extends GButton {
  _NabButton({
    required String text,
    required IconData icon,
    super.key,
  }) : super(
    icon: icon,
    text: text,
    backgroundColor: Styles.selectedNavItemBackgroundColor,
    activeBorder: Border.all(color: Colors.transparent,),
    textColor: Styles.navTextColor,
    iconActiveColor: Styles.navIconActiveColor,
    textStyle: TextStyle(
      color: Styles.navTextColor,
      fontSize: 14.spx,
    ),
  );
}


class NavController extends Controller{

  final _currentTab = ValueNotifier(NavTab.home) ;

  NavTab get currentTab => _currentTab.value;

  int get currentTabIndex => currentTab.index;

  set currentTab(NavTab value) {
    _currentTab.value = value;
  }

  changeTab(BuildContext context, TabsRouter tabsRouter, int index){
    assert(index < 5 && index >= 0);
 /*   if(index == tabsRouter.activeIndex){
      return;
    }*/
    currentTab = NavTab.values[index];
    // TabsRouter();
    switch(currentTab){
      case NavTab.home:
        tabsRouter.navigate(const HomeScreenRoute());
        // tabsRouter.navigate(route)
        break;
      case NavTab.bookTrip:
        tabsRouter.navigate(const CompaniesScreenRoute());
        break;
      case NavTab.tickets:
        tabsRouter.navigate(const MyOrdersScreenRoute());
        break;
      case NavTab.account:
        tabsRouter.navigate(const AccountScreenRoute());
        break;
      case NavTab.notification:
        tabsRouter.navigate(const NotificationsScreenRoute());
        break;
      default:
        NavTab.home;
    }
  }

  @override
  void init() {
    super.init();
  }

}