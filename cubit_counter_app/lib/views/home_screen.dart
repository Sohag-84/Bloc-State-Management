// ignore_for_file: prefer_const_constructors

import 'package:cubit_counter_app/cubit/counter_cubit.dart';
import 'package:cubit_counter_app/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final textStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Counter App"),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterCubit, CounterCubitState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (state is CounterValueUpdated)
                  ? Text(state.counter.toString(), style: textStyle)
                  : Text("0", style: textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().counterIncrease();
                    },
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().counterDecrease();
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
