import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_pt_4net/pages/home-page/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6FB),
      appBar: AppBar(
        title: Text(
          'Random Number Generator',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14 * 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                      horizontal: width * 0.05,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    hintText: 'Enter a number',
                    hintStyle: GoogleFonts.poppins(
                      color: Color(0xFF7B7B7B).withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * 1.2,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * 1.2,
                  ),
                  onChanged: (value) {
                    int number = int.tryParse(value) ?? 0;
                    controller.inputNumber.value = number;
                  },
                ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () {
                    controller.generateNumbers(controller.inputNumber.value);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: width,
                      height: height * 0.068,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      child: Text('Generate',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12 * 1.2,
                          ))),
                ),
                SizedBox(height: height * 0.02),
                Obx(
                  () => controller.randomNumbers.isNotEmpty
                      ? GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: controller.randomNumbers.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.shuffleNumberAtIndex(index);
                                controller.toggleBoxColor(index);
                              },
                              child: Obx(
                                () => Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: controller.boxColors[index],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                        controller.randomNumbers[index]
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18 * 1.2,
                                        )),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
