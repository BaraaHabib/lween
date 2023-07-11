import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/extended/numbers_ext.dart';
 class AppDropDownField extends  HookWidget {
   final List<DropdownItemDataModel> data;
   final DropdownItemDataModel? initValue;
   final Function(DropdownItemDataModel?) onChange;
   final String? Function(DropdownItemDataModel? value)? validator;
   final String hintText;
   final String name;

   const AppDropDownField({Key? key,
     this.initValue,
     required this.onChange,
     required this.name,
     required this.validator,
     required this.hintText,
     required this.data}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     var selectedValue = useState<DropdownItemDataModel?>(initValue);
     DropdownItemDataModel? mInitValue;
     useEffect(() {
       if (initValue != null) {
         for (var element in data) {
           if (element.name == initValue?.name) {
             mInitValue = element;
           }
         }
       }
       return null;
     });
     return FormBuilderDropdown<DropdownItemDataModel>(
       name: name,
       borderRadius: BorderRadius.circular(28.0.rx),
       alignment: AlignmentDirectional.center,
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
                   .headlineMedium?.copyWith(
                   fontSize: 14.spx,
               ),
             ),
           ),
         );
       }).toList(),
       onChanged: (newS) {
         // selectedValue.value = newS;
       },
       isExpanded: true,
       validator: validator,
       // selectedItemBuilder:  selectedValue.value == null ? null :
       //     (c) => [
       //       Container(
       //         color: Colors.red,
       //         child: Text(
       //         selectedValue.value!.name ?? '',
       //      textAlign: TextAlign.center,
       //      style: Theme.of(context).textTheme.titleSmall
       //            ?.copyWith(
       //            color: Colors.red,
       //            fontSize: 8.spx,
       //      ),
       //   ),
       //       ),
       // ],
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
           // contentPadding: EdgeInsetsDirectional.only(start: 0.wx,end: 0,top: 0,),
           hintText: hintText,
       ),
       onSaved: (newValue) {
         selectedValue.value = newValue;
         onChange(newValue);
       },
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