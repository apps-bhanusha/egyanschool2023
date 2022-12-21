import 'package:get/get.dart';

class DownloadAllController extends GetxController{



  List<String> dropdata = ["Assinment", "Time Table","Syllebus","other"].obs;
  List<String> Assinment = ["english", "submit date","submit to ","other"].obs;
  List<String>  timeTable = ["hindi ", "10:00::","3 hours","marks :100"].obs;
  List<String> Syllebus = ["english", "hindi","math","computer"].obs;
  List<String> other = ["envent", "hollyday","othe program","meeting"].obs;
  RxList showDataList = [].obs;
  RxString selectDrop = "Download Section".obs;
    
  

  selectDropdown(selectdropdata){
    print("controller");
    print(selectdropdata);
    selectDrop.value=selectdropdata;
    if(selectdropdata=="Assinment"){
       showDataList.value= Assinment;
    }else if(selectdropdata=="Time Table"){
         showDataList.value= timeTable;
    }
    else if(selectdropdata=="Syllebus"){
    showDataList.value= Syllebus;
    }
    else if(selectdropdata=="other"){
    showDataList.value= other;
    }
  }


}


