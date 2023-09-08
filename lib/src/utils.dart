class ImageDataBT {
  final int width;
  final int height;
  ImageDataBT({
    required this.width,
    required this.height,
  });
}

ImageDataBT toPixel(ImageDataBT image, {required int paperWidth, required int dpi, required bool isTspl}) {
  final double mmToInch = 0.036;

  int targetWidthPx = (paperWidth.toDouble() * dpi.toDouble() * mmToInch).toInt();
  final int nearest = 8;
  targetWidthPx = (targetWidthPx - (targetWidthPx % nearest)).round();
  final double widthRatio = targetWidthPx / image.width;

  int targetHeightPx = 0;
  if (isTspl) {
    targetHeightPx = (image.height.toDouble() * dpi.toDouble() * mmToInch).toInt();
  } else {
    targetHeightPx = (image.height * widthRatio).toInt();
  }
  return ImageDataBT(width: targetWidthPx, height: targetHeightPx);
}
