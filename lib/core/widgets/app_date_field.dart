import 'package:flutter/cupertino.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/generated/l10n.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker {
  static Future<DateTime?> showCustomDatePicker(BuildContext context,
      DateTime? initialDate,
      [int? futureAllowedSchedulingDays,]
      ) {
    return showCupertinoDialog(
      context: context,
      builder: (c) {
        final fontColor = context.textTheme.titleMedium
            ?.color;
        final textStyle = TextStyle(
          color: fontColor,
        );
        final disabledTextStyle = TextStyle(
          color: context.textTheme.headlineLarge?.color,
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              SfDateRangePickerTheme(
                data: SfDateRangePickerThemeData(
                  cellTextStyle: textStyle,
                  activeDatesTextStyle: textStyle,
                  blackoutDatesTextStyle: disabledTextStyle,
                  disabledCellTextStyle: disabledTextStyle,
                  disabledDatesTextStyle: disabledTextStyle,
                  selectionColor: Styles.selectedNavItemBackgroundColor,
                  todayHighlightColor: context.textTheme.titleMedium?.color,
                ),
                child: SfDateRangePicker(
                  backgroundColor: context.theme.cardTheme.color,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: textStyle.copyWith(fontSize: 11.spx,),
                    ),
                  ),
                  minDate: DateTime.now(),
                  headerStyle: DateRangePickerHeaderStyle(textStyle: textStyle,),
                  selectionTextStyle: textStyle.copyWith(
                    color: context.theme.cardTheme.color,),
                  selectionColor: Styles.selectedNavItemBackgroundColor,
                  selectionMode: DateRangePickerSelectionMode
                      .single,
                  onSelectionChanged: (v) {
                    if (v is DateTime) {

                    }
                  },
                  initialDisplayDate: initialDate,
                  initialSelectedDate: initialDate,
                  showActionButtons: true,
                  maxDate: futureAllowedSchedulingDays == null ? null : Jiffy.now().add(days: futureAllowedSchedulingDays ?? 0).dateTime,
                  onCancel: () {
                    Navigator.of(context, rootNavigator: true,).pop();
                  },
                  onSubmit: (date) {
                    Navigator.of(context, rootNavigator: true,).pop(date);
                  },
                  cancelText: S.of(context).cancel,
                  confirmText: S.current.ok,
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}