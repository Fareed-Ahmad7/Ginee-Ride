import 'package:flutter/material.dart';
import 'package:ginee/model/rideDetails.dart';
import 'package:ginee/utils/text_to_speech.dart';
import 'package:ginee/widgets/sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // by default there is only one ride
  // to test for multiple rides just de-comment the second RideDetails() inside rideList
  // to test for no rides just comment all the RideDetails() inside rideList

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Ginee Ride Details'),
      ),
      // background map image
      body: const Image(
        height: 1000,
        fit: BoxFit.cover,
        image: AssetImage("assets/images/map.png"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // opening bottom sheet automatically on app opened

      Future.delayed(const Duration(seconds: 3), () {
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
          context: context,
          builder: (context) => Column(
            children: [
              // upcoming rides Heading
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 0, 8),
                child: Row(
                  children: [
                    Text(
                      'Upcoming Rides',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
      });


      // playing text to speech of ride details automatically
      if (rideList.isNotEmpty) {
        // if ride list is not empty
        Future.forEach(
          rideList,
          (itemInList) => Future.delayed(
            const Duration(seconds: 4),
            () {
              TextToSpeech.speak(itemInList);
            },
          ).then(print),
        ).then(print).catchError(print);
      } else {
        // if ride list is empty
        TextToSpeech.speakNoRides();
      }
    });
  }
}
