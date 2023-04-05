import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/connectivity/connectivity_bloc.dart';
import 'package:movie_app/bloc/geners/gener_bloc.dart';
import 'package:movie_app/bloc/geners/gener_states.dart';
import 'package:movie_app/bloc/geners/genres_events.dart';
import 'package:movie_app/bloc/movie/movies_bloc.dart';
import 'package:movie_app/view/pages/home_page/genres_drop_down.dart';
import 'package:movie_app/view/pages/home_page/movies_list.dart';
import 'package:movie_app/view/widgets/dark_theme_toggle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ConnectivityBloc()..add(ConnectivityCheckEvent()),
        ),
        BlocProvider(
          create: (context) => GenresBloc()..add(GenresFetch()),
        ),
        BlocProvider(
          create: (context) => MoviesBloc(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ConnectivityBloc, ConnectivityState>(
            listener: (context, state) {
              if (state is ConnectivityNotAvailable) {
                const snackBar = SnackBar(
                  content: Text('No Internet Connection'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
          BlocListener<GenresBloc, GenresState>(
            listener: (context, state) {
              if (state is GenresSelectedState) {
                BlocProvider.of<MoviesBloc>(context)
                    .add(FetchMoviesList(state.ganers));
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Movie App-Rohit Manglani"),
            actions: const [DarkThemeToggle()],
          ),
          body: Column(
            children: const [
              SizedBox(height: 10),
              GenresDropDown(),
              Expanded(child: MoviesList())
            ],
          ),
        ),
      ),
    );
  }
}
