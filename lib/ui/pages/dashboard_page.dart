import 'dart:developer';

import 'package:buatin_books/env/env.dart';
import 'package:buatin_books/models/book_response.dart';
import 'package:buatin_books/ui/atoms/empty.dart';
import 'package:buatin_books/ui/atoms/themed_card.dart' as a;
import 'package:buatin_books/ui/atoms/themed_indicator.dart';
import 'package:buatin_books/ui/molecules/themed_list_view.dart';
import 'package:buatin_books/ui/templates/main_template.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../atoms/themed_image.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  BookResponse bookBusinessResponse = BookResponse();
  BookResponse bookEducationResponse = BookResponse();
  BookResponse bookMangaResponse = BookResponse();

  bool _isBookBusinessLoading = true;
  bool _isBookEducationLoading = true;
  bool _isBookMangaLoading = true;

  void fetchData() {
    clearData();

    setState(() {
      _isBookBusinessLoading = true;
      _isBookEducationLoading = true;
      _isBookMangaLoading = true;
    });

    // Delay the request to show the loading indicator
    Future.delayed(const Duration(seconds: 2), () async {
      try {
        final response = await getBook('business-books');
        bookBusinessResponse = response;
      } on DioException catch (e) {
        log(e.toString());
      } finally {
        setState(() {
          _isBookBusinessLoading = false;
        });
      }

      try {
        final response = await getBook('education');
        bookEducationResponse = response;
      } on DioException catch (e) {
        log(e.toString());
      } finally {
        setState(() {
          _isBookEducationLoading = false;
        });
      }

      try {
        final response = await getBook('manga');
        bookMangaResponse = response;
      } on DioException catch (e) {
        log(e.toString());
      } finally {
        setState(() {
          _isBookMangaLoading = false;
        });
      }
    });
  }

  void clearData() {
    setState(() {
      bookBusinessResponse = BookResponse();
      bookEducationResponse = BookResponse();
      bookMangaResponse = BookResponse();
    });
  }

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  @override
  void dispose() {
    super.dispose();

    clearData();
  }

  @override
  Widget build(BuildContext context) {
    return MainTemplate(
      title: 'Top Selling Books',
      body: RefreshIndicator(
        onRefresh: () async {
          fetchData();
        },
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              ThemedListView(
                scrollDirection: Axis.horizontal,
                sectionTitle: 'Top Selling Business',
                sectionAction: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      label: const Text('See All'),
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () {},
                    )),
                children: bookBusinessResponse.results?.books != null
                    ? bookBusinessResponse.results!.books!
                        .map(
                          (e) => a.ThemedCard(
                            cardTitle: e.title ?? '',
                            cardSubtitle: e.author ?? '',
                            cardImage: e.bookImage != null
                                ? ThemedImage(
                                    imageUrl: e.bookImage!,
                                    height: 180,
                                    width: 180,
                                  )
                                : null,
                            child: const SizedBox(),
                          ),
                        )
                        .toList()
                    : [
                        if (_isBookBusinessLoading)
                          AnimatedOpacity(
                            opacity: _isBookBusinessLoading ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: const ThemedIndicator(
                              width: 0.9,
                            ),
                          ),
                        Opacity(
                          opacity: _isBookBusinessLoading ? 0 : 1,
                          child: const Empty(
                            title: 'No Data',
                            subtitle: 'No data available',
                          ),
                        )
                      ],
              ),
              const SizedBox(height: 16),
              ThemedListView(
                scrollDirection: Axis.horizontal,
                sectionTitle: 'Top Selling Education',
                sectionAction: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      label: const Text('See All'),
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () {},
                    )),
                children: bookEducationResponse.results?.books != null
                    ? bookEducationResponse.results!.books!
                        .map(
                          (e) => a.ThemedCard(
                            cardTitle: e.title ?? '',
                            cardSubtitle: e.author ?? '',
                            cardImage: e.bookImage != null
                                ? ThemedImage(
                                    imageUrl: e.bookImage!,
                                    height: 180,
                                    width: 180,
                                  )
                                : null,
                            child: const SizedBox(),
                          ),
                        )
                        .toList()
                    : [
                        if (_isBookEducationLoading)
                          AnimatedOpacity(
                            opacity: _isBookEducationLoading ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: const ThemedIndicator(
                              width: 0.9,
                            ),
                          ),
                        Opacity(
                          opacity: _isBookEducationLoading ? 0 : 1,
                          child: const Empty(
                            title: 'No Data',
                            subtitle: 'No data available',
                          ),
                        )
                      ],
              ),
              const SizedBox(height: 16),
              ThemedListView(
                scrollDirection: Axis.horizontal,
                sectionTitle: 'Top Selling Manga',
                sectionAction: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      label: const Text('See All'),
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () {},
                    )),
                children: bookMangaResponse.results?.books != null
                    ? bookMangaResponse.results!.books!
                        .map(
                          (e) => a.ThemedCard(
                            cardTitle: e.title ?? '',
                            cardSubtitle: e.author ?? '',
                            cardImage: e.bookImage != null
                                ? ThemedImage(
                                    imageUrl: e.bookImage!,
                                    height: 180,
                                    width: 180,
                                  )
                                : null,
                            child: const SizedBox(),
                          ),
                        )
                        .toList()
                    : [
                        if (_isBookMangaLoading)
                          AnimatedOpacity(
                            opacity: _isBookMangaLoading ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: const ThemedIndicator(
                              width: 0.9,
                            ),
                          ),
                        Opacity(
                          opacity: _isBookMangaLoading ? 0 : 1,
                          child: const Empty(
                            title: 'No Data',
                            subtitle: 'No data available',
                          ),
                        )
                      ],
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

Future<BookResponse> getBook(String list) async {
  try {
    String apiUrl =
        'https://api.nytimes.com/svc/books/v3/lists/current/$list.json';
    final response = await Dio().get(
      apiUrl,
      queryParameters: {
        'api-key': Env.nycApiKey,
      },
    );

    return BookResponse.fromJson(response.data);
  } on Exception catch (e) {
    log(e.toString());
    rethrow;
  }
}
