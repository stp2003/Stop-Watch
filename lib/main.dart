import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stop Watch Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  // logic
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;

  List laps = [];

  // stop timer function ->
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  // reset function ->
  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  // adding lapses ->
  void addLapses() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  // for deleting lapses ->
  void deleteLapses() {
    setState(() {
      laps.clear();
    });
  }

  // start timer function ->
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }

      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Stop Watch Flutter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),

              // Timer
              Center(
                child: Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 82.0,
                      fontWeight: FontWeight.w500),
                ),
              ),

              // Container for time lapses
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF323F68),
                  borderRadius: BorderRadius.circular(12.0),
                ),

                // adding a list builder for lapses ->
                child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lap: ${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "${laps[index]}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20.0,
              ),

              // Start Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        (!started) ? start() : stop();
                      },
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.greenAccent),
                      ),
                      child: Text(
                        (!started) ? "Start" : "Paused",
                        style: const TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),

                  // Flag Icon
                  IconButton(
                    onPressed: () {
                      addLapses();
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.flag),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),

                  // Reset Button
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        reset();
                        deleteLapses();
                      },
                      fillColor: Colors.cyanAccent,
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.purple),
                      ),
                      child: const Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
