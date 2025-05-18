import 'package:flutter/material.dart';
import 'package:newsapp/data/models/news_model.dart';
import 'package:newsapp/repos/news_repo.dart'; 

class NewsFetchTest extends StatefulWidget {
  const NewsFetchTest({super.key});

  @override
  State<NewsFetchTest> createState() => _NewsFetchTestState();
}

class _NewsFetchTestState extends State<NewsFetchTest> {
  final NewsRepo newsRepo = NewsRepo();
  NewsResponseModel? newsResponse;
  bool isLoading = false;

  Future<void> fetchNews() async {
    setState(() {
      isLoading = true;
    });
    
    NewsResponseModel? response = await newsRepo.getNews();
    
    setState(() {
      newsResponse = response;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Test'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : newsResponse == null
                ? ElevatedButton(
                    onPressed: fetchNews,
                    child: const Text('Fetch News'),
                  )
                : _buildNewsCards(),
      ),
    );
  }

  Widget _buildNewsCards() {
    // Take only the first 10 news items
    final newsItems = newsResponse!.news.toList();
    
    return SizedBox(
      height: 300, // Fixed height for the scrollable row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final news = newsItems[index];
          return SizedBox(
            width: 300, // Fixed width for each card
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (news.urlToImage != null)
                    Image.network(
                      news.urlToImage!,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                          const SizedBox(height: 150, child: Icon(Icons.broken_image)),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.title ?? 'No title',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news.description ?? 'No description',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}