// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EnableOrDisableEvent extends SwitchEvent {
  final bool isEnable;
  EnableOrDisableEvent({
    required this.isEnable,
  });

  @override
  List<Object> get props => [isEnable];
}

class SliderEvent extends SwitchEvent {
  final double slider;
  SliderEvent({
    required this.slider,
  });

  @override
  List<Object> get props => [slider];
}
