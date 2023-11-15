import 'package:flutter/material.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/pages/browse/browse_view_model.dart';
import 'package:movies/pages/browse/widgets/movie_item.dart';
import 'package:provider/provider.dart';

import '../../home/home_detials/home_details_view.dart';

class GenreView extends StatelessWidget {
  static const String routeName = 'genre-view';

  GenreView({super.key});

  var vm = BrowseViewModel();

  @override
  Widget build(BuildContext context) {
    var genre = ModalRoute.of(context)?.settings.arguments as GenreModel;
    vm.getMovies(genre.id);

    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(genre.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer<BrowseViewModel>(
                builder: (context, vm, child) => Expanded(
                  child: (vm.movies.isEmpty)
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Color(0xffB5B4B4),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, HomeDetailsView.routeName,
                                    arguments: vm.movies[index]);
                              },
                              child: MovieItem(model: vm.movies[index])),
                          itemCount: vm.movies.length,
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
