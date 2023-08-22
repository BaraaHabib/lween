

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/generated/l10n.dart';

abstract class AppImagePicker {
  static Future<String?> pickImage(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Card(
            child: Container(
              width: 1.sw,
              constraints: BoxConstraints(
                maxWidth: 1.sw,
                minWidth: 1.sw,
                maxHeight: 0.13.sh + MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppGradientTextButton(
                          gradientType: AppTextButtonGradientType.primary,
                          onTap: () async {
                            ImagePicker()
                                .pickImage(source: ImageSource.camera,)
                                .then((file) {
                              Navigator.of(context,rootNavigator: true,).pop(file?.path);
                            });
                          },
                          content: (S
                              .of(context)
                              .camera),
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: AppGradientTextButton(
                          gradientType: AppTextButtonGradientType.secondary,
                          onTap: () async {
                            ImagePicker()
                                .pickImage(source: ImageSource.gallery,)
                            .then((file) {
                              Navigator.of(context,rootNavigator: true,).pop(file?.path);
                            });
                            // return await ImagePicker().pickImage(source: ImageSource.gallery,);
                          },
                          content: (S
                              .of(context)
                              .gallery),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}