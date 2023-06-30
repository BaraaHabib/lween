// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/widgets/waiting_widget.dart';

import '../../main.dart';
import '../configurations/assets.dart';

const overlayDuration = Duration(milliseconds: 300);

class LoadingOverlay extends ChangeNotifier {
  BuildContext _context;
  LoadingOverlay(this._context);

  bool isShown = false;
  bool _loadingNotifier = true;

  // Function? whenDone;

  bool get loadingNotifier => _loadingNotifier;

  set loadingNotifier(bool value) {
    _loadingNotifier = value;
    notifyListeners();
  }

  factory LoadingOverlay.of(BuildContext context) {
    return Provider.of<LoadingOverlay>(Lween.navigatorKey.currentContext!,
        listen: false)
      .._context = Lween.navigatorKey.currentContext!;
  }

  void show() async {
    if (!isShown) {
      isShown = true;
      showDialog(
        context: NavigationService.of(_context).context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        // barrierColor: Colors.white.withAlpha(50),
        builder: (BuildContext context) => const FullScreenLoader(),
      ).then((value) {
        isShown = false;
      });
      loadingNotifier = true;
    }
  }

  Future<void> hide({bool success = true}) async {
    return await Future.sync(() async {
      if (isShown) {
        if (loadingNotifier) {
          isShown = false;
          if (!success) {
            Navigator.of(NavigationService.of(_context).context).pop();
            await Future.delayed(const Duration(milliseconds: 100));
            loadingNotifier = false;
          } else {
            loadingNotifier = false;
            return Future.delayed(
              const Duration(seconds: 1),
              () {
                FocusManager.instance.primaryFocus?.unfocus();
                return Navigator.of(NavigationService.of(_context).context)
                    .pop();
              },
            );
          }
          isShown = false;
        }
      }
    });
  }
}

@RoutePage()
class FullScreenLoader extends StatefulWidget {
  const FullScreenLoader({super.key});

  @override
  State<FullScreenLoader> createState() => _FullScreenLoaderState();
}

class _FullScreenLoaderState extends State<FullScreenLoader> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.7),
          gradient: const LinearGradient(
            colors: [
              Color(0x00CBCBCB),
              Color(0xFFCBCBCB),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0,  1],
          ),
        ),
        child: Consumer<LoadingOverlay>(
          builder: (ctx, val, c) =>
          val.loadingNotifier ? loadingStart : loadingDone(),
        ),
      ),
    );
  }

  Widget get loadingStart =>
      Stack(
        children: [
          Center(
            child: Container(
              height: 120.hx,
              width: 120.hx,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(120.hx),
                  ),
              ),
            ),
          ),
          const Center(child: WaitingWidget(),),
        ],
      );

  Widget loadingDone([Function? done]) => TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.05, end: 0.95),
      duration: overlayDuration,
      builder: (ctx, double? value, c) => Center(
            child: Transform.scale(
              alignment: Alignment.center,
              scale: value,
              child: Image.asset(
                Assets.logoPNG,
              ),
            ),
          )
      // SvgPicture.asset(
      //   Assets.loader2SVG,
      // ),
      );
}
