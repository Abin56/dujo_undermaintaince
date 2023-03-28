import 'package:dujo_website/view/pages/web/admin/admin_notice/admin_notice_update.dart/list_admin_notices.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';
import 'admin_notice/admin_notice.dart';
import 'admin_notice/admin_notice_remove.dart';

class AdminNotice extends StatefulWidget {
  AdminNotice({super.key, this.schoolId = ''});
  String schoolId;

  @override
  State<AdminNotice> createState() => _NoticeCretesState();
}

class _NoticeCretesState extends State<AdminNotice> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTICES'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenSize.width * 1 / 3, top: screenSize.width * 1 / 20),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewNotices(
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Create Notice',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminPageNoticeListPage(
                              schoolId: widget.schoolId),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Edit  Notice',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AdminRemoveNoticePage(schoolId: widget.schoolId),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove  Notice',
                        onTap: () {},
                      )),
                ))),
          ],
        ),
      ),
    );
  }
}
