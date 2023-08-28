// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(city1, city2, company, date, X, price) =>
      "Do you want to confirm sending a reservation request from ${city1} to ${city2} within ${company} on ${date} for ${X} passengers at a cost of ${price} Syrian pounds";

  static String m1(count) =>
      "Due to the reservation of ${count} seats, you will not be able to schedule your order without paying it directly from the application via the available electronic payment methods.";

  static String m2(value) => "Payed amount ${value}";

  static String m3(value) => "payed with ${value}";

  static String m4(value) => "Required payment ${value}";

  static String m5(entity) => "Sorry, there are no ${entity} yet";

  static String m6(value) => "You have discount ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "YouCanViewOrReserveSeats": MessageLookupByLibrary.simpleMessage(
            "You can view the vehicle, or reserve seats directly"),
        "accountSettings":
            MessageLookupByLibrary.simpleMessage("Account settings"),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "areYouSureYouWantToCancelOrder": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to cancel order?"),
        "areYouSureYouWantToLogOut": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "arriveTo": MessageLookupByLibrary.simpleMessage("Arrive to"),
        "availableDateTravels": MessageLookupByLibrary.simpleMessage(
            "Available trips in selected date"),
        "availableDays": MessageLookupByLibrary.simpleMessage("Available days"),
        "bemoBank": MessageLookupByLibrary.simpleMessage("Bemo Bank"),
        "bookATrip": MessageLookupByLibrary.simpleMessage("Book a trip"),
        "bookingStatus": MessageLookupByLibrary.simpleMessage("Booking status"),
        "browseCompanies":
            MessageLookupByLibrary.simpleMessage("Browse companies"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelOrder": MessageLookupByLibrary.simpleMessage("Cancel order"),
        "cashMobile": MessageLookupByLibrary.simpleMessage("Cash Mobile"),
        "cashMtn": MessageLookupByLibrary.simpleMessage("MTN Cash"),
        "cashPaymentNotAvailable": MessageLookupByLibrary.simpleMessage(
            "The number of seats allowed to be reserved without payment has been exceeded"),
        "centersCount": MessageLookupByLibrary.simpleMessage("Centers count"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "changePhoneNumber":
            MessageLookupByLibrary.simpleMessage("Change phone number"),
        "choosePaymentMethod":
            MessageLookupByLibrary.simpleMessage("Choose payment method"),
        "chooseSeats": MessageLookupByLibrary.simpleMessage("Choose seats"),
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "city1City2DateXPrice": m0,
        "codeWasResentToYourNumber": MessageLookupByLibrary.simpleMessage(
            "Verification code was resent to your number"),
        "company": MessageLookupByLibrary.simpleMessage("Company"),
        "companyInfo":
            MessageLookupByLibrary.simpleMessage("Company description"),
        "companyName": MessageLookupByLibrary.simpleMessage("Company name"),
        "confirmAccount":
            MessageLookupByLibrary.simpleMessage("Confirm Account"),
        "confirmOperation":
            MessageLookupByLibrary.simpleMessage("Confirm operation"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "currency": MessageLookupByLibrary.simpleMessage("S.P"),
        "currentBalance":
            MessageLookupByLibrary.simpleMessage("Current balance"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Current password"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "deactivateAccount":
            MessageLookupByLibrary.simpleMessage("Deactivate account"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "destination": MessageLookupByLibrary.simpleMessage("To"),
        "eCash": MessageLookupByLibrary.simpleMessage("E-Cash"),
        "editProfile": MessageLookupByLibrary.simpleMessage("Edit profile"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "enterFullNameForSeats": MessageLookupByLibrary.simpleMessage(
            "Enter full names of the passengers in the reserved seats"),
        "enterPasswordToContinueDeletingAccount":
            MessageLookupByLibrary.simpleMessage(
                "Enter password to continue deleting account"),
        "enterPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Enter phone number"),
        "enterPhoneToSendCode": MessageLookupByLibrary.simpleMessage(
            "Enter the phone number you used to create the account. We will send you a verification code to reset your password"),
        "enterVerificationCode":
            MessageLookupByLibrary.simpleMessage("Enter verification code"),
        "enterVoucherCode": MessageLookupByLibrary.simpleMessage(
            "If you have a discount code, enter it to get a discount on the ticket price"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "exceededSeatsCountDialogMessage": m1,
        "fatora": MessageLookupByLibrary.simpleMessage("Fatora"),
        "favoriteCompanies":
            MessageLookupByLibrary.simpleMessage("Favorite companies"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "from": MessageLookupByLibrary.simpleMessage("from"),
        "fullName": MessageLookupByLibrary.simpleMessage("full name"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "helpAndSupport":
            MessageLookupByLibrary.simpleMessage("Help and support"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "importantWarning":
            MessageLookupByLibrary.simpleMessage("Important Notice"),
        "informationUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Profile updated successfully"),
        "invalidphonenumber":
            MessageLookupByLibrary.simpleMessage("invalidPhoneNumber"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log in"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "makeSureToEnterInformationAccuratly": MessageLookupByLibrary.simpleMessage(
            "Make sure to enter the information accurately to complete the account creation process."),
        "myAccount": MessageLookupByLibrary.simpleMessage("My account"),
        "myReservations":
            MessageLookupByLibrary.simpleMessage("My reservations"),
        "myTickets": MessageLookupByLibrary.simpleMessage("My tickets"),
        "myTrips": MessageLookupByLibrary.simpleMessage("My tickets"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "newPhoneNumber":
            MessageLookupByLibrary.simpleMessage("New phone number"),
        "newRequiredPayment":
            MessageLookupByLibrary.simpleMessage("Price after discount"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "noTripsAvailableForThisDate": MessageLookupByLibrary.simpleMessage(
            "No trips available for this date"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "orderDeletionWarning": MessageLookupByLibrary.simpleMessage(
            "If you choose online payment method, the payment process must be completed within 10 minutes at most."),
        "orderDetails": MessageLookupByLibrary.simpleMessage("Order details"),
        "orderFinishedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Your order finished successfully"),
        "orderHasBeenCanceled":
            MessageLookupByLibrary.simpleMessage("Order has been canceled"),
        "orderIsCanceled":
            MessageLookupByLibrary.simpleMessage("Order has been canceled"),
        "orderNotCompletedMessage": MessageLookupByLibrary.simpleMessage(
            "The order payment process has not been completed and will be deleted after a few minutes"),
        "orderSavedToGallery":
            MessageLookupByLibrary.simpleMessage("Order saved to gallery"),
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "passengersNames":
            MessageLookupByLibrary.simpleMessage("Passengers info"),
        "passsengersInfo":
            MessageLookupByLibrary.simpleMessage("Passengers details"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully"),
        "passwordUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Password updated successfully"),
        "passwordsDoesNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords does not match"),
        "payAtCenter": MessageLookupByLibrary.simpleMessage("Pay at center"),
        "payFromMyBalance":
            MessageLookupByLibrary.simpleMessage("Pay from wallet"),
        "payedAmount": m2,
        "payedInCenter":
            MessageLookupByLibrary.simpleMessage("Payed in company center"),
        "payedWithValue": m3,
        "paymentStatus": MessageLookupByLibrary.simpleMessage("Payment status"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
        "phoneNumberChangesSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Phone number changes successfully"),
        "phoneShouldStartWith09":
            MessageLookupByLibrary.simpleMessage("Phone should start with 09"),
        "placeOfResidence":
            MessageLookupByLibrary.simpleMessage("Place of residence"),
        "pleaseSelectCity":
            MessageLookupByLibrary.simpleMessage("Please select city"),
        "pleaseSelectCountry":
            MessageLookupByLibrary.simpleMessage("Please select country"),
        "previewVehicle":
            MessageLookupByLibrary.simpleMessage("Preview vehicle"),
        "previousTrips": MessageLookupByLibrary.simpleMessage("Previous trips"),
        "requiredPayment": m4,
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
        "reservationHolder":
            MessageLookupByLibrary.simpleMessage("اسم صاحب الحجز"),
        "reservations": MessageLookupByLibrary.simpleMessage("Reservations"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
        "saveToDevice": MessageLookupByLibrary.simpleMessage("Save to device"),
        "seatNumber": MessageLookupByLibrary.simpleMessage("Seat number"),
        "seatsCount": MessageLookupByLibrary.simpleMessage("Seats count"),
        "selectPreferredLanguage":
            MessageLookupByLibrary.simpleMessage("Select preferred language"),
        "selectedSeats": MessageLookupByLibrary.simpleMessage("Selected seats"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "signup": MessageLookupByLibrary.simpleMessage("Signup"),
        "sorryThereAreNoEntityYet": m5,
        "source": MessageLookupByLibrary.simpleMessage("From"),
        "startFrom": MessageLookupByLibrary.simpleMessage("Start from"),
        "syriatelCash": MessageLookupByLibrary.simpleMessage("Syriatel cash"),
        "thisSeatIsNotAvailable":
            MessageLookupByLibrary.simpleMessage("This seat is not available"),
        "tickets": MessageLookupByLibrary.simpleMessage("Tickets"),
        "to": MessageLookupByLibrary.simpleMessage("to"),
        "transportationEntities":
            MessageLookupByLibrary.simpleMessage("Companies"),
        "transportationType":
            MessageLookupByLibrary.simpleMessage("Vehicle type"),
        "travelDate": MessageLookupByLibrary.simpleMessage("Travel date"),
        "travelDateTime": MessageLookupByLibrary.simpleMessage("Trip date"),
        "travelDuration":
            MessageLookupByLibrary.simpleMessage("Travel duration"),
        "tripDetails": MessageLookupByLibrary.simpleMessage("Trip details"),
        "tripTime": MessageLookupByLibrary.simpleMessage("Trip time"),
        "trips": MessageLookupByLibrary.simpleMessage("Trips"),
        "tripsCount": MessageLookupByLibrary.simpleMessage("Trips count"),
        "upcomingTrips": MessageLookupByLibrary.simpleMessage("Upcoming trips"),
        "vehicleNumber": MessageLookupByLibrary.simpleMessage("Vehicle number"),
        "verificationCode":
            MessageLookupByLibrary.simpleMessage("Verification code"),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "voucherCode": MessageLookupByLibrary.simpleMessage("Voucher code"),
        "voucherShouldBeRequested":
            MessageLookupByLibrary.simpleMessage("Coupon should be requested"),
        "waitingPaymentInCompanyCenter": MessageLookupByLibrary.simpleMessage(
            "Waiting for payment in company center"),
        "welcomeToLweenApp":
            MessageLookupByLibrary.simpleMessage("Welcome to Lween app"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
        "youHaveDiscount": m6,
        "youHaveNoFavoriteCompanies": MessageLookupByLibrary.simpleMessage(
            "You do not have any companies in your favorites list!"),
        "youHaveNoPreviousReservations": MessageLookupByLibrary.simpleMessage(
            "You have no previous reservations"),
        "youMustHaveCashAccount": MessageLookupByLibrary.simpleMessage(
            "You must have a cash account with the service provider you want to pay through")
      };
}
