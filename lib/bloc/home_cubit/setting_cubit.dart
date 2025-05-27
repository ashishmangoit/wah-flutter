import 'package:demo_app/bloc/home_cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/setting_repo.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository repository;

  SettingsCubit(this.repository) : super(SettingsInitial());

  Future<void> fetchSettings() async {
    try {
      emit(SettingsLoading());
      final data = await repository.fetchSettings();
      emit(SettingsLoaded(data));
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }
}
