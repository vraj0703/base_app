/// Loads bitmap assets into memory that may be required later
class AppBitmaps {
  //static late final BitmapDescriptor mapMarker;

  static Future<void> init() async {
    // mapMarker = await BitmapDescriptor.asset(
    //   ImageConfiguration(devicePixelRatio: PlatformInfo.pixelRatio),
    //   '${ImagePaths.common}/location-pin.png',
    // );
  }
}

/// Consolidates raster image paths used across the app
class ImagePaths {
  static String root = 'assets/images';
  static String common = 'assets/images/_common';

  static String collectibles = '$root/collectibles';
  static String textures = '$common/texture';
  static String icons = '$common/icons';

  static String appLogo = '$common/app-logo.png';
  static String appLogoPlain = '$common/app-logo-plain.png';
}

/// Consolidates SCG image paths in their own class, hints to the UI to use an SvgPicture to render
class SvgPaths {
  // static String imageName = '${ImagePaths.common}/image_name.svg';
}
