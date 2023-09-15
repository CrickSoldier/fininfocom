import 'package:fininfocom/viewModel/user_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchRandomUser();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (userViewModel.user != null)
              Visibility(
                visible: userViewModel.user != null,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Column(
                  children: [
                    Text('Name: ${userViewModel.user!.name}'),
                    Text('Location: ${userViewModel.user!.location}'),
                    Text('Email: ${userViewModel.user!.email}'),
                    Text('DOB: ${userViewModel.user!.dob}'),
                    Text(
                        'Days Since Registered: ${calculateDaysSinceRegistration(userViewModel.user!.registeredDate)}'),

                    // Add an Image widget here for user's image
                  ],
                ),
              ),
            ElevatedButton(
              onPressed: () => userViewModel.fetchRandomUser(),
              child: const Text('Fetch Random User'),
            ),
          ],
        ),
      ),
    );
  }

  int calculateDaysSinceRegistration(DateTime registrationDate) {
    final now = DateTime.now();
    final difference = now.difference(registrationDate);
    return difference.inDays;
  }
}
