// ignore_for_file: prefer_const_constructors

import 'package:api_call_with_bloc/cubit/user_cubit.dart';
import 'package:api_call_with_bloc/cubit/user_cubit_state.dart';
import 'package:api_call_with_bloc/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Api Calling"),
        centerTitle: true,
      ),
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          if (state is UserCubitLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserCubitError) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else if (state is UserCubitDataLoaded) {
            return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                UserModel data = state.userList[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(data.id.toString()),
                  ),
                  subtitle: Text(data.address!.city.toString()),
                  title: Text(data.name.toString()),
                );
              },
            );
          } else {
            return Text("Something is worng!");
          }
        },
      ),
    );
  }
}
