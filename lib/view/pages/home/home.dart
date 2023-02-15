// ignore_for_file: sort_child_properties_last

import 'package:dujo_website/main.dart';
import 'package:dujo_website/view/colors/colors.dart';
import 'package:dujo_website/view/constants/const.dart';
import 'package:dujo_website/view/fonts/fonts.dart';
import 'package:dujo_website/view/pages/home/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'footer/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFFE8EAF6),
          title: NavigationBarWidget(screenSize: screenSize),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0XFFE8EAF6),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: screenSize.width * 0.35,
                    color: const Color(0xFF3949AB),
                  ),
                  Container(
                    height: screenSize.width * 0.35,
                    width: MediaQuery.of(context).size.width * 0.65,
                    color: const Color(0xFF26A69A),
                  ),
                  Container(
                    //padding: const EdgeInsets.all(0),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.4),
                    // ignore: duplicate_ignore
                    child: ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: screenSize.width * 0.35,
                        color: const Color(0xFF26A69A),
                      ),
                      clipper: CustomClipPath(),
                    ),
                  ),
                  Container(
                    height: screenSize.width * 0.35,
                    width: MediaQuery.of(context).size.width * 0.45,
                    color: const Color(0XFFE8EAF6),
                  ),
                  Container(
                    //padding: const EdgeInsets.all(0),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.2),
                    child: ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: screenSize.width * 0.35,
                        color: const Color(0XFFE8EAF6),
                      ),
                      clipper: CustomClipPath(),
                    ),
                  ),
                  Container(
                      height: screenSize.width * 0.27,
                      margin: EdgeInsets.only(
                          left: screenSize.width * .7,
                          top: screenSize.width * .08),
                      child: Image.asset(
                        "assets/images/ann.png",
                        height: 200,
                      )),
                  Row(children: [
                    Container(
                        height: screenSize.width / 8,
                        width: screenSize.width * 0.2,
                        margin: EdgeInsets.only(
                          left: screenSize.width * .03,
                        ),
                        child: Image.asset(
                          "assets/images/lepdujo.png",
                          height: screenSize.width * 0.2,
                          width: screenSize.width * 0.3,
                        )),
                    Container(
                        width: 10,
                        height: 100,
                        margin: EdgeInsets.only(
                            left: screenSize.width * .001, top: 10),
                        child: const VerticalDivider(
                          color: Colors.red,
                          thickness: 2,
                        )),
                        sizedBoxW20,
                    Container(
                      height: screenSize.width / 7,
                      margin: EdgeInsets.only(top: screenSize.width * 1 / 12),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          // InkWell(
                          //   onTap: () {},
                          //   child: Text(
                          //     "          Professionals",
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: screenSize.width * 1 / 70),
                          //   ),
                          // ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Colleges",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 1 / 70),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Schools",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 1 / 70),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenSize.width / 15,
                        top: screenSize.width * 1 / 6),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Logon,",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 1 / 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Feed Your",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 1 / 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " Mind,",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: screenSize.width * 1 / 40,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Change The",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 1 / 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " World!",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: screenSize.width * 1 / 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.125,
                    margin: EdgeInsets.only(
                        left: screenSize.width * 0.55,
                        top: screenSize.width * 1 / 10),
                    height: screenSize.width * 1 / 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white60, width: 2.0),
                        borderRadius:
                            BorderRadius.circular(screenSize.width * 1 / 150)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/onlineprofessor.png",
                          height: screenSize.width * 1 / 30,
                          width: screenSize.width * 1 / 30,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text("Be a Freelance Faculty  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 1 / 130,
                                )))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenSize.width * 0.805,
                        top: screenSize.width * 1 / 6),
                    height: screenSize.width * 1 / 9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white60, width: 2.0),
                        borderRadius:
                            BorderRadius.circular(screenSize.width * 1 / 150)),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/settings.png",
                          height: screenSize.width * 1 / 25,
                          width: screenSize.width * 1 / 25,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text("Configure Your Class Room",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.width * 1 / 90,
                              )),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text("Add Recorded Courses",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.width * 1 / 90,
                              )),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Add Online Courses",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenSize.width * 1 / 90,
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text("Configure Your Class Room,and More",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 1 / 90,
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenSize.width * 0.58,
                        top: screenSize.width * 0.22),
                    height: screenSize.width * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white60, width: 2.0),
                        borderRadius:
                            BorderRadius.circular(screenSize.width * 1 / 150)),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/hybrid.png",
                          height: screenSize.width * 0.06,
                          width: screenSize.width * 0.08,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text("Invite Students",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width / 90,
                                )))
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenSize.width * 0.1,
                            top: screenSize.width * 0.3),
                        height: screenSize.width * 1 / 35,
                        width: screenSize.width / 8,
                        decoration: BoxDecoration(
                            color: const Color(0xFF224D83),
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child:
                                //Image.asset("assets/images/hybrid.png",height: 100,width: 150,),
                                Text("Explore Courses",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenSize.width * 1 / 80,
                                    ))),
                      )),
                ]),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: Row(children: const <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                  ]),
                ),
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Text("Online Courses",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text("Recorded Courses",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text("Hybrid Courses",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text("Study Materials",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Text("Mock Tests",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: Row(children: const <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: screenSize.height * 1 / 10,
                      width: screenSize.width - 100,
                      decoration: BoxDecoration(
                          //color: Color(0xFF224D83),

                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            height: screenSize.height * 1 / 15,
                            width: screenSize.width * 1 / 5,
                            child: const TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  //border: OutlineInputBorder(),
                                  hintText: 'Courses',
                                  hoverColor: Colors.transparent),
                            ),
                          ),
                          SizedBox(
                              height: screenSize.width * 1 / 35,
                              width: screenSize.width * 1 / 35,
                              child: const VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            height: screenSize.height * 1 / 15,
                            width: screenSize.width * 1 / 5,
                            child: const TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  //border: OutlineInputBorder(),
                                  hintText: 'Tutor',
                                  hoverColor: Colors.transparent),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: screenSize.width * 1 / 8,
                            decoration: BoxDecoration(
                                color: const Color(0xFF26A69A),
                                border: Border.all(
                                    color: Colors.white60, width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(child: Text("Search")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'data:image/png;base64,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')),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "IT",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://media.istockphoto.com/id/1180939305/vector/iot-icons-set-smart-appliances-concept-of-future.jpg?s=612x612&w=0&k=20&c=MTyEZHKgw0wwsDJcXZjfD1e2SKnDuURLdsqTb2kKnr0=',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("IOT",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://thumbs.dreamstime.com/z/biology-science-icons-set-blue-white-molecular-30369756.jpg',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("SCIENCE",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjtJHjMZb09s2xCpUAzdPTQ-vG10DzCRLvtcFA-AftIAs89RARh1fHbXdK03YFE7cs4S0&usqp=CAU',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("MEDIA",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAwFBMVEX////69/dSj9j9gIcFc87e2+5OjddVkdl1pN/9fYT//Pn8+vr6+/v8pKn//flDiNb9ho2AquD9eYGIruHi3u/s6vX71Nb73t/U3u/9dn4Aa8xcldrz8/b66uv9i5H8naLe5fGuxuj8rrJqndymwOaRs+LF1ez8uLv8wcT65eb7zc/9lZv66Ok4hNTn7/kAbcy5zer8qa4getCXvOYSeNBkmtvX4fD/kZFpjc2Ki8K0h7C91e/jg5W/hqn/x8j70dOO87qCAAAK9ElEQVR4nO2dfV/iuhLHCXiDbYKFuorIk4rPCOvq4j337jnr+39XpyBiJ03zRJuELr//ztqeT77MZGYySdtaba+99tprrwL1djnB0Zdwf3FYhjrXtwMnfM+z8/PvBxu9RLg0RVHnzDrf2ez8IKUX3KyXKRx15nYBX7+n+Q5m5fKtGPGtTcDOOQQsnW+JGD3bA7w5t23BlWbWrHgLAV8sASaOamku0hcAeIAtASaIh3YIX9346FKRHT/96cqEtozIzkKLgIkRbcxE+6kwTWgjY0TunDRx0xsLhMw0tApYxxMLhBDwwKqT1nG/8oRN3wmXa6EqE+KoOZn0oy0Y/SbE0fHZYIAGFzfmjF4T4vpbSFAiEs4npog+E+L+PERrEWSK6DXh2QYwQZzXzRA9JsTHKUCEwsuoaoTRBUkTooGZEf0lxAtgwsSIxxUjjC4ZQnJr5KYeEw4Qo7BvYkRvCXEnzBBeV4owus0QormJm/pKiPsZJ02MeGhgRG8JX7MmROEvAyN6S8gkw3VKbOob0VNCPOGYMDHiTWUIM8lwnRLP9N3UV0JOnFkhLrSN6Cch7hzxCQ3Kbz8Jo1tenFnFmmoQ4n4OH0JH2inRT8JrbpxZTUTt8ttPQm4yXEs3JfpIiA8FgOFrBQijZ+CkgwvgpheabuohIcYgGYbPN3BWasYaHwmZDtRhkyHWM6KHhNEZmIbziFkqDvT2MfwjxE1owmvMLPeP9DpSHhLCZLhszsAqVbP89o8QtklXOMxKI9RqnHpHyCTD1YoQ91nH3WVCNhmuShgm+GilRN8IMTc1YJgSiU5K9I4QJkPSwfncu0mYSYbrf2Z8V6P77RlhXkzhxZ8dJWSS4WapFMHyWyMlekYYzXNAOHXAThLiQ8jxVZ/huumGsF+E0S9OMlz/CYYg9Y6UV4SipICPQYMx7Ki6qV+EgsSO62CKhsodKa8IoScy/Qqm/FZOiT4R4gUCZoIFNp7Av6p2pLwihBmBMFZillVvO0iYmwzXQ4WbpqHiMTCPCPEhiJaZZgVuQjdVLL89ImQbTpmnE2fsBTtGiOtMN6ZzzOrapCPlESHT+CVhVvACtfLbH8LoTbBbwZdSSvSGkEl3KlLrSHlDmHM2QSRysVOEeC5HyhhRpSOFmzlnArYUIXqEzMpQTUopsSzCRESHkHdQTy6VTZoSCb8Y5YQYawfSpVQ6UqUSfiIqEPIO6in8/9/kblouIUKKhAbJcCWFjlTZhESJ0CAZfkihI1U24QpRSmiQDNc6cW7DlZ/KCJkeDOJUpHnFqbwjVT4hUSCE29jktSMS7MdJO1LlEyI5oXRlCN48o9mR8oEQ18H1kuiBJ3CTRtaRskBIpISvsH0hsQrbkZK4qZyQUErNkpUqoe6QmR9EcmxYRkho9/7uvkvpFogSQubUurQSYyo8WfktIaTdaS+O496ouwWihFB7fzdzRmoLQnoaBI2lgvjRHFFmQ90NCSa5SFKimHD4wbdU/GA8GcWEeAITnHxTCTO/ibiZISSkP74Ig7GxEWWE4OK5wrIdpkRZdhHasJFS8FQSIXiGS2lzF/4oW9iQdIMUYXxq6qaySJNOFqHSIyNgsSXZwBATxoDQ1E1lkSbVClbc+EzHmlCSPz0grEeb5+6J6r7nV8IgaIuMb4sQ47OjldcdDVRfnIDx7cct4UAWe30gTMZ7c5Es/AaX6s9S4Oj4bXnLs9ToXhAuB1yf9COtF5jgCC9UbvGEcGlH/efulG7xhrA0/RGENFcsYa78Jgzfr1o5GqdrmmCad9nVIxIyuiWsN/8bB7lK16WN/MvittCDXRPGje0VxL8FiK4JAzmAgkTLR7dvFaz/VQxh0Mo3Ym0GCS2/GfJ/xRA2YoGXHsO3e0ZW3RT/vyDCXr6b1n65fEMr/tsCIYVe+tPqW3b/KoZP7KWsm9p8CS3+pyATihpVtdrAWTRNTFhUoOkKskWtdunqddfR2+8iEn4CeCfK+IkOIaLZ6/MMAC9D+hjE25oxiON7YdW2VJ9BtGLFaHnEgw7vp+2V4LDbfPEumt4NxZV3jWNFK19/WHeO1ysgMgIriSF/mQQQ20ht9fSh55+Wv+CxOIN7/ukWfjKxuH5HH9PTVrXR/3n4a3DzPf0RloPZklHczVVV9rZo8YyYAx7M6Ke8sdKW/FfIJ0z063j2M5U5XmaRqNeCm6qqw/9YdC4vwuwBlicQcbiLhSG4JBBkiBxCjvLDanSteryz9g0qDEPe0OgUTMSrrIHoPcgtI8WNDENC3FEGrP0HKmcgzPgbnCtGst+gQELcp0UTomEPuGlm15d2wQU9RSc1I9T7fooiIeOmowwh+HujrdpdNCLU+7aIKiEs4dgGKWyfigu1rQk1oowGIRsqp9ALYapoxE+qO6YGhDpRRocQJn3GiHBHWGdfX59Q+4sNqoSMH8KsT8cC/GIJ9b/SpErIxpJ0OKUM/UiVz4BQ/wtG6oTvzHLxa6rBXNgQtoC3JIwudQHVCTMcm3jJlgOceqAowuhYG1CH8BGCBOvqlAwhn2rRbUCIF/qAGoQIrhI3GYMJM1om1CM0+xacBiF9B5XZ2lisabVMqEcYGX1cU4MQERhOG70Hmvgo47sagVST0CDK6BIyWWFJQ1jq+F1rw1uD0CTK6BKyxVkj/kGvGOip3o6+OqFRlNEmRIxLNgIGudFTrkg1CXHT9Dt3eoSU7RIzgOqLCiXC1KEmsyijT5gJNgyvXpiREr5ujGgYZUwIH0SEsfahdvHgNs+BmkYZA8Ksn27jozLC2ll9yYgjzSXhVoTZEubLR6f6J4Vlw5vf4Fm02OpTk9qEzGo/bULNOKpCWKvRwZafQtcnpKd8P+2ZPHax3eBLIsyulj4sqNoi3QFCtmfzMQnHBnz+Er5zCM0eDfKTMMdL9VOFp4QUtXocwARxLD5ouSuEtDvKS/lBW/85Pe8ICb0L8su2IImnhVbe9gnpQ64B156qa0a/CCm6k54+ScwoPnzhMSGh7xIDfprxUePpZ38ICX2Yqh4fiqddZUZfCAl9avV4fOyJ9vW/9sYPiox+ECb2u+JH0Hj6MOZ6bhC31Bh9IEz4WjkZotdClFzx838QjFV81QNCOhznzL/gs+edwx8kFpaGVfeEtJuX4TcVTH6SDORbpe4JUTsHMB5v8h5FP/iemmjoOyG945uHeRAm31N/qJ1NdEeIRjkxlClckgUH/6doS4zonPCJm+4a99koSR/b3FWj5IUSrgnJQ3bUQa/FrTzp8IpTFMiOf7kmRMPMkOPRaV6ao91sYRd4bkP2iElSVv8m+bGD0MeR5n6pe0JwxCRu3EkaFRTdg+ko3fJ2TojoV90Zx5Jz95+Mwdct0j6/e0JEW6u5Fcjtl2Jsr++R91A9IET0dNxutKe/NRppFD1Ok3vGCi1UHwgRpcPhUBBfuIzLe1S6Ul4Qlqo94Z5QQd/+NMKc75bvMuGJU0IiH+DWGkDCk+oRUkj4zS6hBUC3bmrDhBk3tWpEK4AujWjHhDU26Vs0oi3AGnGEaA3Q1VS05qNLkW/2EW3yLcWEm9ITv1UDfoicQDuelBlTHfCtRAcnQANEVCXEYeUIb0sJCF0PrSAJrOh6aEVJ+JKdaqj6hLmIrsdVoKpPmDMVXQ+rSPERXY+qUFWfkIvoekwFq/qEnKnoekhFK4voekSFK4PoekDFq/qELKLr4ZQgUnlCBtH1aEpR9QnTiDvalpGq+oSk4k5a2yBW1YIrEVJtvr322msvb/QvXkN+BkDsUUkAAAAASUVORK5CYII=',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("LANGUAGES",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIreTxNQxZumtKHoeDS41QqqA1xjAgk7XTLBTRcOFI39sBldCudbzDL-PMQJnEuRBqlRA&usqp=CAU',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("TECHNOLOGY",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFF26A69A),
                ),
                sizedBoxH10,
                FooterSection()
              ],
            ),
          ),
        ));
  }
}
