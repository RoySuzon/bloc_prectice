import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();
  Future<XFile?> cameraCapture() async => await imagePicker.pickImage(source: ImageSource.camera);
  Future<XFile?> pickImageFromGallary() async => await imagePicker.pickImage(source: ImageSource.gallery );
}
