import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as image_lib;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:drscanner_ai/view/home/controller/home_controller.dart';
import '../../result/view/process_result_view.dart';

class ProcessController extends GetxController {
  XFile? xFileImage;
  HomeController homeController = Get.find();
  late Interpreter _interpreter;
  late Tensor _inputTensor;
  late Tensor _outputTensor;

  List<String> labels = [];
  late List<dynamic> output;
  @override
  Future<void> onInit() async {
    Get.put(HomeController());
    xFileImage = homeController.xFileImage;
    await loadModel();
    await classifyImage();
    navigateToPage();
    super.onInit();
  }

  navigateToPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(const ProcessResultView());
    });
  }

  String? result;

  Future<void> loadModel() async {
    try {
      final options = InterpreterOptions();

      // Use XNNPACK Delegate
      if (Platform.isAndroid) {
        options.addDelegate(XNNPackDelegate());
      }

      // Use GPU Delegate
      // doesn't work on emulator
      // if (Platform.isAndroid) {
      //   options.addDelegate(GpuDelegateV2());
      // }

      // Use Metal Delegate
      if (Platform.isIOS) {
        options.addDelegate(GpuDelegate());
      }

      // Load model from assets
      _interpreter = await Interpreter.fromAsset("assets/tflite/dr.tflite",
          options: options);
      // Get tensor input shape [1, 224, 224, 3]
      _inputTensor = _interpreter.getInputTensors().first;
      // Get tensor output shape [1, 1001]
      _outputTensor = _interpreter.getOutputTensors().first;
      final labelTxt = await rootBundle.loadString("assets/tflite/labels.txt");
      labels.clear();
      labels.addAll(labelTxt.split('\n'));

      print('load model success');
    } catch (e) {
      print('Error loading model: $e');
    }
    update();
  }

  Future<void> classifyImage() async {
    await loadModel();

    final imageData = File(xFileImage!.path).readAsBytesSync();
    final image = image_lib.decodeImage(imageData);
    print(' here');
    // resize original image to match model shape.

    print(_inputTensor.shape);
    print(_outputTensor.shape);

    image_lib.Image imageInput = image_lib.copyResize(
      image!,
      width: _inputTensor.shape[1],
      height: _inputTensor.shape[2],
    );
    // final image = ImageProcessorBuilder()
    //     .add(ResizeOp(
    //         224,
    //         224,
    //         ResizeMethod
    //             .BILINEAR)) // Modify this to your desired image dimensions
    //     .build()
    //     .process(TensorImage.fromFile(File(xFileImage!.path)));
    print(' here 2');
    final imageMatrix = List.generate(
      imageInput.height,
      (y) => List.generate(
        imageInput.width,
        (x) {
          final pixel = imageInput.getPixel(x, y);
          return [pixel.r, pixel.g, pixel.b];
        },
      ),
    );

    // Set tensor input [1, 224, 224, 3]
    final input = [imageMatrix];
    // Set tensor output [1, 1001]
    final op = [List<double>.filled(_outputTensor.shape[1], 0.0)];
    print(' here 3');
    Interpreter interpreter = Interpreter.fromAddress(_interpreter.address);

    interpreter.run(input, op);

    print(' here 4');
    // Get first output tensor
    final result = op.first;
    double maxScore = result.reduce((a, b) => a + b);
    // Set classification map {label: points}
    var classification = <String, double>{};

    print('success till here');
    for (var i = 0; i < result.length; i++) {
      if (result[i] != 0) {
        // Set label: points
        classification[labels[i]] = result[i].toDouble() / maxScore.toDouble();
      }
    }
    print(classification);
    // Convert to a list of maps and sort by confidence
    output = classification.entries
        .map((e) => {
              "index": int.parse(e.key.split(' ')[
                  0]), // Assuming your label is in the format "index label"
              "confidence":
                  (e.value / maxScore), // Normalize the confidence if needed
            })
        .toList();

    // Sort by confidence in descending order
    output.sort((a, b) => b["confidence"].compareTo(a["confidence"]));
    update();
  }
}
