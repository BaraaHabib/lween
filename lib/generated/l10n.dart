// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sorry, there are no {entity} yet`
  String sorryThereAreNoEntityYet(Object entity) {
    return Intl.message(
      'Sorry, there are no $entity yet',
      name: 'sorryThereAreNoEntityYet',
      desc: '',
      args: [entity],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `invalidPhoneNumber`
  String get invalidphonenumber {
    return Intl.message(
      'invalidPhoneNumber',
      name: 'invalidphonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message(
      'Signup',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Lween app`
  String get welcomeToLweenApp {
    return Intl.message(
      'Welcome to Lween app',
      name: 'welcomeToLweenApp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `full name`
  String get fullName {
    return Intl.message(
      'full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Make sure to enter the information accurately to complete the account creation process.`
  String get makeSureToEnterInformationAccuratly {
    return Intl.message(
      'Make sure to enter the information accurately to complete the account creation process.',
      name: 'makeSureToEnterInformationAccuratly',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Place of residence`
  String get placeOfResidence {
    return Intl.message(
      'Place of residence',
      name: 'placeOfResidence',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter verification code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message(
      'Resend code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Account`
  String get confirmAccount {
    return Intl.message(
      'Confirm Account',
      name: 'confirmAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the phone number you used to create the account. We will send you a verification code to reset your password`
  String get enterPhoneToSendCode {
    return Intl.message(
      'Enter the phone number you used to create the account. We will send you a verification code to reset your password',
      name: 'enterPhoneToSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get verificationCode {
    return Intl.message(
      'Verification code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Select preferred language`
  String get selectPreferredLanguage {
    return Intl.message(
      'Select preferred language',
      name: 'selectPreferredLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Phone should start with 09`
  String get phoneShouldStartWith09 {
    return Intl.message(
      'Phone should start with 09',
      name: 'phoneShouldStartWith09',
      desc: '',
      args: [],
    );
  }

  /// `Please select country`
  String get pleaseSelectCountry {
    return Intl.message(
      'Please select country',
      name: 'pleaseSelectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Please select city`
  String get pleaseSelectCity {
    return Intl.message(
      'Please select city',
      name: 'pleaseSelectCity',
      desc: '',
      args: [],
    );
  }

  /// `Passwords does not match`
  String get passwordsDoesNotMatch {
    return Intl.message(
      'Passwords does not match',
      name: 'passwordsDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully`
  String get passwordUpdatedSuccessfully {
    return Intl.message(
      'Password updated successfully',
      name: 'passwordUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Code was resent to your number`
  String get codeWasResentToYourNumber {
    return Intl.message(
      'Code was resent to your number',
      name: 'codeWasResentToYourNumber',
      desc: '',
      args: [],
    );
  }

  /// `Transportation entities`
  String get transportationEntities {
    return Intl.message(
      'Transportation entities',
      name: 'transportationEntities',
      desc: '',
      args: [],
    );
  }

  /// `Reservations`
  String get reservations {
    return Intl.message(
      'Reservations',
      name: 'reservations',
      desc: '',
      args: [],
    );
  }

  /// `Previous trips`
  String get previousTrips {
    return Intl.message(
      'Previous trips',
      name: 'previousTrips',
      desc: '',
      args: [],
    );
  }

  /// `Book a trip`
  String get bookATrip {
    return Intl.message(
      'Book a trip',
      name: 'bookATrip',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `My tickets`
  String get myTrips {
    return Intl.message(
      'My tickets',
      name: 'myTrips',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get myAccount {
    return Intl.message(
      'My account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Trips count`
  String get tripsCount {
    return Intl.message(
      'Trips count',
      name: 'tripsCount',
      desc: '',
      args: [],
    );
  }

  /// `My tickets`
  String get myTickets {
    return Intl.message(
      'My tickets',
      name: 'myTickets',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get tickets {
    return Intl.message(
      'Tickets',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message(
      'Company',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Seats count`
  String get seatsCount {
    return Intl.message(
      'Seats count',
      name: 'seatsCount',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Travel date`
  String get travelDate {
    return Intl.message(
      'Travel date',
      name: 'travelDate',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Trips`
  String get trips {
    return Intl.message(
      'Trips',
      name: 'trips',
      desc: '',
      args: [],
    );
  }

  /// `Centers count`
  String get centersCount {
    return Intl.message(
      'Centers count',
      name: 'centersCount',
      desc: '',
      args: [],
    );
  }

  /// `Company description`
  String get companyInfo {
    return Intl.message(
      'Company description',
      name: 'companyInfo',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get source {
    return Intl.message(
      'From',
      name: 'source',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get destination {
    return Intl.message(
      'To',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get companyName {
    return Intl.message(
      'Company name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `No trips available for this date`
  String get noTripsAvailableForThisDate {
    return Intl.message(
      'No trips available for this date',
      name: 'noTripsAvailableForThisDate',
      desc: '',
      args: [],
    );
  }

  /// `Choose seats`
  String get chooseSeats {
    return Intl.message(
      'Choose seats',
      name: 'chooseSeats',
      desc: '',
      args: [],
    );
  }

  /// `You can view the vehicle, or reserve seats directly`
  String get YouCanViewOrReserveSeats {
    return Intl.message(
      'You can view the vehicle, or reserve seats directly',
      name: 'YouCanViewOrReserveSeats',
      desc: '',
      args: [],
    );
  }

  /// `Preview vehicle`
  String get previewVehicle {
    return Intl.message(
      'Preview vehicle',
      name: 'previewVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Selected seats`
  String get selectedSeats {
    return Intl.message(
      'Selected seats',
      name: 'selectedSeats',
      desc: '',
      args: [],
    );
  }

  /// `S.P`
  String get currency {
    return Intl.message(
      'S.P',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Passengers details`
  String get passsengersInfo {
    return Intl.message(
      'Passengers details',
      name: 'passsengersInfo',
      desc: '',
      args: [],
    );
  }

  /// `Enter full names of the passengers in the reserved seats`
  String get enterFullNameForSeats {
    return Intl.message(
      'Enter full names of the passengers in the reserved seats',
      name: 'enterFullNameForSeats',
      desc: '',
      args: [],
    );
  }

  /// `Voucher code`
  String get voucherCode {
    return Intl.message(
      'Voucher code',
      name: 'voucherCode',
      desc: '',
      args: [],
    );
  }

  /// `If you have a discount code, enter it to get a discount on the ticket price`
  String get enterVoucherCode {
    return Intl.message(
      'If you have a discount code, enter it to get a discount on the ticket price',
      name: 'enterVoucherCode',
      desc: '',
      args: [],
    );
  }

  /// `Syriatel cash`
  String get syriatelCash {
    return Intl.message(
      'Syriatel cash',
      name: 'syriatelCash',
      desc: '',
      args: [],
    );
  }

  /// `If you choose online payment method, the payment process must be completed within 10 minutes at most.`
  String get orderDeletionWarning {
    return Intl.message(
      'If you choose online payment method, the payment process must be completed within 10 minutes at most.',
      name: 'orderDeletionWarning',
      desc: '',
      args: [],
    );
  }

  /// `MTN Cash`
  String get cashMtn {
    return Intl.message(
      'MTN Cash',
      name: 'cashMtn',
      desc: '',
      args: [],
    );
  }

  /// `Bemo Bank`
  String get bemoBank {
    return Intl.message(
      'Bemo Bank',
      name: 'bemoBank',
      desc: '',
      args: [],
    );
  }

  /// `Fatora`
  String get fatora {
    return Intl.message(
      'Fatora',
      name: 'fatora',
      desc: '',
      args: [],
    );
  }

  /// `Pay at center`
  String get payAtCenter {
    return Intl.message(
      'Pay at center',
      name: 'payAtCenter',
      desc: '',
      args: [],
    );
  }

  /// `Choose payment method`
  String get choosePaymentMethod {
    return Intl.message(
      'Choose payment method',
      name: 'choosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `E-Cash`
  String get eCash {
    return Intl.message(
      'E-Cash',
      name: 'eCash',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
