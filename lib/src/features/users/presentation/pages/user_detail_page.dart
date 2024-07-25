import 'package:flutter/material.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_entity.dart';
import 'package:satyam_assignment/src/features/users/presentation/widgets/employee_details.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/profile.jpg'),
              ),
              const SizedBox(height: 8),
              EmployeeDetails(
                textTheme: textTheme,
                title: 'Name: ',
                details: user.name,
              ),
              const SizedBox(height: 8),
              EmployeeDetails(
                textTheme: textTheme,
                title: 'Email: ',
                details: user.email,
              ),
              const SizedBox(height: 8),
              EmployeeDetails(
                textTheme: textTheme,
                title: 'User Name: ',
                details: user.username,
              ),
              const SizedBox(height: 8),
              EmployeeDetails(
                textTheme: textTheme,
                title: 'Phone No: ',
                details: user.phone,
              ),
              const SizedBox(height: 8),
              EmployeeDetails(
                textTheme: textTheme,
                title: 'Address: ',
                details: '${user.address.city}, ${user.address.street},\n ZipCode-${user.address.zipcode}',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF3850E1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: user.email,
                    );

                    launchUrl(emailLaunchUri);
                  },
                  child: Text(
                    'Connect...',
                    style: textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
