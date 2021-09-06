import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> ingredients = [
    '2 salmon or halibut steaks',
    '2 tablespoons butter, melted',
    '2 tablespoons lemon juice',
    '1 green onion, sliced',
    '1 tablespoon minced fresh parsley',
    '1/4 teaspoon garlic salt',
    '1/8 teaspoon lemon-pepper seasoning'
  ];

  List<String> directions = [
    'Place salmon in a lightly greased 8-in. square baking dish. Top with butter and lemon juice. Combine onion, parsley, garlic salt and lemon-pepper; sprinkle over salmon.',
    'Bake, uncovered, at 400° for 15-20 minutes or until fish flakes easily with a fork.'
  ];

  YoutubePlayerController youtubePlayerController = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
            'https://www.youtube.com/watch?v=KlGmrhJD8sQ')
        .toString(),
    flags: YoutubePlayerFlags(
      hideControls: false,
      controlsVisibleAtStart: true,
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(handleTabSelection);

    super.initState();
  }

  handleTabSelection() {
    if (tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=668&q=80'))),
                  ),
                  Container(
                    height: 400,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.white.withAlpha(0),
                          Colors.white12,
                          Colors.white
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 15, bottom: 5, right: 15),
                    child: Text(
                      'Salmon Steak',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, bottom: 20),
                    child: Text(
                      'by John Doe',
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text(
                      'Salmon steak with delicious souce and rare medium cook.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text('25 min'),
                            ),
                            VerticalDivider(color: Colors.grey),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text('2 Servings'),
                            ),
                            VerticalDivider(color: Colors.grey),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text('25 min'),
                            )
                          ],
                        ),
                      )),
                  TabBar(
                      controller: tabController,
                      indicatorColor: Colors.amber,
                      labelColor: Colors.amber,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: 'Ingredients',
                        ),
                        Tab(
                          text: 'Directions',
                        ),
                        Tab(
                          text: 'Videos',
                        )
                      ]),
                  Container(
                    child: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, right: 25, bottom: 50, left: 25),
                        child: Column(
                          children: ingredients
                              .map((e) => Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 5,
                                          margin: EdgeInsets.only(right: 15),
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        Expanded(
                                          child: Text(e),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, right: 25, bottom: 50, left: 25),
                        child: Column(
                            children: directions
                                .map((e) => Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.only(right: 15),
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Center(
                                              child: Text(
                                                (directions.indexOf(e) + 1)
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(e),
                                          )
                                        ],
                                      ),
                                    ))
                                .toList()),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              top: 20, right: 25, bottom: 70, left: 25),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: YoutubePlayer(
                                  controller: youtubePlayerController,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.amber,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: YoutubePlayer(
                                  controller: youtubePlayerController,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.amber,
                                ),
                              )
                            ],
                          ))
                    ][tabController.index],
                  )
                ],
              ),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Icon(
          Icons.arrow_back,
          color: Colors.grey.shade700,
        ),
        backgroundColor: Colors.grey.shade100,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
