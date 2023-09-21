import 'package:flutter/material.dart';
import 'package:ginee/model/rideDetails.dart';
import 'package:ginee/utils/text_to_speech.dart';
import '../screens/Confirmation.dart';

class UpcomingRides extends StatelessWidget {
  final RideDetails rideDetails;
  const UpcomingRides({super.key, required this.rideDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            // client details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(rideDetails.image),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rideDetails.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            rideDetails.distance + ' | ' + rideDetails.time,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    rideDetails.price,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // client payment method, pickup and drop location
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pickup from ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(rideDetails.pickupLocation),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Drop at',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            rideDetails.dropLocation,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment method',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            rideDetails.paymentMethod,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //  confirm button
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          onPressed: () {
                            // stopping tts on clicking confirm button
                            TextToSpeech.stop();

                            // opening confirmation page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ConfirmationScreen()),
                            );
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
