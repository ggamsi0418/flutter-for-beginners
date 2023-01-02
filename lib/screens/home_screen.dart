import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const defaultSeconds = 5;
  int totalSeconds = defaultSeconds;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  // static int get defaultSeconds => 10;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSeconds = defaultSeconds;
      });

      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onRewindPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = defaultSeconds;
    });
  }

  void onResetPressed() {
    setState(() {
      totalPomodoros = 0;
      isRunning = false;
      totalSeconds = defaultSeconds;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    var playButton = IconButton(
      onPressed: onStartPressed,
      color: Theme.of(context).cardColor,
      iconSize: 135,
      icon: const Icon(
        Icons.play_circle_outline,
      ),
    );

    var pauseButton = IconButton(
      onPressed: onPausePressed,
      color: Theme.of(context).cardColor,
      iconSize: 135,
      icon: const Icon(
        Icons.pause_circle_outline,
      ),
    );

    var rewindButton = IconButton(
      onPressed: onRewindPressed,
      color: Theme.of(context).cardColor,
      iconSize: 135,
      icon: const Icon(Icons.fast_rewind_outlined),
    );

    var resetButton = IconButton(
      onPressed: onResetPressed,
      color: Theme.of(context).textTheme.headline1!.color,
      iconSize: 50,
      icon: const Icon(Icons.restore_outlined),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 100,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (totalSeconds == defaultSeconds) ...[
                      playButton
                    ] else if (isRunning) ...[
                      pauseButton
                    ] else ...[
                      rewindButton,
                      playButton,
                    ],
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pomodoros",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color,
                                ),
                              ),
                              Text(
                                "$totalPomodoros",
                                style: TextStyle(
                                  fontSize: 65,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [if (totalPomodoros != 0) resetButton],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
