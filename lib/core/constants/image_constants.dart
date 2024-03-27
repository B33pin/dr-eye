// ignore_for_file: library_private_types_in_public_api

class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._init();
  }

  ImageConstants._init();

  final _PNGPath pngPath = _PNGPath();
  final _SVGPath svgPath = _SVGPath();
  final _JPGPath jpgPath = _JPGPath();
}

class _PNGPath {
  final String examplePNG = 'examplePNG'.toPNG;
}

class _SVGPath {
  final String camera = 'camera'.toSVG;
  final String eye_btn = 'eye_btn'.toSVG;
  final String gallery = 'gallery'.toSVG;
  final String eye = 'eye'.toSVG;
  final String safety = 'safety'.toSVG;
  final String non = 'non'.toSVG;
  final String back = 'back'.toSVG;
  final String close = 'close'.toSVG;

//Bottom Navbar Icons
  final String blog = 'blog'.toSVG;
  final String info = 'info'.toSVG;
  final String settings = 'settings'.toSVG;
}

class _JPGPath {
  final String dummyImage = 'dummyImage'.toJPG;
}

extension ImagePath on String {
  String get toPNG => 'assets/images/$this.png';
  String get toSVG => 'assets/icons/$this.svg';
  String get toJPG => 'assets/images/$this.jpg';
}
