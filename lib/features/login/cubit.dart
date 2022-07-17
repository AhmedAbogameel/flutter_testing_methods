import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing_methods/core/router/router.dart';
import 'package:flutter_testing_methods/features/home/view.dart';
import 'package:flutter_testing_methods/core/data_source.dart';
import 'package:flutter_testing_methods/widgets/snack_bar.dart';

part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit of(context) => BlocProvider.of(context);

  String? email, password;
  bool agreedToTerms = false;

  Future<void> login() async {
    emit(LoginLoading());
    final data = await DataSource.login(email, password);
    if (data['success']) {
      RouteManager.navigateAndPopAll(const HomeView());
    } else {
      showSnackBar(data['message'], errorMessage: true);
    }
    emit(LoginInit());
  }

  void toggleAgreedToTerms(bool? value) {
    agreedToTerms = !agreedToTerms;
    emit(LoginInit());
  }

}