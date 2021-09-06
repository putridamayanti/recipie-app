import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipie_flutter/screens/recipe/components/recipe_input.dart';

class IngredientItem extends StatelessWidget {
  var onDelete;
  void onImagePick;

  IngredientItem({this.onDelete, this.onImagePick});

  TextEditingController controller = new TextEditingController();

  ImagePicker imagePicker = new ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
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
          Flexible(
              child: RecipeInputComponent(
            controller: controller,
            hint: 'E.g. 2 spoons of sugar',
          )),
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
    );
  }
}
