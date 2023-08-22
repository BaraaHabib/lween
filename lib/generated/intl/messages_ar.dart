// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(city1, city2, company, date, X, price) =>
      "هل تريد تأكيد ارسال طلب حجز من ${city1} الى ${city2} ضمن ${company} بتاريخ ${date} ل ${X} مسافر وبتكلفة ${price} ليرة سورية؟";

  static String m1(count) =>
      "بسبب حجز ${count} مقعد فإنه لن تتمكن من جدولة طلبك دون دفعه مباشرة من التطبيق عبر وسائل الدفع الإلكتروني المتوفرة.";

  static String m2(value) => "المبلغ المدفوع ${value}";

  static String m3(value) => "payed with ${value}";

  static String m4(value) => "المبلغ المترتب ${value}";

  static String m5(entity) => "عذراً لايوجد ${entity} بعد";

  static String m6(value) => "لديك حسم بقيمة ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "YouCanViewOrReserveSeats": MessageLookupByLibrary.simpleMessage(
            "يمكنك معاينة باص الرحلة, أو حجز المقاعد مباشرة"),
        "accountSettings":
            MessageLookupByLibrary.simpleMessage("إعدادات الحساب"),
        "apply": MessageLookupByLibrary.simpleMessage("تطبيق"),
        "areYouSureYouWantToCancelOrder": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد من إلغاء الطلب؟"),
        "arriveTo": MessageLookupByLibrary.simpleMessage("الوصول إلى"),
        "availableDateTravels": MessageLookupByLibrary.simpleMessage(
            "الرحلات المتوفرة في التاريخ المطلوب"),
        "availableDays":
            MessageLookupByLibrary.simpleMessage("الأيام المتوفرة"),
        "bemoBank": MessageLookupByLibrary.simpleMessage("بنك بيمو"),
        "bookATrip": MessageLookupByLibrary.simpleMessage("حجز رحلة"),
        "bookingStatus": MessageLookupByLibrary.simpleMessage("حالة الحجز"),
        "browseCompanies":
            MessageLookupByLibrary.simpleMessage("استعرض الشركات"),
        "camera": MessageLookupByLibrary.simpleMessage("الكاميرا"),
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "cancelOrder": MessageLookupByLibrary.simpleMessage("إلغاء الطلب"),
        "cashMobile": MessageLookupByLibrary.simpleMessage("كاش موبايل"),
        "cashMtn": MessageLookupByLibrary.simpleMessage("كاش MTN"),
        "cashPaymentNotAvailable": MessageLookupByLibrary.simpleMessage(
            "لقد تم تجاوز عدد المقاعد المسموح حجزها بدون دفع"),
        "centersCount": MessageLookupByLibrary.simpleMessage("عدد الفروع"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "changePhoneNumber":
            MessageLookupByLibrary.simpleMessage("تغيير رقم الهاتف"),
        "choosePaymentMethod":
            MessageLookupByLibrary.simpleMessage("اختر وسيلة الدفع"),
        "chooseSeats": MessageLookupByLibrary.simpleMessage("حجز مقعد"),
        "city": MessageLookupByLibrary.simpleMessage("المدينة"),
        "city1City2DateXPrice": m0,
        "codeWasResentToYourNumber":
            MessageLookupByLibrary.simpleMessage("تم إعادة إرسال رمز التحقق"),
        "company": MessageLookupByLibrary.simpleMessage("شركة النقل"),
        "companyInfo": MessageLookupByLibrary.simpleMessage("معلومات الشركة"),
        "companyName": MessageLookupByLibrary.simpleMessage("اسم الشركة"),
        "confirmAccount": MessageLookupByLibrary.simpleMessage("تأكيد الحساب"),
        "confirmOperation":
            MessageLookupByLibrary.simpleMessage("تأكيد العملية"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "country": MessageLookupByLibrary.simpleMessage("البلد"),
        "currency": MessageLookupByLibrary.simpleMessage("ل.س"),
        "currentBalance": MessageLookupByLibrary.simpleMessage("رصيدك الحالي"),
        "date": MessageLookupByLibrary.simpleMessage("تاريخ"),
        "deactivateAccount":
            MessageLookupByLibrary.simpleMessage("تعطيل الحساب"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
        "description": MessageLookupByLibrary.simpleMessage("المعلومات"),
        "destination": MessageLookupByLibrary.simpleMessage("الوجهة"),
        "eCash": MessageLookupByLibrary.simpleMessage("إي كاش"),
        "editProfile": MessageLookupByLibrary.simpleMessage("تعديل الحساب"),
        "enter": MessageLookupByLibrary.simpleMessage("دخول"),
        "enterFullNameForSeats": MessageLookupByLibrary.simpleMessage(
            "قم بإدخال الأسماء الثلاثية للمسافرين في المقاعد المحجوزة"),
        "enterPhoneNumber":
            MessageLookupByLibrary.simpleMessage("أدخل رقم الهاتف"),
        "enterPhoneToSendCode": MessageLookupByLibrary.simpleMessage(
            "أدخل رقم الهاتف الذي استخدمته لإنشاء الحساب. سنقوم بإرسال رمز تحقق لك لإعادة ضبط كلمة المرور الخاصة بك"),
        "enterVerificationCode":
            MessageLookupByLibrary.simpleMessage("أدخل رمز التحقق"),
        "enterVoucherCode": MessageLookupByLibrary.simpleMessage(
            "إن كنت تملك كود حسم أدخله لتحصل على حسم على سعر التذاكر"),
        "error": MessageLookupByLibrary.simpleMessage("خطأ"),
        "exceededSeatsCountDialogMessage": m1,
        "fatora": MessageLookupByLibrary.simpleMessage("فاتورة"),
        "favoriteCompanies":
            MessageLookupByLibrary.simpleMessage("شركات النقل المفضلة"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور؟"),
        "from": MessageLookupByLibrary.simpleMessage("من"),
        "fullName": MessageLookupByLibrary.simpleMessage("الاسم الثلاثي"),
        "gallery": MessageLookupByLibrary.simpleMessage("معرض الصور"),
        "helpAndSupport":
            MessageLookupByLibrary.simpleMessage("المساعدة والدعم"),
        "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "importantWarning": MessageLookupByLibrary.simpleMessage("ملاحظة هامة"),
        "informationUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تعديل المعلومات بنجاح"),
        "invalidphonenumber":
            MessageLookupByLibrary.simpleMessage("خطأ في رقم الهاتف"),
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "logIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "logOut": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "makeSureToEnterInformationAccuratly":
            MessageLookupByLibrary.simpleMessage(
                "تأكد من إدخال المعلومات بدقة لإتمام عملية إنشاء الحساب."),
        "myAccount": MessageLookupByLibrary.simpleMessage("حسابي"),
        "myReservations":
            MessageLookupByLibrary.simpleMessage("حجوزاتي / رحلاتي"),
        "myTickets": MessageLookupByLibrary.simpleMessage("تذاكري"),
        "myTrips": MessageLookupByLibrary.simpleMessage("تذاكري"),
        "newRequiredPayment":
            MessageLookupByLibrary.simpleMessage("قيمة الحجز بعد الخصم"),
        "next": MessageLookupByLibrary.simpleMessage("التالي"),
        "no": MessageLookupByLibrary.simpleMessage("لا"),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("تأكد من الاتصال بالانترنت"),
        "noTripsAvailableForThisDate":
            MessageLookupByLibrary.simpleMessage("لا يوجد رحلات في هذا الموعد"),
        "notifications": MessageLookupByLibrary.simpleMessage("الاشعارات"),
        "ok": MessageLookupByLibrary.simpleMessage("موافق"),
        "orderDeletionWarning": MessageLookupByLibrary.simpleMessage(
            "في حال اختيار الدفع الالكتروني فيجب اكمال عملية الدفع خلال ١٠ دقائق على الاكثر.."),
        "orderDetails": MessageLookupByLibrary.simpleMessage("تفاصيل التذكرة"),
        "orderFinishedSuccessfully":
            MessageLookupByLibrary.simpleMessage("اكتملت عملية الحجز بنجاح"),
        "orderHasBeenCanceled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء الطلب"),
        "orderIsCanceled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء الطلب"),
        "orderNotCompletedMessage": MessageLookupByLibrary.simpleMessage(
            "لم يتم اكمال عملية دفع الطلب الكترونيا وسيتم حذفه بعد عدة دقائق"),
        "orderSavedToGallery": MessageLookupByLibrary.simpleMessage(
            "تم حفظ الطلب في ملفات الجهاز"),
        "orders": MessageLookupByLibrary.simpleMessage("طلبات"),
        "passengersNames":
            MessageLookupByLibrary.simpleMessage("معلومات الركاب"),
        "passsengersInfo":
            MessageLookupByLibrary.simpleMessage("معلومات الركاب"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تغيير كلمة المرور بنجاح"),
        "passwordsDoesNotMatch":
            MessageLookupByLibrary.simpleMessage("كلمة المرور غير مطابقة"),
        "payAtCenter": MessageLookupByLibrary.simpleMessage("دفع في المكتب"),
        "payedAmount": m2,
        "payedInCenter":
            MessageLookupByLibrary.simpleMessage("تم الدفع ضمن المركز"),
        "payedWithValue": m3,
        "paymentStatus": MessageLookupByLibrary.simpleMessage("حالة الدفع"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "phoneShouldStartWith09":
            MessageLookupByLibrary.simpleMessage("يجب أن يبدأ رقم الهاتف ب 09"),
        "placeOfResidence":
            MessageLookupByLibrary.simpleMessage("مكان الإقامة"),
        "pleaseSelectCity":
            MessageLookupByLibrary.simpleMessage("يرجى اختيار المدينة"),
        "pleaseSelectCountry":
            MessageLookupByLibrary.simpleMessage("يرجى اختيار البلد"),
        "previewVehicle":
            MessageLookupByLibrary.simpleMessage("معاينة المركبة"),
        "previousTrips": MessageLookupByLibrary.simpleMessage("رحلاتك السابقة"),
        "requiredPayment": m4,
        "resendCode": MessageLookupByLibrary.simpleMessage("إعادة إرسال الرمز"),
        "reservationHolder":
            MessageLookupByLibrary.simpleMessage("اسم صاحب الحجز"),
        "reservations": MessageLookupByLibrary.simpleMessage("حجوزات"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("استعادة كلمة المرور"),
        "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
        "saveToDevice":
            MessageLookupByLibrary.simpleMessage("حفظ إلى ملفات الجهاز"),
        "seatNumber": MessageLookupByLibrary.simpleMessage("رقم المقعد"),
        "seatsCount": MessageLookupByLibrary.simpleMessage("عدد المقاعد"),
        "selectPreferredLanguage":
            MessageLookupByLibrary.simpleMessage("اختر اللغة المفضلة"),
        "selectedSeats":
            MessageLookupByLibrary.simpleMessage("المقاعد المحجوزة"),
        "send": MessageLookupByLibrary.simpleMessage("إرسال"),
        "signup": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
        "sorryThereAreNoEntityYet": m5,
        "source": MessageLookupByLibrary.simpleMessage("الانطلاق"),
        "startFrom": MessageLookupByLibrary.simpleMessage("الانطلاق من"),
        "syriatelCash": MessageLookupByLibrary.simpleMessage("سيريتيل كاش"),
        "thisSeatIsNotAvailable":
            MessageLookupByLibrary.simpleMessage("هذا المقعد غير متوفر"),
        "tickets": MessageLookupByLibrary.simpleMessage("تذاكر"),
        "to": MessageLookupByLibrary.simpleMessage("إلى"),
        "transportationEntities":
            MessageLookupByLibrary.simpleMessage("شركات النقل"),
        "transportationType":
            MessageLookupByLibrary.simpleMessage("وسيلة النقل"),
        "travelDate": MessageLookupByLibrary.simpleMessage("تاريخ الرحلة"),
        "travelDateTime": MessageLookupByLibrary.simpleMessage("موعد الرحلة"),
        "travelDuration": MessageLookupByLibrary.simpleMessage("مدة الرحلة"),
        "tripDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الرحلة"),
        "tripTime": MessageLookupByLibrary.simpleMessage("وقت الرحلة"),
        "trips": MessageLookupByLibrary.simpleMessage("الرحلات"),
        "tripsCount": MessageLookupByLibrary.simpleMessage("عدد الرحلات"),
        "vehicleNumber": MessageLookupByLibrary.simpleMessage("رقم الباص"),
        "verificationCode": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
        "verify": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "voucherCode": MessageLookupByLibrary.simpleMessage("كود الحسم"),
        "voucherShouldBeRequested":
            MessageLookupByLibrary.simpleMessage("يجب إعادة طلب الكوبون"),
        "waitingPaymentInCompanyCenter": MessageLookupByLibrary.simpleMessage(
            "بانتظار الدفع ضمن مركز الشركة"),
        "welcomeToLweenApp":
            MessageLookupByLibrary.simpleMessage("أهلاً بك في تطبيق لوين"),
        "yes": MessageLookupByLibrary.simpleMessage("نعم"),
        "yesterday": MessageLookupByLibrary.simpleMessage("البارحة"),
        "youHaveDiscount": m6,
        "youHaveNoPreviousReservations":
            MessageLookupByLibrary.simpleMessage("لا يوجد لديك حجوزات سابقة!"),
        "youMustHaveCashAccount": MessageLookupByLibrary.simpleMessage(
            "يجب أن يكون لديك حساب كاش لدى مزود الخدمة الذي تريد الدفع من خلاله")
      };
}
