import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Dio2Screen extends StatefulWidget {
  const Dio2Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Dio2ScreenState();
  }
}

class Dio2ScreenState extends State<Dio2Screen> {

  final Dio dio = Dio();
  String imageUrl = "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png";
  late ImageProvider imageProvider;

  @override
  void initState() {
    super.initState();
    imageProvider = const AssetImage("assets/images/r.png");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Dio2Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: imageProvider),

            const SizedBox(height:20),

            ElevatedButton(
                onPressed: () {
                  requestImage();
                },
                child: const Text('Load Image')
            ),

          ],
        ),

      ),

    );
  }

  Future<void> requestImage() async {
    try {
      final response = await dio.get(imageUrl, options: Options(responseType: ResponseType.bytes));
      setState(() {
        imageProvider = MemoryImage(response.data);
      });
    } catch (e) {
      print("requestImage error: $e");
    }
  }


}