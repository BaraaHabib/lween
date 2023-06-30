import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/injection_container.dart';

class Controller {
  bool isPermanent;
  bool initialized = false;

  Controller([
    this.isPermanent = false,
  ]);

  @protected
  @mustCallSuper
  void init() {
    initialized = true;
  }

  @protected
  @mustCallSuper
  void dispose() {}

  static T get<T extends Controller>({
    T? instance,
    String? key,
    bool permanent = false,
  }) {
    T? controller;
    if (sl.isRegistered<T>(instanceName: key)) {
      controller = sl<T>(
        instanceName: key,
      );
    } else {
      if (instance != null) {
        instance.isPermanent = permanent;
        sl.registerSingleton<T>(
          instance,
          instanceName: key,
        );
        controller = sl<T>(
          instanceName: key,
        );
      } else {
        throw Exception(
            '$T Instance ${(key != null) ? 'with key $key' : ''} not registered');
      }
    }

    if (instance != null) {
      if (controller.isPermanent) {}
      useEffect(() {
        if (controller!.isPermanent && !controller.initialized) {
          AppLogger.log(
              '${controller.runtimeType} initialized ${(key != null) ? 'with key $key' : ''}');
          controller.init();
          return () async {
            // if(!permanent){
            if (controller!.isPermanent) {
              return;
            }
            controller.dispose();
            if (sl.isRegistered<T>(instanceName: key)) {
              await sl.unregister<T>(
                instanceName: key,
              );
            }
            // }
            AppLogger.log(
                '${controller.runtimeType} ${(key != null) ? 'with key $key' : ''} disposed');
          };
        } else if (!controller.isPermanent) {
          AppLogger.log(
              '${controller.runtimeType} initialized ${(key != null) ? 'with key $key' : ''}');
          controller.init();
          return () async {
            controller!.dispose();
            if (sl.isRegistered<T>(instanceName: key)) {
              await sl.unregister<T>(
                instanceName: key,
              );
            }
            // }
            AppLogger.log(
                '${controller.runtimeType} ${(key != null) ? 'with key $key' : ''} disposed');
          };
        }
        return () {};
      }, [
        controller,
        if (key != null) key,
      ]);
    }

    return controller;
  }
}
