import 'package:flutter/material.dart';
import 'package:movies/core/network_layer/api_manager.dart';
import 'package:movies/pages/home/widgets/popular_movie_item.dart';
import '../../models/Popular_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: ApiManager.fetchPopular(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(
                child: Text(
                    snapshot.error.toString()
                ),
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            Results results = snapshot.data!;
            return Expanded(
                child: PopularMovieItem(results: results!)
            );
          },
        ),

      ],
    );
  }
}
