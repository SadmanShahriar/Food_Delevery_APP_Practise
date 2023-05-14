import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  var data;
  final _controller = PageController();

  DetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    int index;
    int pageCount = data["img_url"].length;
    final pages = List.generate(
      pageCount, 
       (index) => Container(
        child: Image.network(data["img_url"][index]),
       ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
      ),

      body: Container(
        child: Column(
          children: [
            Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data["img_url"].length,
                  itemBuilder: (_, Index) {
                    return CachedNetworkImage(
                      height: 200,
                      width: 200,
                      imageUrl: data['img_url'][Index],
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                          fit: BoxFit.fill,
                    );
                  },
                ),
              ),

              SmoothPageIndicator(
                onDotClicked: (index) {},
                controller: _controller,
                count: data['img_url'].length,
                effect: SlideEffect(
                  activeDotColor: Colors.pinkAccent,
                  dotColor: Colors.pinkAccent.withOpacity(0.5),
                  dotHeight: 20,
                  dotWidth: 20,
                ),
              ),
            ]),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    data['describtion'],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$ ${data['prices']}'.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(
                    "Add to cart",
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







 
