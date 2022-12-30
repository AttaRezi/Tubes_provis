import 'package:flutter/material.dart';
import 'package:tubes_provis/Screens/AboutPage/backButton.dart';
import 'package:tubes_provis/constants.dart';


class About extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 20.0, right: 20.0, bottom: 50.0),
              child: Text(
                "About",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(

                'assets/images/bmi_logo.png',
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,

              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(

                    "BMI is a measurement of a person's leanness or corpulence based on their height and weight, and is intended to quantify tissue mass. "
                    "\n\n"
                    "It is widely used as a general indicator of whether a person has a healthy body weight for their height."
                        "\n\n"
                  "Specifically, the value obtained from the calculation of BMI is used to categorize whether a person is underweight, normal weight, overweight, or obese depending on what range the value falls between.",
                  textAlign: TextAlign.justify,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

