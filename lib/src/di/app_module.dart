import 'package:injectable/injectable.dart';
import 'package:sabbar_task/src/routes/router.gr.dart';

@module
abstract class AppModule {
  @injectable
  AppRouter getAppRouter() => AppRouter();
}
