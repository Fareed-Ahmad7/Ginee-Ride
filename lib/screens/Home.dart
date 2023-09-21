import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ginee/model/rideDetails.dart';
import 'package:ginee/widgets/sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future _speak(RideDetails text) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.speak('reading ride details of ride ${text.id}');
    await flutterTts.speak('name of the client is ${text.name}');
    await flutterTts.speak('the client is ${text.distance}');
    await flutterTts.speak('pickup location is ${text.pickupLocation}');
    await flutterTts.speak('drop location is ${text.dropLocation}');
    await flutterTts.speak('client payment method is ${text.paymentMethod}');
    await flutterTts.speak('The fare amount for this ride is ${text.price} rupees');
    await flutterTts.speak('Click confirm button if you want to proceed with this ride');
  }

  @override
  Widget build(BuildContext context) {
    // upcoming ride list
    var rideList = [
      const RideDetails(
        id: '1',
        name: 'Fareed Ahammad',
        image: 'assets/images/profile.jpg',
        price: '₹ 240',
        distance: '1.2 kms away',
        time: '5 mins',
        pickupLocation: 'Kushal Dry Cleaner, Majestic Road, Bangalore',
        dropLocation: 'IV Sanctum Hotel, 5th Main Road, Bangalore',
        paymentMethod: 'Credit Card',
      ),

      // const RideDetails(
      //   id: '2',
      //   name: 'Ahammad',
      //   image: 'assets/images/profile.jpg',
      //   price: '₹ 300',
      //   distance: '3 kms away',
      //   time: '10 mins',
      //   pickupLocation: 'Majestic Road, Bangalore',
      //   dropLocation: '5th Main Road, Bangalore',
      //   paymentMethod: 'Cash Payment',
      // ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Ginee Ride Details'),
      ),
      body: GestureDetector(
        onTap: () async {
          // TODO make this open automatically on app open

          if (rideList.isNotEmpty) {
            Future.forEach(
              rideList,
              (itemInList) => Future.delayed(
                const Duration(seconds: 1),
                () {
                  _speak(itemInList);
                },
              ).then(print),
            ).then(print).catchError(print);
          } else {
            FlutterTts flutterTts = FlutterTts();
            Future.delayed(const Duration(seconds: 1), () async {
              await flutterTts.speak('There are no upcoming rides!');
              await flutterTts.speak('Please wait until new ride comes up');
            });
          }

          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            useSafeArea: true,
            showDragHandle: true,
            enableDrag: true,
            // constraints: const BoxConstraints(maxHeight: 500),
            context: context,
            // builder: (context) => const UpcomingRides(),
            builder: (context) => Column(
              children: [
                // upcoming rides Heading
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 8),
                  child: Row(
                    children: [
                      Text(
                        'Upcoming Rides',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                //  ride details card
                Expanded(
                  child: ListView.builder(
                    itemCount: rideList.length,
                    itemBuilder: (context, index) =>
                        UpcomingRides(rideDetails: rideList[index]),
                  ),
                ),
              ],
            ),
          );
        },

        // background map image
        child: const Image(
          height: 1000,
          fit: BoxFit.cover,
          image: AssetImage("assets/images/map.png"),
        ),
      ),
    );
  }
}
