import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_search_project/domain/image_document.dart';
import 'package:image_search_project/page/detail/detail_page.dart';
import 'package:image_search_project/page/favorite/favorite_page.dart';
import 'package:image_search_project/page/home/home_page.dart';
import 'package:image_search_project/shared_data.dart';
import 'package:image_search_project/util/navigator_route_name.dart';
import 'package:provider/provider.dart';

// test 2
Future<void> main() async {
  await dotenv.load(fileName: 'assets/config/.env');

  runApp(
    ChangeNotifierProvider(
        create: (_) => SharedDataModel(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Search Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Image Search Project'),
      onGenerateRoute: (settings) {
        if (routePageDetail == settings.name) {
          final args = settings.arguments as ImageDocument?;
          if (args == null) return null;

          return MaterialPageRoute(builder: (context) {
            return DetailPage(args);
          });
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ]),
    );
  }

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const FavoritePage()
  ];
}
