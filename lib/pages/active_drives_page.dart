import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/services/drive_service.dart';
import 'package:vivel_mobile/widgets/navigation_bar/back_navigation.dart';
import 'package:vivel_mobile/widgets/drive.dart';

class ActiveDrivesPage extends StatefulWidget {
  final String userId;

  const ActiveDrivesPage({Key? key, required this.userId}) : super(key: key);

  @override
  _ActiveDrivesPageState createState() => _ActiveDrivesPageState();
}

class _ActiveDrivesPageState extends State<ActiveDrivesPage> {
  late Future<List<Drive>> drives;

  @override
  void initState() {
    super.initState();
    drives = DriveService.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackNavigation("Active drives"),
        body: FutureBuilder<List<Drive>>(
          future: drives,
          builder: (BuildContext context, AsyncSnapshot<List<Drive>> snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => Row(),
                itemBuilder: (context, index) => Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      DriveWidget(
                          drive: snapshot.data![index], userId: widget.userId),
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
