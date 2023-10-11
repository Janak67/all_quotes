import 'dart:io';

import 'package:all_quotes/Model/quotes_model.dart';
import 'package:all_quotes/Utills/app_color.dart';
import 'package:all_quotes/Utills/image_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:share_plus/share_plus.dart';

class QuotesEditScreen extends StatefulWidget {
  const QuotesEditScreen({Key? key}) : super(key: key);

  @override
  State<QuotesEditScreen> createState() => _QuotesEditScreenState();
}

class _QuotesEditScreenState extends State<QuotesEditScreen> {
  int colorbgindex = 0, fontcolor = 2, image = 0;
  bool bold = false;
  bool italic = false;
  TextAlign txtAlign = TextAlign.center;
  bool isimageindex = true;
  int fontStyle = 0;
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    QuotesModel model =
        ModalRoute.of(context)!.settings.arguments as QuotesModel;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RepaintBoundary(
                key: globalKey,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.63,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorbg[colorbgindex],
                      ),
                    ),
                    Visibility(
                      visible: isimageindex,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isimageindex = false;
                          });
                        },
                        child: Image.asset(
                          "assets/img/bg/${imageList[image]}",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.63,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectableText(
                          "${model.quotes}",
                          textAlign: txtAlign,
                          style: TextStyle(
                              fontFamily: fontList[fontStyle],
                              color: colorbg[fontcolor],
                              fontSize: 30,
                              fontWeight:
                                  bold ? FontWeight.bold : FontWeight.normal,
                              fontStyle:
                                  italic ? FontStyle.italic : FontStyle.normal),
                        ),
                        // SelectableText(
                        //   "Hello",
                        //   style: TextStyle(color: Colors.white, fontSize: 25),
                        //   textAlign: TextAlign.center,
                        //   onTap: () => print('Tapped'),
                        //   contextMenuBuilder: (context, editableTextState) {
                        //     ContextMenuPreviewBuilder(copy:true,selectAll:true);
                        //   },
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await saveImage();
                                },
                                icon: const Icon(
                                  Icons.download,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    txtAlign = TextAlign.left;
                                  });
                                },
                                icon: const Icon(
                                  Icons.format_align_left,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    txtAlign = TextAlign.center;
                                  });
                                },
                                icon: const Icon(Icons.format_align_center,
                                    color: Colors.black)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    txtAlign = TextAlign.right;
                                  });
                                },
                                icon: const Icon(Icons.format_align_right,
                                    color: Colors.black)),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (fontcolor < colorbg.length - 1) {
                                    fontcolor++;
                                  } else {
                                    fontcolor = 0;
                                  }
                                });
                              },
                              icon: const Icon(Icons.text_rotation_none,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (colorbgindex < colorbg.length - 1) {
                                    colorbgindex++;
                                  } else {
                                    colorbgindex = 0;
                                  }
                                  isimageindex = false;
                                });
                              },
                              icon: const Icon(Icons.color_lens,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Clipboard.setData(
                                      ClipboardData(text: "${model.quotes}"));
                                });
                              },
                              icon: const Icon(Icons.copy, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  bold = !bold;
                                });
                              },
                              icon: const Icon(Icons.format_bold_sharp,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  italic = !italic;
                                });
                              },
                              icon: const Icon(Icons.format_italic,
                                  color: Colors.black),
                            ),
                            IconButton(
                                onPressed: () async {
                                  File file = await saveImage();
                                  await Share.shareXFiles([XFile(file.path)]);
                                  // ShareExtend.share(path['filePath'], "image");
                                },
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.black,
                                )),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  colorbgindex = 0;
                                  fontcolor = 2;
                                  image = 0;
                                  bold = false;
                                  italic = false;
                                  txtAlign = TextAlign.center;
                                  isimageindex = true;
                                  fontStyle = 0;
                                });
                              },
                              icon: const Icon(Icons.restart_alt,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: imageList.length,
                          itemExtent: 100,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isimageindex = true;
                                      image = index;
                                    });
                                  },
                                  child: Image.asset(
                                    "assets/img/bg/${imageList[index]}",
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: fontList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  fontStyle = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Hello  ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: fontList[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<dynamic> saveImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    String imagepath = ("${DateTime.now().year},"
        "${DateTime.now().month},"
        "${DateTime.now().day},"
        "${DateTime.now().hour},"
        "${DateTime.now().minute},"
        "${DateTime.now().second},");
    return await File("/storage/emulated/0/Download/$imagepath.png")
        .writeAsBytes(byteData!.buffer.asUint8List());
  }
}
