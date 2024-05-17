import 'package:flutter/material.dart';
import 'package:pmobprak/views/consult_call.dart';

class Reservation {
  final String doctorName;
  final String spesialisasi;
  final String pengalaman;
  final String bookNow;
  final Image photo;

  Reservation({
    required this.doctorName,
    required this.spesialisasi,
    required this.pengalaman,
    required this.bookNow,
    required this.photo,
  });
}

List<Reservation> reservationList = [
  Reservation(
    doctorName: "Mark Lee, S.Psi., M.Psi., Psikolog",
    spesialisasi: "Psychologist",
    pengalaman: "7 years",
    bookNow: "Book Now",
    photo: Image.asset("assets/images/mark.png"),
  ),
  Reservation(
    doctorName: "dr. Lee Jeno, Sp.KJ",
    spesialisasi: "Psychiatrist",
    pengalaman: "5 years",
    bookNow: "Book Now",
    photo: Image.asset("assets/images/mark.png"),
  ),
  Reservation(
    doctorName: "Na Jaemin, S.Psi., M.Psi., Psikolog",
    spesialisasi: "Psychologist",
    pengalaman: "6 years",
    bookNow: "Book Now",
    photo: Image.asset("assets/images/mark.png"),
  ),
  Reservation(
      doctorName: "dr. Huang Renjun, Sp.KJ",
      spesialisasi: "Psychiatrist",
      pengalaman: "4 years",
      bookNow: "Book Now",
      photo: Image.asset("assets/images/mark.png")),
];

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Reservation",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reservationList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                final reservation = reservationList[index];
                return Container(
                  padding: const EdgeInsets.all(20),
                  height: 175,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 250, 176),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.document_scanner_rounded,
                            color: Color(0xff004AAD),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reservation.doctorName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff004AAD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                reservation.spesialisasi,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Color(0xff004AAD),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                reservation.pengalaman,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff004AAD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Column(
                        children: [
                          const SizedBox(width: 15),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xff004AAD)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => consultCallPage()),
                              );
                            },
                            child: Text(
                              reservation.bookNow,
                              style: const TextStyle(
                                color: Color.fromARGB(
                                    255, 255, 250, 176), // Warna teks
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
