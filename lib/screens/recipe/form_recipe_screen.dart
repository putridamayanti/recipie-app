import 'package:flutter/material.dart';
import 'package:recipie_flutter/screens/recipe/components/direction_item.dart';
import 'package:recipie_flutter/screens/recipe/components/ingredient_item.dart';
import 'package:recipie_flutter/screens/recipe/components/ingredient_list.dart';
import 'package:recipie_flutter/screens/recipe/components/recipe_input.dart';

class FormRecipeScreen extends StatefulWidget {
  @override
  _FormRecipeScreenState createState() => _FormRecipeScreenState();
}

class _FormRecipeScreenState extends State<FormRecipeScreen>
    with SingleTickerProviderStateMixin {
  List<int> products = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<String> item = ["Clients", "Designer", "Developer", "Director"];

  List<String> ingredients = [];
  List<Object> directions = [];

  TextEditingController title = new TextEditingController();

  List<IngredientItem> IngredientList = [];
  List<DirectionItem> DirectionList = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    IngredientList.add(IngredientItem(onDelete: () => handleIngredientRow(0)));
    IngredientList.add(IngredientItem(onDelete: () => handleIngredientRow(1)));

    DirectionList.add(DirectionItem(onDelete: () => handleDirectionRow(0)));
    DirectionList.add(DirectionItem(onDelete: () => handleDirectionRow(1)));

    super.initState();
  }

  handleIngredientRow(index) {
    if (index != null) {
      IngredientList.removeAt(index);
      setState(() {});
    } else {
      setState(() {});
      IngredientList.add(IngredientItem(
        onDelete: () => handleIngredientRow(IngredientList.length - 1),
      ));
    }
  }

  handleDirectionRow(index) {
    if (index != null) {
      DirectionList.removeAt(index);
      setState(() {});
    } else {
      setState(() {});
      DirectionList.add(DirectionItem(
        onDelete: () => handleDirectionRow(DirectionList.length - 1),
      ));
    }
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = item.removeAt(oldindex);
      item.insert(newindex, items);
    });
  }

  reorderIngredients(oldInd, newInd) {
    setState(() {
      if (newInd > oldInd) {
        newInd -= 1;
      }
      final items = IngredientList.removeAt(oldInd);
      IngredientList.insert(newInd, items);
    });
  }

  handleSubmit() {
    IngredientList.forEach((widget) => ingredients.add(widget.controller.text));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Recipe',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.amber.shade600,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 40),
                child: RecipeInputComponent(
                  controller: title,
                  title: 'Title',
                  hint: 'Recipe title',
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 40),
                child: RecipeInputComponent(
                    controller: title,
                    title: 'Description',
                    hint: 'Recipe description',
                    rows: 4),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Ingredients'),
                    ),
                    Container(
                      child: ReorderableListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => Container(
                                key: ValueKey(index),
                                child: IngredientList[index],
                              ),
                          itemCount: IngredientList.length,
                          onReorder: reorderData),
                    ),
                    InkWell(
                      onTap: () => handleIngredientRow(null),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text('Add ingredient'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Directions'),
                    ),
                    Container(
                      child: ReorderableListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => Container(
                                key: ValueKey(index),
                                child: DirectionList[index],
                              ),
                          itemCount: DirectionList.length,
                          onReorder: reorderData),
                    ),
                    InkWell(
                      onTap: () => handleDirectionRow(null),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text('Add direction'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
