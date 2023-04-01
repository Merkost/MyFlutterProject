import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom/rounded_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.dark,
        home: const MyHomePage(title: 'Developer page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final Uri _githubUrl = Uri.parse('https://github.com/merkost');
  final Uri _linkedinUrl = Uri.parse('https://www.linkedin.com/in/merkost');
  final Uri _stackoverflowUrl =
      Uri.parse('https://stackoverflow.com/users/15419983/merkost');

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
              spacing: 20, // to apply margin in the main axis of the wrap
              runSpacing: 20, // to apply margin in the cross axis of the wrap
              alignment: WrapAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://lh3.googleusercontent.com/ogw/AAEL6shDr49b5ebZQAtgPUh7-JB00Qi0jQhTIDlIl0Po_3o=s64-c-mo",
                          scale: 0.6,
                        )),
                  ],
                ),
                Text(
                  "- Mobile Developer -",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextField(
                  controller:
                      TextEditingController(text: "Konstantin Merenkov"),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.people), //icon at head of input
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    filled: true,
                    labelText: 'Name',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextField(
                  controller:
                      TextEditingController(text: "flutterdeveloper@gmail.com"),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email), //icon at head of input
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    filled: true,
                    labelText: 'Email',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  children: [
                    FilledButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                          foregroundColor: MaterialStatePropertyAll(Colors.white)
                        ),
                        onPressed: () => {_launchUrl(_githubUrl)},
                        child: const Text("GitHub")),

                    FilledButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
                        ),
                        onPressed: () => {_launchUrl(_stackoverflowUrl)},
                        child: const Text("StackOverflow")),

                    FilledButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        ),
                        onPressed: () => {_launchUrl(_linkedinUrl)},
                        child: const Text("LinkedIn")),
                  ],
                ),
                Text(
                  "- Projects -",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  width: 500,
                  height: 500,
                  child: PageView(
                    controller: PageController(
                      initialPage: 0,
                      viewportFraction: 0.8,
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: RoundedImage('assets/images/UP_MainScreen.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child:
                            RoundedImage('assets/images/UP_Registration.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: RoundedImage('assets/images/UP_Programs.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: RoundedImage('assets/images/UP_Scheduler.png'),
                      )
                    ],
                  ),
                )
                // Text(
                //   '$_counter',
                //   style: Theme
                //       .of(context)
                //       .textTheme
                //       .headlineMedium,
                // ),
              ]),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
