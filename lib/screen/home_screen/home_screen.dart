import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_scanner/screen/home_screen/home_cubit/home_screen_cubit.dart';
import 'package:ocr_scanner/screen/home_screen/home_cubit/home_screen_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var cubit = HomeScreenCubit.get(context);
      cubit.imagePicker = ImagePicker();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeScreenCubit.get(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                color: Color(0xFFfafafa),
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.0,
                      ),
                      Center(
                          child: TextButton(
                              onPressed: () {
                                cubit.pickImageFromGaller();
                              },
                              onLongPress: () {
                                cubit.pickImageFromCamera();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: cubit.image != null
                                    ? Image.file(
                                        cubit.image!,
                                        width: 120,
                                        height: 142,
                                        fit: BoxFit.fill,
                                      )
                                    : Container(
                                        width: 220,
                                        height: 190,
                                        child: const FaIcon(
                                          FontAwesomeIcons.camera,
                                          size: 90.0,
                                          color: Color(0xFF8d71fe),
                                        ),
                                      ),
                              ))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 300.0,
                        width: 250.0,
                        margin: EdgeInsets.only(top: 70.0),
                        padding:
                            EdgeInsets.only(left: 28, bottom: 5, right: 18),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SelectableText(
                              cubit.result,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF8d71fe),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
