import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Load image from assets and decode', () async {
    try {
      final ByteData data = await rootBundle.load(
        'assets/images/idli_rice.jpg',
      );
      final Uint8List bytes = data.buffer.asUint8List();

      // Attempt to decode the image
      final decodedImage = img.decodeImage(bytes);

      if (decodedImage == null) {
        fail(
          'Failed to decode image from assets/images/idli_rice.jpg. Decoded image is null.',
        );
      }

      // If decoding is successful, print some image info
      print('Successfully loaded and decoded image:');
      print('  Width: ${decodedImage.width}');
      print('  Height: ${decodedImage.height}');
      print('  Format: ${decodedImage.format}');
    } catch (e) {
      fail('Error loading or decoding image: $e');
    }
  });
}
