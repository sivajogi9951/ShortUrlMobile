import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:typed_data';


class ImageRenderWidget extends ConsumerStatefulWidget {
  final String imageUrl;
  const ImageRenderWidget(this.imageUrl, {super.key});

  @override
  ConsumerState<ImageRenderWidget> createState() => _ImageRenderWidgetState();
}

class _ImageRenderWidgetState extends ConsumerState<ImageRenderWidget> {
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final bytes = await fetchBase64ImageWithDio(widget.imageUrl);
    if (bytes != null) {
      setState(() {
        imageBytes = bytes;
      });
    }
  }

  Future<Uint8List?> fetchBase64ImageWithDio(String url) async {
    Dio dio =Dio();
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        // If it's a JSON response with base64
        final String base64Str = data['image'];
        final String cleanedBase64 = base64Str.split(',').last;

        return base64Decode(cleanedBase64);
      } else {
        debugPrint('Failed to load image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Dio error: $e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return imageBytes != null
        ? Image.memory(imageBytes!)
        : const CircularProgressIndicator();
  }
}
