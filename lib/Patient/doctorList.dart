import 'package:flutter/material.dart';
import 'package:maseeha_2/Doctor/doctorsdata.dart';
import 'package:maseeha_2/Patient/newAppointment.dart';

class DoctorList extends StatelessWidget {
  final List<Doctor> doctorlist = [
    Doctor(
        id: 1,
        fullName: "Muhammad Ali",
        pmdc: "51155-P",
        degree: "M,B.B.S",
        specialization: "Heart Specialias"),
    Doctor(
        id: 2,
        fullName: "Muhammad Imran",
        pmdc: "51150-P",
        degree: "M,B.B.S",
        specialization: "Child Specialias"),
    Doctor(
        id: 3,
        fullName: "Asif Mehmood",
        pmdc: "51155-P",
        degree: "M,B.B.S",
        specialization: "Orthopedic"),
    Doctor(
        id: 4,
        fullName: "Shafique Ahmed",
        pmdc: "55155-P",
        degree: "M,B.B.S",
        specialization: "Heart Specialias"),
    Doctor(
        id: 5,
        fullName: "Abdullah Shafiq",
        pmdc: "61150-P",
        degree: "M,B.B.S",
        specialization: "Child Specialias"),
    Doctor(
        id: 6,
        fullName: "Tahir Ali",
        pmdc: "21155-P",
        degree: "M,B.B.S",
        specialization: "Orthopedic"),
  ];

  @override
  Widget build(BuildContext context) {
    void takeAppointment(ctx) {
      showModalBottomSheet(
          context: ctx,
          builder: (context) {
            return NewAppointment();
          });
    }

    Size size = MediaQuery.of(context).size;
    return Container(
      child: doctorlist.isEmpty
          ? Text(
              "No doctor data",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 8,
                ),
                child: Column(
                  children: doctorlist.map((tx) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Card(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
                            children: [
                              Container(
                                height: size.height / 10,
                                width: 120,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://www.google.com/url?sa=i&url=https://flutterappworld.com/a-high-performance-flutter-widget-to-render-bottts-svg-avatars/&psig=AOvVaw0pbd2aLdtAYDPZSY8ZCbFK&ust=1605966714142000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCODx_sSike0CFQAAAAAdAAAAABAJ'),
                                  ),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(size.width / 30),
                                      child: Text(
                                        tx.fullName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      tx.degree,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      tx.specialization,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'Click Here ',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      onPressed: () {
                                        try {
                                          takeAppointment(context);
                                        } catch (err) {
                                          print(err.toString());
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
