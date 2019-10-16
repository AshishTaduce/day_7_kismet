import 'package:day_6_kismet/story_brain.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: KismetApp(),
    ));

class KismetApp extends StatefulWidget {
  @override
  KismetAppState createState() => KismetAppState();
}

class KismetAppState extends State<KismetApp> {

  List<Story> allStories = StoryData().stories;
  Story currentStory;
  int index = 0;
  StoryBrain story = StoryBrain();

  @override
  Widget build(BuildContext context) {
    currentStory = allStories[index];
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          backgroundBlendMode: BlendMode.modulate,
          image: new DecorationImage(
            image: new AssetImage(
              "assets/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //StoryBrain().getStory(),
                    story.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      //story.nextStory(1);
                    });
                    //Choice 1 made by user.
                    //TODO: Step 9 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user, do the same for choice2 button and pass number 2 in that case
                  },
                  color: Colors.red,
                  child: Text(
                    story.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 14 - Use a Flutter Visibility Widget to wrap this FlatButton and set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: true,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        //story.nextStory(2);
                      });
                      //Choice 2 made by user.
                    },
                    color: Colors.blue,
                    child: Text(
                      story.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

