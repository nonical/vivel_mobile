import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/services/donation_service.dart';
import 'package:vivel_mobile/widgets/navigation_bar/back_navigation.dart';
import 'package:vivel_mobile/widgets/donation_list_item.dart';

class MyDonationsPage extends StatefulWidget {
  final String userId;

  const MyDonationsPage({Key? key, required this.userId}) : super(key: key);

  @override
  _MyDonationsPageState createState() => _MyDonationsPageState();
}

class _MyDonationsPageState extends State<MyDonationsPage> {
  late Future<List<Donation>> donations;

  @override
  void initState() {
    super.initState();
    donations = DonationService.get(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackNavigation("My Donations"),
        body: FutureBuilder<List<Donation>>(
          future: donations,
          builder:
              (BuildContext context, AsyncSnapshot<List<Donation>> snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => Row(),
                itemBuilder: (context, index) => Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      DonationListItemWidget(donation: snapshot.data![index]),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
