part of 'constants.dart';


enum NavTab{
  notification,
  account,
  tickets,
  bookTrip,
  home,;
}

enum PaymentMethod{
  mtn(1,1),
  syriatel(1,2),
  bemo(1,3),
  fatora(1,4),
  eCash(1,5),
  cash(2,6);

  const PaymentMethod(this.type,this.paymentProviderEnum);
  final int type;
  final int? paymentProviderEnum;
}
