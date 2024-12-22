import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/bloc/switch/switch_event.dart';

import 'package:testing_project/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDisableEvent>(_enableOrDisableSwitch);
    on<SliderEvent>(_sliderDrag);
  }

  FutureOr<void> _enableOrDisableSwitch(
      EnableOrDisableEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitched: event.isEnable));
  }

  FutureOr<void> _sliderDrag(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
