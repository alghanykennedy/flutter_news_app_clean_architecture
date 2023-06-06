import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/domain/entities/article.dart';
import 'package:news_flutter/presentation/feature/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              final article = state[index];
              return NewsCard(article: article);
            },
          ),
          onEmpty: const Center(child: Text('No news Today')),
          onError: (_) => const Center(child: Text('Somethings went wrong!')),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Text('Today News'),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              controller.getNews();
            },
            icon: const Icon(Icons.refresh))
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            article.urlToImage.isNotEmpty
                ? Container(
                    height: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  article.description.isNotEmpty
                      ? const Divider(
                          color: Colors.black,
                        )
                      : const SizedBox.shrink(),
                  Text(
                    article.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
