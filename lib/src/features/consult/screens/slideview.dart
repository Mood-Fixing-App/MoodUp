import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/components/button.dart';
import 'package:moodup/src/features/consult/screens/consultbox.dart';
import 'package:moodup/src/features/notifications/notifications.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  State<ConsultPage> createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),

            // Add multiple sets of columns
            _buildImageColumns(),
            _buildImageColumns(),
            _buildImageColumns(),
            _buildImageColumns(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageColumns() {
    return Container(
      width: 374,
      height: 939,
      child: ListView.builder(
        itemCount: 4, // Number of sets of columns
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                "assets/Slide1.png",
                width: 330,
                height: 209,
              ),
              Image.asset(
                "assets/Slide2.png",
                width: 10.979634284973145,
                height: 10.973457336425781,
              ),
              Image.asset(
                "assets/Slide3.png",
                width: 10.979634284973145,
                height: 10.973457336425781,
              ),
              Image.asset(
                "assets/Slide4.png",
                width: 10.979634284973145,
                height: 10.973457336425781,
              ),
            ],
          );
        },
      ),
    );
  }
}
