// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/results';

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final Object? allDaData = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          'ResultScreen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Center(
                child: Text(
                  '${getDaState(allDaData)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Personalized advice:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${getDaAdvice(allDaData)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getDaState(daData) {
    var daScore = 1;
    var goToSleepTime = int.parse(daData[0].toString());
    var wakeUpTime = int.parse(daData[1].toString());
    var timeSlept = 12 - goToSleepTime + wakeUpTime;
    var wakeUpDifficulty = int.parse(daData[2].toString());
    var didExercise = 'No';
    if (daData[3].toString() == 'Yes1') {
      didExercise = 'Yes';
    }
    if (daData[3].toString() == 'Yes evening1') {
      didExercise = 'Yes evening';
    }
    var dinnerEatTime = int.parse(daData[4].toString());
    var napToday = 'No';
    if (daData[5].toString() == 'Yes after2') {
      napToday = 'Yes after';
    }
    if (daData[5].toString() == 'Yes before2') {
      napToday = 'Yes before';
    }
    var beforeBedActivity = daData[6].toString();
    bool showerBefore = false;
    if (daData[7].toString() == 'Yes3') {
      showerBefore = true;
    }
    var bedroomCondition = int.parse(daData[8].toString());
    var timeOutside = int.parse(daData[9].toString());
    bool takesPills = false;
    if (daData[10].toString() == 'Yes4') {
      takesPills = true;
    }
    var timeSleptBefore = int.parse(daData[11].toString());

    if (goToSleepTime <= 10) {
      daScore = daScore * 4;
    }
    if (wakeUpTime > 6) {
      daScore = daScore * 3;
    }

    if (timeSlept < 5) {
      daScore = daScore * timeSlept;
    } else if (timeSlept >= 11) {
      daScore = daScore * timeSlept;
    } else {
      daScore = daScore * timeSlept * timeSlept;
    }

    if (didExercise == 'Yes') {
      daScore = daScore * 5;
    }
    if (didExercise == 'Yes evening') {
      daScore = daScore * 2;
    } else {
      daScore = daScore;
    }

    if (dinnerEatTime > 8) {
      daScore = daScore;
    }
    if (dinnerEatTime < 8) {
      daScore = daScore * 5;
    }

    if (napToday == 'Yes after') {
      daScore = daScore * 3;
    }
    if (napToday == 'Yes before') {
      daScore = daScore * 5;
    } else {
      daScore = daScore;
    }

    if (beforeBedActivity == 'Reading') {
      daScore = daScore * 5;
    }
    if (beforeBedActivity == 'Doing homework') {
      daScore = daScore * 5;
    }
    if (beforeBedActivity == 'Listening to music') {
      daScore = daScore * 3;
    }
    if (beforeBedActivity == 'Talking') {
      daScore = daScore * 2;
    }
    if (beforeBedActivity == 'Watching TV') {
      daScore = daScore;
    }
    if (beforeBedActivity == 'Wokring on a computer') {
      daScore = daScore;
    }

    if (showerBefore) {
      daScore = daScore * 2;
    }

    daScore = daScore * bedroomCondition * bedroomCondition;

    daScore = daScore * timeOutside * 5;

    if (!takesPills) {
      daScore = daScore * 5;
    }

    if (timeSleptBefore < 5) {
      daScore = daScore;
    } else if (timeSleptBefore >= 11) {
      daScore = daScore * timeSlept;
    } else {
      daScore = daScore * timeSlept * 3;
    }

    if (timeSleptBefore == timeSlept) {
      daScore = daScore * 3;
    }

    String sleepState = 'Idk';

    if (daScore <= 1000) {
      sleepState = 'You are extremely sleep deprivated';
    } else if (daScore <= 10000) {
      sleepState = 'You are sleep deprivated';
    } else if (daScore <= 100000) {
      sleepState = 'You are ok';
    } else {
      sleepState = 'Your sleeping habits are top notch';
    }

    return sleepState;
  }

  String getDaAdvice(daData) {
    var daScore = 1;
    var goToSleepTime = int.parse(daData[0].toString());
    var wakeUpTime = int.parse(daData[1].toString());
    var timeSlept = 12 - goToSleepTime + wakeUpTime;
    var wakeUpDifficulty = int.parse(daData[2].toString());
    var didExercise = 'No';
    if (daData[3].toString() == 'Yes1') {
      didExercise = 'Yes';
    }
    if (daData[3].toString() == 'Yes evening1') {
      didExercise = 'Yes evening';
    }
    var dinnerEatTime = int.parse(daData[4].toString());
    var napToday = 'No';
    if (daData[5].toString() == 'Yes after2') {
      napToday = 'Yes after';
    }
    if (daData[5].toString() == 'Yes before2') {
      napToday = 'Yes before';
    }
    var beforeBedActivity = daData[6].toString();
    bool showerBefore = false;
    if (daData[7].toString() == 'Yes3') {
      showerBefore = true;
    }
    var bedroomCondition = int.parse(daData[8].toString());
    var timeOutside = int.parse(daData[9].toString());
    bool takesPills = false;
    if (daData[10].toString() == 'Yes4') {
      takesPills = true;
    }
    var timeSleptBefore = int.parse(daData[11].toString());

    String advice = '';

    if (timeSleptBefore != timeSlept) {
      advice = advice +
          "Stick to a sleep schedule. Go to bed and wake up at the same time each day. As creatures of ha- bit, people have a hard time adjusting to changes in sleep patterns. Sleeping later on weekends won't fully make up for a lack of sleep during the week and will make it harder to wake up early on Mon- day morning, Set an alarm for bedtime. Often we set an alarm for when it's time to wake up but fail to do so for when it's time to go to sleep. If there is only one piece of advice you remember and take from these twelve tips, this should be it. \n";
    }

    if (didExercise == 'No' || didExercise == 'Yes evening') {
      advice = advice +
          "Exercise is great, but not too late in the day. Try to exercise at least thirty minutes on most da- ys but not later than two to three hours before yo- ur bedtime.\n";
    }

    advice = advice +
        "Avoid caffeine and nicotine. Coffee, colas, cer- tain teas, and chocolate contain the stimulant caf- feine, and its effects can take as long as eight hours to wear off fully. Therefore, a cup of coffee in the la- te afternoon can make it hard for you to fall asleep at night. Nicotine is also a stimulant, often causing smokers to sleep only very lightly. In addition, smo- kers often wake up too early in the morning becau- se of nicotine withdrawal.\n Avoid alcoholic drinks before bed. Having a nightcap or alcoholic beverage before sleep may help you relax, but heavy use robs you of REM sleep, keeping you in the lighter stages of sleep. Heavy alcohol ingestion also may contribute to impair- ment in breathing at night. You also tend to wake up in the middle of the night when the effects of the alcohol have worn off. \n";

    if (dinnerEatTime > 8) {
      advice = advice +
          "Avoid large meals and beverages late at night. A light snack is okay, but a large meal can cause in- digestion, which interferes with sleep. Drinking too many fluids at night can cause frequent awake- nings to urinate.\n";
    }

    if (takesPills) {
      advice = advice +
          "If possible, avoid medicines that delay or disrupt your sleep. Some commonly prescribed heart, blood pressure, or asthma medications, as well as some over-the-counter and herbal remedies for coughs, colds, or allergies, can disrupt sleep patterns. If you have trouble sleeping. talk to your health care provider or pharmacist to see whether any drugs you're taking might be contributing to your insomnia and ask whether they can be taken at other times during the day or early in the evening. \n";
    }

    if (napToday == 'Yes after' || napToday == 'No') {
      advice = advice +
          "Don't take naps after 3 p.m. Naps can help make up for lost sleep, but late afternoon naps can make it harder to fall asleep at night.\n";
    }

    advice = advice +
        "Relax before bed. Don't overschedule your day so that no time is left for unwinding. A relaxing activity, such as reading or listening to music, should be part of your bedtime ritual.\n";

    if (!showerBefore) {
      advice = advice +
          "Take a hot bath before bed. The drop in body temperature after getting out of the bath may help you feel sleepy, and the bath can help you relax and slow down so you're more ready to sleep.\n";
    }

    if (bedroomCondition != 10) {
      advice = advice +
          "Dark bedroom, cool bedroom, gadget-free bedroom. Get rid of anything in your bedroom that might istract you from sleep, such as noises, bright lights, an uncomfortable bed, or warm temperatures. You sleep better if the temperature in the room is kept on the cool side. A TV, cell phone, or computer in the bedroom can be a distraction and deprive you of needed sleep. Having a comfortable mattress and pillow can help promote a good night's sleep. Individuals who have insomnia often watch the clock. Turn the clock's face out of view so you don't worry about the time while trying to fall asleep.\n";
    }

    if (timeOutside < 4) {
      advice = advice +
          "Have the right sunlight exposure. Daylight is key to regulating daily sleep patterns. Try to get outside in natural sunlight for at least thirty minutes each day. If possible, wake up with the sun or use very bright lights in the morning. Sleep experts recommend that. if you have problems falling asleep, you should get an hour of exposure to morning sunlight and turn down the lights before bedtime.\n";
    }

    advice = advice +
        "Don't lie in bed awake. If you find yourself still awake after staying in bed for more than twenty minutes or if you are starting to feel anxious or worried, get up and do some relaxing activity until you feel sleepy. The anxiety of not being able to sleep can make it harder to fall asleep.\n From Appendix of Why We Sleep by Matthew Walker";

// 1. Stick to a sleep schedule. Go to bed and wake up at the same time each day. As creatures of ha- bit, people have a hard time adjusting to changes in sleep patterns. Sleeping later on weekends won't fully make up for a lack of sleep during the week and will make it harder to wake up early on Mon- day morning, Set an alarm for bedtime. Often we set an alarm for when it's time to wake up but fail to do so for when it's time to go to sleep. If there is only one piece of advice you remember and take from these twelve tips, this should be it.
// 2. Exercise is great, but not too late in the day. Try to exercise at least thirty minutes on most da- ys but not later than two to three hours before yo- ur bedtime.
// 3. Avoid caffeine and nicotine. Coffee, colas, cer- tain teas, and chocolate contain the stimulant caf- feine, and its effects can take as long as eight hours to wear off fully. Therefore, a cup of coffee in the la- te afternoon can make it hard for you to fall asleep at night. Nicotine is also a stimulant, often causing smokers to sleep only very lightly. In addition, smo- kers often wake up too early in the morning becau- se of nicotine withdrawal.
// 4. Avoid alcoholic drinks before bed. Having a nightcap or alcoholic beverage before sleep may help you relax, but heavy use robs you of REM sleep, keeping you in the lighter stages of sleep. Heavy alcohol ingestion also may contribute to impair- ment in breathing at night. You also tend to wake up in the middle of the night when the effects of the alcohol have worn off.
// 5. Avoid large meals and beverages late at night. A light snack is okay, but a large meal can cause in- digestion, which interferes with sleep. Drinking too many fluids at night can cause frequent awake- nings to urinate.
// 6. If possible, avoid medicines that delay or dis- rupt your sleep. Some commonly prescribed heart, blood pressure, or asthma medications, as well as some over-the-counter and herbal remedies for co- ughs, colds, or allergies, can disrupt sleep patterns. If you have trouble sleeping. talk to your health ca- re provider or pharmacist to see whether any drugs you're taking might be contributing to your insom- nia and ask whether they can be taken at other ti- mes during the day or early in the evening.
// 7. Don't take naps after 3 p.m. Naps can help make up for lost sleep, but late afternoon naps can make it harder to fall asleep at night.
// 8. Relax before bed. Don't overschedule your day so that no time is left for unwinding. A relaxing activity, such as reading or listening to music, should be part of your bedtime ritual.
// 9. Take a hot bath before bed. The drop in body temperature after getting out of the bath may help you feel sleepy, and the bath can help you relax and slow down so you're more ready to sleep.
// 10. Dark bedroom, cool bedroom, gadget-free bedroom. Get rid of anything in your bedroom that might istract you from sleep, such as noises, bright lights, an uncomfortable bed, or warm temperatures. You sleep better if the temperature in the room is kept on the cool side. A TV, cell phone, or computer in the bedroom can be a distraction and deprive you of needed sleep. Having a comfor- table mattress and pillow can help promote a good night's sleep. Individuals who have insomnia often watch the clock. Turn the clock's face out of view so you don't worry about the time while trying to fall asleep.
// 11. Have the right sunlight exposure. Daylight is key to regulating daily sleep patterns. Try to get outside in natural sunlight for at least thirty minutes each day. If possible, wake up with the sun or use very bright lights in the morning. Sleep experts recommend that. if you have problems falling asleep, you should get an hour of exposure to morning sunlight and turn down the lights before bedtime.
// 12. Don't lie in bed awake. If you find yourself still awake after staying in bed for more than twen- ty minutes or if you are starting to feel anxious or worried, get up and do some relaxing activity until you feel sleepy. The anxiety of not being able to sleep can make it harder to fall asleep.

    return advice;
  }
}
