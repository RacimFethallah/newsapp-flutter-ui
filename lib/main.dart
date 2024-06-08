import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/categories.dart';
import 'package:newsapp/model/news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uNews',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<News> newsList = [
    News(
      source: 'BBC',
      author: 'John Doe',
      title: 'The world is ending',
      description: 'The world is ending',
      url: 'https://www.bbc.com/news/world-asia-china-57641900',
      urlToImage: 'assets/news1.jpg',
      publishedAt: '2022-01-01',
      content: 'The world is ending',
    ),
    News(
      source: 'BBC',
      author: 'John Doe',
      title: 'The world is ending',
      description: 'The world is ending',
      url: 'https://www.bbc.com/news/world-asia-china-57641900',
      urlToImage: 'assets/news2.jpg',
      publishedAt: '2022-01-01',
      content: 'The world is ending',
    ),
    News(
      source: 'BBC',
      author: 'John Doe',
      title: 'The world is ending',
      description: 'The world is ending',
      url: 'https://www.bbc.com/news/world-asia-china-57641900',
      urlToImage: 'assets/news3.jpg',
      publishedAt: '2022-01-01',
      content: 'The world is ending',
    ),
  ];
  

  final List<Categories> categories = [
    Categories(name: 'All'),
    Categories(name: 'Sports'),
    Categories(name: 'Entertainment'),
    Categories(name: 'Business'),
    Categories(name: 'Tech'),
    Categories(name: 'Politics'),
    Categories(name: 'Health'),
    Categories(name: 'Science'),
    Categories(name: 'Education'),
    Categories(name: 'Culture'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning!',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                      Text('Username',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.circle_notifications_rounded))
                ],
              ),
              const SizedBox(height: 32),
              const Row(
                children: [
                  Text('Breaking News',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            newsList[index].urlToImage!,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  },
                  itemCount: newsList.length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              const SizedBox(height: 50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          category.name,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text('For You',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // height: 200,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const ListTile(
                        title: Text('News Title'),
                        subtitle: Text('News Subtitle'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
