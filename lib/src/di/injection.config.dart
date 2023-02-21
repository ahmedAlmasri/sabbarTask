// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sabbar_task/src/di/app_module.dart' as _i5;
import 'package:sabbar_task/src/feature/main/presentation/bloc/main_bloc.dart'
    as _i4;
import 'package:sabbar_task/src/routes/router.gr.dart' as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AppRouter>(() => appModule.getAppRouter());
    gh.factory<_i4.MainBloc>(() => _i4.MainBloc());
    return this;
  }
}

class _$AppModule extends _i5.AppModule {}
