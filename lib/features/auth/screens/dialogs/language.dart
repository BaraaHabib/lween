


import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';
import 'package:provider/provider.dart';

class LanguageDialog extends HookWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = useState(sl<LocaleProvider>().locale.languageCode,);
    final appState = Provider
        .of<AppStateModel>(context, listen: false);
    return  SizedBox(
      width: 0.7.sw,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(S.current.selectPreferredLanguage,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Styles.lightFontColor,
                ),
              ),
              SizedBox.square(
                dimension: 30,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: appState.toggleTheme,
                  child: Icon(appState.isLightTheme ? Icons.sunny : Icons.sunny_snowing,),
                ),
              ),
            ],
          ),
          ...sl<LocaleProvider>()
              .languages
              .map((e) => _LanguageWidget(e,selectedLanguage),)
              .toList(),
          20.vSpace,
          AppGradientTextButton(
            gradientType: AppTextButtonGradientType.primary,
            onTap: () {
              sl<LocaleProvider>().initLanguageSelected = true;
              Provider.of<LocaleProvider>(context,listen: false)
                  .changeLanguageWithoutRestart(Locale(selectedLanguage.value),).then((value) {
                if(value){
                  NavigationService.of(context).restart();
                }
              });
              NavigationService.of(context).pop();
            },
            content: S
                .of(context)
                .ok,
          )
        ],
      ),
    );
  }
}

class _LanguageWidget extends StatelessWidget{

  const _LanguageWidget(this.language, this.selectedLanguage,);

  final LanguageItem language;
  final ValueNotifier<String> selectedLanguage;


  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: (){
        _changeSelection(language,context,);
      },
      child: Row(
        children: [
          Radio(
            value: language.code,
            groupValue: selectedLanguage.value,
            onChanged: (r){
              _changeSelection(language,context,);

            },
          ),
          Text(language.name,),
          const Spacer(),
          SizedBox.square(
            dimension: 30.rx,
            child: AppImage(
                path: language.icon,
                type: ImageType.asset,
            ),
          )
        ],
      ),
    );
  }

  _changeSelection(LanguageItem language,context){
    selectedLanguage.value = language.code;
  }
}
