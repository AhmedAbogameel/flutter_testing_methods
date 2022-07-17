import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing_methods/features/login/cubit.dart';
import 'package:flutter_testing_methods/widgets/loading_indicator.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          final cubit = LoginCubit.of(context);
          return Scaffold(
            appBar: AppBar(),
            body: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Icon(
                    Icons.lock,
                    size: 150,
                    color: Colors.blue,
                  ),
                ),
                TextFormField(
                  onChanged: (value) => cubit.email = value,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) => cubit.password = value,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CheckboxListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                          value: cubit.agreedToTerms,
                          title: const Text('Agree to Terms & Conditions'),
                          onChanged: cubit.toggleAgreedToTerms,
                        ),
                        (state is LoginLoading)
                            ? const LoadingIndicator()
                            :
                        ElevatedButton(
                          onPressed: cubit.agreedToTerms ? cubit.login : null,
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text('Login'),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
