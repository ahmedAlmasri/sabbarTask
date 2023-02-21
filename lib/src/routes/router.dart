import 'package:auto_route/auto_route.dart';
import 'package:sabbar_task/src/feature/main/presentation/widget/main_page.dart';

@MaterialAutoRouter(
  preferRelativeImports: false,
  routes: <AutoRoute>[
    AutoRoute(
      path: 'main',
      page: MainPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
