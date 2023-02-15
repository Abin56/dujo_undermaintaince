import 'package:dujo_website/model/upload_rec_videos/rec_video_upload_model.dart';
import 'package:dujo_website/view/colors/colors.dart';
import 'package:dujo_website/view/constants/const.dart';
import 'package:dujo_website/view/pages/Login/Admin/recorded_section/rec_drop_down/rec_course_drop_down-button.dart';
import 'package:dujo_website/view/pages/widgets/button_container_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  String? networkImage;
  String? networkVideoPath;
  double progress = 0.0;
  double videoProgress = 0.0;

  TextEditingController videoNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dujothemeColor,
        title: const Text("Video Upload Section"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: networkImage == null
                  ? Center(
                      child: Column(
                        children: [
                          const Text("Please Upload thumbail"),
                          const SizedBox(
                            height: 10,
                          ),
                          const CircularProgressIndicator(
                            color: Colors.red,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                Uint8List? file = result.files.first.bytes;
                                String filename = result.files.first.name;
                                UploadTask task = FirebaseStorage.instance
                                    .ref()
                                    .child("files/images/$filename")
                                    .putData(file!);
                                task.snapshotEvents.listen(
                                  (event) {
                                    setState(
                                      () {
                                        progress = ((event.bytesTransferred
                                                        .toDouble() /
                                                    event.totalBytes
                                                        .toDouble()) *
                                                100)
                                            .roundToDouble();
                                        if (progress == 100) {
                                          event.ref.getDownloadURL().then(
                                            (thumbnailUrl) {
                                              setState(
                                                () {
                                                  networkImage = thumbnailUrl;
                                                },
                                              );
                                            },
                                          );
                                        }
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            child: ButtonContainerWidget(
                              curving: 10,
                              colorindex: 0,
                              height: 60,
                              width: 200,
                              child: const Center(
                                child: Text(
                                  "Select Image",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(networkImage!),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    controller: videoNameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      helperText: 'Enter video Name',
                      helperStyle: TextStyle(color: Colors.black),
                      isDense: true,
                      filled: true,
                      fillColor: Color.fromARGB(0, 16, 16, 16),
                      hintText: 'Video Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const VideoCourseDropDownButton(),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            Uint8List? file = result.files.first.bytes;
                            String filename = result.files.first.name;
                            UploadTask task = FirebaseStorage.instance
                                .ref()
                                .child("files/images/$filename")
                                .putData(file!);
                            task.snapshotEvents.listen(
                              (event) {
                                setState(
                                  () {
                                    videoProgress = ((event.bytesTransferred
                                                    .toDouble() /
                                                event.totalBytes.toDouble()) *
                                            100)
                                        .roundToDouble();
                                    if (videoProgress == 100) {
                                      event.ref.getDownloadURL().then(
                                        (videoUrl) {
                                          setState(
                                            () {
                                              networkVideoPath = videoUrl;
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          }
                        },
                        child: ButtonContainerWidget(
                          curving: 30,
                          colorindex: 5,
                          height: 60,
                          width: 200,
                          child: Center(
                            child: Text(
                              "Upload Video",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                 sizedBoxH30,
                      SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: LiquidCircularProgressIndicator(
                          value: videoProgress / 100,
                          valueColor:
                              const AlwaysStoppedAnimation(Colors.pinkAccent),
                          backgroundColor: Colors.white,
                          direction: Axis.vertical,
                          center: Text(
                            "$videoProgress%",
                            style: GoogleFonts.poppins(
                                color: Colors.black87, fontSize: 25.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final details = VideoUploadModel(
                            dateTime: DateTime.now(),
                            videoImage: networkImage!,
                            course: dropDownValue!["id"],
                            videoPath: networkVideoPath!,
                            videoName: videoNameController.text.trim(),
                          );
                          VideoUploadToFireBase()
                              .videouploadModelController(details, context);
                        },
                        child: ButtonContainerWidget(
                          curving: 30,
                          colorindex: 5,
                          height: 60,
                          width: 200,
                          child: Center(
                            child: Text(
                              "Upload to Server",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
