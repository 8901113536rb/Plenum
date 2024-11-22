import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/stringconstants.dart';

class CommonImageWidget extends StatelessWidget {
  final ImageSourceType imageSourceType;
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  CommonImageWidget({
    required this.imageSourceType,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.none,
    this.borderRadius = BorderRadius.zero,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget image;
    switch (imageSourceType) {
      case ImageSourceType.network:
        image = Image.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, child, progress) {
            if (progress == null) {
              return child;
            } else {
              return placeholder ?? Center(child: CircularProgressIndicator());
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ?? Center(child: Icon(Icons.error));
          },
        );
        break;
      case ImageSourceType.asset:
        image = Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ?? Center(child: Icon(Icons.error));
          },
        );
        break;
        case ImageSourceType.svg:
        image = SvgPicture.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
        );
        break;
      case ImageSourceType.file:
        image = Image.file(
          File(imageUrl),
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ?? Center(child: Icon(Icons.error));
          },
        );
        break;
        case ImageSourceType.cached_image:
        image = CachedNetworkImage(
          height: height,
          width:width,
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: fit,),
            ),
          ),
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("${images_baseurl}placeholder-image.jpeg",),fit: BoxFit.fill
                )
              ),
             ),
        );
        break;
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: image,
    );
  }
}

enum ImageSourceType {
  network,
  asset,
  file,
  svg,
  cached_image
}

Future<void> pickImageFromGallery(picker,image) async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    image = File(pickedFile.path);
  }
}

Future<void> pickImageFromCamera(picker,image) async {
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    image = File(pickedFile.path);
  }
}