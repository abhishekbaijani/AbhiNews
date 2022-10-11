import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/helper/data.dart';
import 'package:news_app_flutter/helper/news.dart';
import 'package:news_app_flutter/models/article_model.dart';
import 'package:news_app_flutter/models/categories_model.dart';
import 'package:news_app_flutter/views/article_%20view.dart';
import 'package:news_app_flutter/views/category_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categoryModel = <CategorieModel>[];
  List<ArticleModel> articleModel = <ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categoryModel = getCategories();
    getNews();
  }

  getNews() async {
    News newsC = News();
    await newsC.getNews();
    articleModel = newsC.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Abhi",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News!",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _loading
          ? Center(
        child: Container(
          child: const CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[

              ///category
              Container(
                height: 70,
                child: ListView.builder(
                    itemCount: categoryModel.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryFile(
                        imageUrl: categoryModel[index].imageAssetUrl,
                        categoryName: categoryModel[index].categorieName,
                      );
                    }),
              ),

              ///Blogs
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articleModel.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articleModel[index].urlToImage,
                        title: articleModel[index].title,
                        desc: articleModel[index].desc,
                        url: articleModel[index].url,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryFile extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryFile({required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryView(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile({Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ArticleView(blogUrl: imageUrl, postUrl: url,)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(imageUrl: imageUrl)),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: const TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
