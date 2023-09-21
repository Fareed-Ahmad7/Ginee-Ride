import 'package:flutter/material.dart';
import 'package:ginee/model/rideDetails.dart';
import 'package:ginee/widgets/sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // upcoming ride list
    var rideList = [
      const RideDetails(
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
        onTap: () {
          // TODO make this open automatically on app open

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
                    itemBuilder: (context, index) => UpcomingRides(rideDetails: rideList[index]),
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
