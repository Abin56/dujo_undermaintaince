import 'package:flutter/material.dart';

class LetterPadScreen extends StatelessWidget {
  LetterPadScreen(
      {super.key,
      this.schoolName = '',
      this.logoImageUrl = '',
      this.schoolAddress = '',
      this.telePhone = '',
      this.phone = '',
      this.email = '',
      this.date = '',
      this.refNo = ''});
  final double a4Width = 793.7007874;
  final double a4Height = 1122.519685;
  String schoolName;
  String logoImageUrl;
  String schoolAddress;
  String telePhone;
  String phone;
  String email;
  String date;
  String refNo;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Container(
                width: a4Width,
                height: a4Height,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: HeaderContent(
                        schoolName: schoolName,
                        schoolAddress: schoolAddress,
                        telePhone: telePhone,
                        phone: phone,
                        email: email,
                        date: date,
                        logoImageUrl: logoImageUrl,
                        refNo: refNo,
                      ),
                    ),
                    FooterContent(a4Width: a4Width)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  HeaderContent({
    this.schoolName = '',
    this.logoImageUrl = '',
    this.schoolAddress = '',
    this.telePhone = '',
    this.phone = '',
    this.email = '',
    this.date = '',
    this.refNo = '',
    super.key,
  });
  String schoolName;
  String logoImageUrl;
  String schoolAddress;
  String telePhone;
  String phone;
  String email;
  String date;
  String refNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //logo widget
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2014/12/28/13/20/wordpress-581849_960_720.jpg'),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      schoolName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      schoolAddress,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tel. No : $telePhone Mob : $phone Mail : $email',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: Colors.black,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Ref No:$refNo'),
              Text('Date:$date'),
            ],
          )
        ],
      ),
    );
  }
}

class FooterContent extends StatelessWidget {
  const FooterContent({
    super.key,
    required this.a4Width,
  });

  final double a4Width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Divider(
            thickness: 5,
            color: Colors.black,
          ),
          SizedBox(
            width: a4Width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(''),
                Text('Signed By'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
