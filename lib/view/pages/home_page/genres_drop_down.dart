import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/geners/gener_bloc.dart';
import 'package:movie_app/bloc/geners/gener_states.dart';
import 'package:movie_app/bloc/geners/genres_events.dart';
import 'package:movie_app/models/gener_model.dart';

class GenresDropDown extends StatelessWidget {
  const GenresDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, state) {
        if (state is GenresLoaded) {
          List<DropdownMenuItem<Genres>> namesList = [];
          for (var element in state.ganers) {
            namesList.add(DropdownMenuItem<Genres>(
                value: element, child: Text(element.name.toString())));
          }
          return dropDownButton(namesList, context, state);
        }
        if (state is GenresLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GenresSelectedState) {
          List<DropdownMenuItem<Genres>> namesList = [];
          for (var element in state.allGaners) {
            namesList.add(DropdownMenuItem<Genres>(
                value: element, child: Text(element.name.toString())));
          }
          return dropDownButton(
              namesList, context, GenresLoaded(state.allGaners),
              selectedValue: state.ganers);
        }
        return Container();
      },
    );
  }

  DropdownButton<Genres> dropDownButton(
      List<DropdownMenuItem<Genres>> namesList,
      BuildContext context,
      GenresLoaded state,
      {Genres? selectedValue}) {
    return DropdownButton(
      hint: const Text("Select Genres"),
      value: selectedValue,
      isExpanded: true,
      items: namesList,
      onChanged: (value) {
        BlocProvider.of<GenresBloc>(context)
            .add(GenresSelectedEvent(value!, state.ganers));
      },
    );
  }
}
