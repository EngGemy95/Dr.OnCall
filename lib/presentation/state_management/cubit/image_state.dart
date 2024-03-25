import 'package:image_picker/image_picker.dart';

abstract class ImageState {
  ImageState();
}

class ImageInitialState extends ImageState {
  ImageInitialState() : super();
}

class ImageLoadedState extends ImageState {
  final XFile imageFile;

  ImageLoadedState({required this.imageFile});
}

class ImageErrorState extends ImageState {
  final String errorMessage;

  ImageErrorState({required this.errorMessage});
}
