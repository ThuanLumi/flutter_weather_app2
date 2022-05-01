import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather_bloc/weather_bloc.dart';

class CitySearchScreen extends StatelessWidget {
  final TextEditingController _cityTextController = TextEditingController();

  CitySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _cityTextController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0),
                    hintText: 'Enter a city',
                  ),
                ),
              ),
              BlocListener<WeatherBloc, WeatherState>(
                listener: (context, state) {
                  Navigator.of(context).pushNamed('/main');
                },
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(
                      WeatherCityClickedSearch(city: _cityTextController.text),
                    );
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
