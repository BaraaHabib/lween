import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
 class AppDropDownField extends  HookWidget {
   final List<DropdownItemDataModel> data;
   final DropdownItemDataModel? initValue;
   final Function(DropdownItemDataModel?) onChange;
   final String? Function(DropdownItemDataModel? value)? validator;
   final String hintText;
   final String name;
   final EdgeInsets? contentPadding;
   final GlobalKey<FormBuilderFieldState>? dropDownKey;

   const AppDropDownField({Key? key,
     this.dropDownKey,
     this.initValue,
     required this.onChange,
     required this.name,
     this.validator,
     required this.hintText,
     this.contentPadding,
     required this.data,
   }) : super(key: key);

   @override
   Widget build(BuildContext context) {
     var selectedValue = useState<DropdownItemDataModel?>(initValue);
     DropdownItemDataModel? mInitValue;
     // if(hintText.isNotEmpty && initValue == null && selectedValue.value == null){
     //   mInitValue  = DropdownItemDataModel(name: hintText, id: -1);
     // }
     useEffect(() {
       if (initValue != null) {
         for (var element in data) {
           if (element.id == initValue?.id) {
             mInitValue = element;
           }
         }
       }
       return null;
     });
     return Column(
       children: [
         ClipRRect(
           borderRadius: Styles.textFieldBorderRadius,
           child: AnimatedSize(
             duration: 300.milliseconds,
             child: Container(
               decoration:  BoxDecoration(
                   color:  Styles.textFieldColor(context),
                   border: Border.all(color: Styles.textFieldColor(context),)
               ),
               child: FormBuilderDropdown<DropdownItemDataModel>(
                 name: name,
                 borderRadius: BorderRadius.circular(28.0.rx),
                 alignment: AlignmentDirectional.center,
                key: dropDownKey,
                 items: data.map((DropdownItemDataModel value) {
                   return DropdownMenuItem<DropdownItemDataModel>(
                     value: value,
                     alignment: AlignmentDirectional.center,
                     child: FittedBox(
                       fit: BoxFit.scaleDown,
                       child: Text(
                         value.name,
                         maxLines: 2,
                         style: Theme
                             .of(context)
                             .textTheme
                             .titleMedium?.copyWith(
                             fontSize: 14.spx,
                              color: Styles.dropDownFontLightColor,
                         ),
                       ),
                     ),
                   );
                 }).toList(),
                 onChanged: (newS) {
                   onChange(newS);
                   dropDownKey?.currentState?.validate();
                   // selectedValue.value = newS;
                 },
                 isExpanded: true,
                 validator: validator,
                 icon: Padding(
                   padding: EdgeInsetsDirectional.only(end: 5.wx),
                   child: const Icon(
                     Icons.arrow_drop_down_outlined,
                     size: 25,
                   ),
                 ),
                 enableFeedback: true,
                 initialValue: mInitValue,
                 decoration: InputDecoration(
                     filled: true,
                     contentPadding: contentPadding,
                     // hintText: hintText,
                 ),
                 selectedItemBuilder: (context) => data.map((DropdownItemDataModel value) {
                   return FittedBox(
                     fit: BoxFit.scaleDown,
                     child: Text(
                       value.name,
                       maxLines: 2,
                       style: Theme
                           .of(context)
                           .textTheme
                           .titleMedium?.copyWith(
                         fontSize: 14.spx,
                         color: Styles.dropDownFontColor(context),
                       ),
                     ),
                   );
                 }).toList(),
                 onSaved: (newValue) {
                   selectedValue.value = newValue;
                   onChange(newValue);
                 },
               ),
             ),
           ),
         ),
       ],
     );
   }
 }

class DropdownItemDataModel extends Equatable {
  const DropdownItemDataModel({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  List<Object?> get props =>
      [
        id,
      ];
 }
