import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing_project/bloc/image_picker/image_picker_event.dart';
import 'package:testing_project/bloc/image_picker/image_picker_state.dart';
import 'package:testing_project/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<ImagePickWithGallary>(_gallaryPicker);
  }
  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(nid: file));
  }

  void _gallaryPicker(ImagePickWithGallary event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallary();
    emit(state.copyWith(nid: file));
  }
}
