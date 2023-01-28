import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Warehouse A"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country",
                        style: GoogleFonts.getFont(
                          "Ubuntu",
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Capacity\n1000 cubic metre",
                              style: GoogleFonts.getFont(
                                "Ubuntu",
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Available Capacity\n1000 cubic metre",
                              style: GoogleFonts.getFont(
                                "Ubuntu",
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: Colors.white24,
                    contentPadding: const EdgeInsets.all(15),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Commodity 1",
                          style: GoogleFonts.getFont(
                            "Ubuntu",
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Commmo",
                          style: GoogleFonts.getFont(
                            "Ubuntu",
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
