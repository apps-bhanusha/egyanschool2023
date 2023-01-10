import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



import 'package:google_fonts/google_fonts.dart';
class DownloadAll extends StatefulWidget {
  const DownloadAll({super.key});

  @override
  State<DownloadAll> createState() => _DownloadAllState();
}

class _DownloadAllState extends State<DownloadAll> {
  final DownloadAllController _downloadAllController =
      Get.put(DownloadAllController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text('Download',style: MyGoogeFont.mydmSans),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) {
              return <PopupMenuEntry<int>>[
                const PopupMenuItem(child: Text('0'), value: 0),
                const PopupMenuItem(child: Text('1'), value: 1),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Center(
                child: Card(
                  color: Color.fromARGB(255, 164, 229, 255),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        DropdownButton<String>(
                          autofocus: true,
                          isExpanded: true,
                          hint: Obx(
                            () => Text(
                                _downloadAllController.selectDrop.value,
                                style: const TextStyle(
                                  fontSize: 20,color: Colors.black)),
                          ),
                          items: _downloadAllController.dropdata
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style:
                                    const TextStyle(color: Colors.blueAccent),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            print(newValue);

                            _downloadAllController.selectDropdown(newValue);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Obx(
                    () => ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Color.fromARGB(255, 164, 229, 255),
                          child: ListTile(
                            title:
                                Obx(() => Text(_downloadAllController.showDataList[index])),
                                subtitle: Text("date"),
                                trailing: Icon(Icons.download),
                          ),
                        );
                      },
                      itemCount: _downloadAllController.showDataList.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
