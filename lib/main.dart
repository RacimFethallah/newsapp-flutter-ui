import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categories.dart';
import 'package:newsapp/models/news.dart';

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
      category: Categories(name: 'Sports'),
      url: 'https://www.bbc.com/news/world-asia-china-57641900',
      urlToImage: 'assets/news1.jpg',
      publishedAt: '2022-01-01',
      content: 'The world is ending',
    ),
    News(
      source: 'Google News',
      author: 'John Doe',
      title: 'The world is ending',
      description: 'The world is ending',
      category: Categories(name: 'Entertainment'),
      url: 'https://www.bbc.com/news/world-asia-china-57641900',
      urlToImage: 'assets/news2.jpg',
      publishedAt: '2022-01-01',
      content: 'The world is ending',
    ),
    News(
      source: 'BBC',
      author: 'John Doe',
      title: '',
      description: 'The world is ending',
      category: Categories(name: 'Business'),
      url: 'https://www.bbc.com/news/world-asia-china-57641900',
      urlToImage: 'assets/news3.jpg',
      publishedAt: '2022-01-01',
      content: 'The world is ending',
    ),
    News(
      source: 'BBC',
      author: 'John Doe',
      title: '',
      description: 'The world is ending',
      category: Categories(name: 'Business'),
      url: 'https://www.bbc.com/news/world-asia-china-57641900',
      urlToImage: 'assets/news3.jpg',
      publishedAt: '2022-01-01',
      content: 'The world is ending',
    ),
    News(
      source: 'BBC',
      author: 'John Doe',
      title: '',
      description: 'The world is ending',
      category: Categories(name: 'Business'),
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

  Categories selectedCategory = Categories(name: 'All');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
              SizedBox(
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
              const SizedBox(height: 24),
              // Categories Filter
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 12.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              )
                            ],
                            color: selectedCategory.name == category.name
                                ? Colors.blue
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            category.name,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: selectedCategory.name == category.name
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8),
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
                  itemCount: newsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return selectedCategory.name == 'All' ||
                            selectedCategory.name ==
                                newsList[index].category.name
                        ? Container(
                            height: 100,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  newsList[index].urlToImage!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(newsList[index].source),
                                      Text(newsList[index].title),
                                      const Spacer(),
                                      Text(newsList[index].author),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(newsList[index].category.name),
                                      const Spacer(),
                                      Text(newsList[index].publishedAt)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container();
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
