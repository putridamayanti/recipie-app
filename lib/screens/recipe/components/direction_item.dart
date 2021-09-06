import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipie_flutter/screens/recipe/components/recipe_input.dart';

class DirectionItem extends StatelessWidget {
  var onDelete;

  DirectionItem({this.onDelete});

  TextEditingController controller = new TextEditingController();

  ImagePicker imagePicker = new ImagePicker();

  var images = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            InkWell(
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.drag_handle,
                  color: Colors.grey.shade400,
                  size: 18,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      XFile? image = await imagePicker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 50,
                          preferredCameraDevice: CameraDevice.front);

                      images.add(image);
                      // setState(() {
                      //   _image = File(image.path);
                      // });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.amber,
                      padding: EdgeInsets.only(right: 10),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    ),
                  ),
                  Flexible(
                      child: RecipeInputComponent(
                    controller: controller,
                    hint: 'E.g. 2 spoons of sugar',
                  )),
                ],
              ),
            ),
            InkWell(
              onTap: onDelete,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: Colors.grey.shade400,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
