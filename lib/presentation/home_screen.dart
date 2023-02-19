import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/check_index/check_index_bloc.dart';
import '../data/retailer_data.dart';
import '../functions/check_in.dart';
import '../functions/login_status.dart';
import '../models/retailer_model.dart';
import 'checked_in_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RetailerModel? selected;
  int? selectedIndex;
  @override
  void initState() {
    // TODO: implement initState
    CheckInStat().getCheckinIndex(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => LoginScreen()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
        elevation: 0,
        title: const Text('Check_in'),
      ),
      body: ListView.separated(
        itemBuilder: (context2, index) {
          return BlocListener<CheckIndexBloc, CheckIndexState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state.index != null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            CheckedInScreen(retailer: retailers[state.index!])),
                    (route) => false);
              }
            },
            child: Card(
              child: ListTile(
                  selected: selected != null && selected == retailers[index],
                  onTap: () {
                    setState(() {
                      selected = retailers[index];
                      selectedIndex = index;
                    });
                  },
                  title: Text(retailers[index].title),
                  subtitle: Text(retailers[index].detail),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(retailers[index].imgUrl),
                  )),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 2,
        ),
        itemCount: retailers.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: selected == null
          ? const SizedBox()
          : Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: const Color.fromARGB(255, 103, 100, 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(selected!.title),
                  ElevatedButton(
                      onPressed: () {
                        CheckInStat().addCheckin(selectedIndex!);
                        //checkin here
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    CheckedInScreen(retailer: selected!)),
                            (route) => false);
                      },
                      child: const Text("Checkin"))
                ],
              ),
            ),
    );
  }
}
