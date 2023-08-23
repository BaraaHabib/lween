


abstract class ApiConstants{
  static const initApp = 'Client/Home/InitApp';
  static const register = 'Client/Account/Register';
  static const login = 'Common/TokenAuth/Authenticate';
  static const verifyAccount = 'Client/Account/ConfirmAccount';
  static const forgotPassword = 'Client/Account/ForgotMyPassword';
  static const checkCode = 'Client/Account/CheckCode';
  static const resendCode = 'Client/Account/ResendCode';
  static const enterNewPassword = 'Client/Account/EnterForgetPasswordCode';
  static const home = 'Client/Home/HomePage';
  static const listOrders = 'Client/Order/List';
  static const transportationEntities = 'Client/transportationEntity/List';
  static const followCompany = 'Client/UserFollowedTransportationEntity/Follow';
  static const unfollowCompany = 'Client/UserFollowedTransportationEntity/Unfollow';
  static const dailyTravels = 'Client/DailyTravel/List';
  static const upcomingTravels = 'Client/DailyTravel/UpcomingTravels';
  static const createOrder = 'Client/Order/Create';
  static const checkVoucher = 'Client/Order/checkCode';
  static const cancelOrder = 'Client/Order/Cancel';
  static const notifications = 'Client/Notification/List';
  static const requestPayment = 'Client/OnlinePayment/RequestPayment';
  static const resendPaymentCode = 'Client/OnlinePayment/ResendPaymentConfirmationCode';
  static const completePayment = 'Client/OnlinePayment/CompletePayment';
  static const updateToken = 'Client/Home/FirebaseToken';
  static const getProfile = 'Client/Account/Profile';
  static const editProfile = 'Client/Account/EditProfile';
  static const uploadFile = 'File/Upload';

}