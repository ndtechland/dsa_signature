import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'generateMafGREList.dart';
class TabHome extends StatelessWidget {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: const Color(0xff43369A),
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (){
                       // Get.to(const GenerateMaf());
                        },
                      child: Text("Generate MAF",
                        style: GoogleFonts.karla(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    color: const Color(0xff9E6A06),
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text("Add New Member",
                        style: GoogleFonts.karla(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    color: const Color(0xff43369A),
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text("New User Holding Payment",
                        style: GoogleFonts.karla(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: const Color(0xff9E6A06),
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text("Member on Hold",
                        style: GoogleFonts.karla(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    color: const Color(0xff43369A),
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text("Document Re-print",
                        style: GoogleFonts.karla(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    color: const Color(0xff9E6A06),
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text("Add New Member",
                        style: GoogleFonts.karla(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
