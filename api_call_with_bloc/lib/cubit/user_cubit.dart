import 'package:api_call_with_bloc/cubit/user_cubit_state.dart';
import 'package:api_call_with_bloc/models/user_model.dart';
import 'package:api_call_with_bloc/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  ApiServices apiServices;
  UserCubit({required this.apiServices}) : super(UserCubitInit());

  void getAllUser() async {
    try {
      //first show loading indicator
      emit(UserCubitLoading());
      userList = await apiServices.getUser();
      //now call loaded data
      emit(UserCubitDataLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
