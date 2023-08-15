part of 'constants.dart';


enum NavTab{
  notification,
  account,
  tickets,
  bookTrip,
  home,;
}

enum PaymentMethod{
  cashMobile(1,1),
  bemo(1,2),
  fatora(1,3),
  eCash(1,4),
  cash(2,5);

  const PaymentMethod(this.type,this.paymentProviderEnum);
  final int type;
  final int? paymentProviderEnum;

  bool get isByPhoneNumber => this == PaymentMethod.cashMobile;
  bool get isWebView =>
      this == PaymentMethod.bemo ||
      this == PaymentMethod.eCash ||
      this == PaymentMethod.fatora
  ;
}

enum VehicleType {
  bus(1, Assets.busPNG,Assets.mBusGIF,Assets.busGIF,Color(0xFF9DABB5),Color(0xFF354758),),
  microbus(2, Assets.microbusPNG, Assets.mMicrobusGIF, Assets.microbusGIF,Color(0xFFFBAA8A),Color(0xFFF8A1A0),),
  van(3, Assets.vanPNG,Assets.mVanGIF,Assets.vanGIF,Color(0xFF71D3CE),Color(0xFF78C6CE),),
  car(4, Assets.carPNG,Assets.mCarGIF,Assets.carGIF,Color(0xFFF29A49),Color(0xFFF0A93D),),
  other(5, Assets.otherPNG,Assets.mCarGIF,Assets.carGIF,Color(0xFF9DABB5),Color(0xFF354758),);

  const VehicleType(
      this.type,
      this.icon,
      this.miniGgif,
      this.gif,
      this.startMiniColor,
      this.endMiniColor,
      );

  final int type;
  final String icon;
  final String gif;
  final String miniGgif;
  final Color startMiniColor;
  final Color endMiniColor;

}

enum OrderPaymentStatus{
  rejected(-2),
  canceled(-1),
  pending(1),
  paid(2),
  convertedToPhysicalTicket(3);

  const OrderPaymentStatus(this.apiValue);
  final int apiValue;
}
