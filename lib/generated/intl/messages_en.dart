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

  static String m0(entity) => "Sorry, there are no ${entity} yet";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "confirmAccount":
            MessageLookupByLibrary.simpleMessage("Confirm Account"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "enterPhoneToSendCode": MessageLookupByLibrary.simpleMessage(
            "Enter the phone number you used to create the account. We will send you a verification code to reset your password"),
        "enterVerificationCode":
            MessageLookupByLibrary.simpleMessage("Enter verification code"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "fullName": MessageLookupByLibrary.simpleMessage("full name"),
        "invalidphonenumber":
            MessageLookupByLibrary.simpleMessage("invalidPhoneNumber"),
        "logIn": MessageLookupByLibrary.simpleMessage("log in"),
        "makeSureToEnterInformationAccuratly": MessageLookupByLibrary.simpleMessage(
            "Make sure to enter the information accurately to complete the account creation process."),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
        "placeOfResidence":
            MessageLookupByLibrary.simpleMessage("Place of residence"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "signup": MessageLookupByLibrary.simpleMessage("Signup"),
        "sorryThereAreNoEntityYet": m0,
        "verificationCode":
            MessageLookupByLibrary.simpleMessage("Verification code"),
        "welcomeToLweenApp":
            MessageLookupByLibrary.simpleMessage("Welcome to Lween app"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
