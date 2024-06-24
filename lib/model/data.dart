import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prosodygame/Widgets/gameForm.dart';
import 'package:path_provider/path_provider.dart';

class Data {

  // hive local storage
  static var myMap = Hive.box("myBox");
  Future<void> setMyMap() async {
    Hive.openBox("myBox");
    await openHiveBox("myBox");
    if (myMap.toMap().isEmpty) {
      // levels opener
      myMap.put(2, false);
      myMap.put(3, false);
      // whole scores
      myMap.put(4, 0);
      myMap.put(5, 0);
      // temp scores
      myMap.put(6,0);
      myMap.put(7, 0);
    }
  }
  Box getMyMap() {
    return myMap;
  }

  Future<Box> openHiveBox(String boxName) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName))
      // ignore: curly_braces_in_flow_control_structures
      Hive.init((await getApplicationDocumentsDirectory()).path);

    return await Hive.openBox(boxName);
  }

  static int groupNumber = 0;

  static List<String> prosodiesNames =
  ["الطويل", "المديد", "البسيط", "الوافر", "الكامل",
    "الهَزَج", "الرمل", "السريع", "المنسرح", "الخفيف",
    "المضارع", "المقتضب", "المجتث", "المتقارب", "المتدارك"];

  // الأبحر lists
  static List<String> g1 =
  ["الطويل", "المديد", "البسيط", "الوافر", "الكامل"];

  static List<String> g2 =
  ["الهَزَج", "الرمل", "السريع", "المنسرح", "الخفيف"];

  static List<String> g3 =
  ["المضارع", "المقتضب", "المجتث", "المتقارب", "المتدارك"];


  // abyat lists
  static List<List<String>> abyatG1 = [
    // الطويل
    [
      "قال المتنبي:\nعلى قَدرِ أهلِ العزمِ تأتي العزائمُ\nوتأتي على قَدرِ الكرامِ المكارمُ",
      "قال المتنبي:\nوما الحُسنُ في وجهِ الفتى شرفًا لهُ\nإذا لم يكن في فعلِهِ والخلائقِ",
      "قال المتنبي:\nوما تنفعُ الخيل الكرامُ ولا القنا\nإذا لم يكن فوقَ الكرامِ كرامُ",
      "قال أبو فراس الحمداني:\nإذا صحَّ منك الوُدُّ فالكلُّ هيِّنٌ\nوكُلُّ الذي فوقَ التُّرابِ تُرابُ",
      "قال أبو فراس الحمداني:\nإذا الليلُ أضواني بسطتُ يدَ الهوى\nوأذللتُ دمعًا من خلائقِهِ الكِبرُ"
    ],
    // المديد
    [
      "قال طرفة بن العبد:\nللفتى عقلٌ يعيشُ بهِ\nحيثُ تَهدي ساقَه قدمُهْ",
      "قال أبو العتاهية:\nوكَذا الدُّنيا على ما رأينا\nيذهبُ النَّاسُ وتخلو الدِّيارُ",
      "قال أبو العتاهية:\nعجبًا مِن راغبٍ في حرامٍ\nلم تَضِقْ عنهُ وجوهُ الحَلالِ",
      "قال أبو العتاهية:\nهل ترى الدُّنيا بعيني بصيرٍ\nإنما الدُّنيا تُحاكي السَّرابا",
      "قال أبو العتاهية:\nاغتنم وصلَ أخٍ كانَ حيًّا\nفكفى بالموتِ بُعدًا وهجرا"
    ],
    // البسيط
    [
      "قال كعب بن زهير-رضي الله عنه-:\nإنَّ الرسولَ لَنُورٌ يُستضاءُ بهِ\nمُهنَّدٌ من سيوفِ اللهِ مسلولُ",
      "قال المتنبي:\nالخيلُ والليلُ والبيداءُ تعرفني\nوالسَّيفُ والرُّمحُ والقِرطاسُ والقلمُ",
      "قال المتنبي:\nعِيدٌ بأَيَّةِ حالٍ عُدتَّ يا عِيدُ\nبما مضى أم لأمرٍ فيك تجديدُ",
      "قال المتنبي:\nما كُلُّ ما يتمنَّى المرءُ يدركُهُ\nتجري الرياحُ بما لا تشتهي السُّفُنٌ",
      "قال أبو تمام:\nالسَّيفُ أصدقُ إنباءً من الكُتُبِ\nفي حَدِّهِ الحَدُّ بين الجِدِّ واللَّعِبِ"
    ],
    // الوافر
    [
      "قال المتنبي:\nولم أرَ في عيوبِ الناسِ شيئًا\nكنَقصِ القادرينَ على التَّمامِ",
      "قال الشافعي:\nإذا ما كنتَ ذا قلبٍ قَنوعٍ\nفأنت ومالكُ الدُّنيا سواءُ",
      "قال أحمد شوقي:\nفلم أرَ غيرَ حُكمِ اللهِ حُكمًا\nولم أرَ دونَ بابِ اللهِ بابا",
      "قال أبو العلاء المعرِّي:\nومَن كُتبَت مَنِيَّتُهُ بأرضٍ\nفليس يموتُ في أرضٍ سواها",
      "قال غازي القصيبي:\nأجل، نحنُ الحجازُ ونحنُ نجدُ\nلنا مجدٌ هنا، وهناك مجدُ"
    ],
    // الكامل
    [
      "قال حسان بن ثابت-رضي الله عنه-:\nبِيضُ الوجوهِ كريمةٌ أحسابُهم\nشمُّ الأنوفِ من الطرازِ الأوَّلِ",
      "قال المتنبي:\nلا يسلمُ الشَّرفُ الرَّفيعُ من الأذى\nحتَّى تراقَ على جوانبهِ الدَّمُ",
      "قال أبو تمام:\nنقِّل فؤادَك حيثُ شِئتَ من الهوى\nما الحُبُّ إلا للحبيبِ الأوَّلِ",
      "قال أحمد شوقي:\nإِنَّ الشَّجاعَةَ في الرِّجالِ غلاظةٌ\nما لم تَزِنها رأفةٌ وسخاءُ",
      "قال أبو الحسن التهامي:\nجاورتُ أعدائي وجاورَ ربَّهُ\nشتَّانَ بين جوارِهِ وجُوارِي"
    ]
  ];

  static List<List<String>> abyatG2 =
  [
    // الهَزَج
    [
      "قال أبو فراس الحمداني:\nغِنى النَّفسِ لـمَن يَعقِــ \nـــــلُ خيرٌ مِن غِنى الـمَالِ",
      "قال أبو فراس الحمداني:\nومَن لم يَعرفِ الشرَّ\nمِنَ الخيرِ يقَع فِيهِ",
      "قال أبو العتاهية:\nلقد هانَ على النَّاسِ\nمَن احتاج إلى النَّاسِ",
      "قال أبو العتاهية:\nمتى ترغب إلى النَّاسِ\nتكن للنَّاسِ مملوكا",
      "قال فخري البارودي:\n فهُبُّوا يا بني قومي\nإلى العلياءِ بالعِلمِ"
    ],
    // الرمل
    [
      "قال الأخطل:\nما يَضيرُ البحرُ أمسى زاخرًا\nأن رمى فيهِ غُلامٌ بحَجَر",
      "قال أبو تمام:\nليس مِنَّا مَن شكا عِلَّتَه\nمَن شكا ظُلمَ حبيبٍ ظلما",
      "قال لسان الدين بن الخطيب:\nجادك الغيثُ إذا الغيثُ همى\nيا زمانَ الوَصلِ بالأندلسِ",
      "قال أبو العتاهية:\nكُلُّ نَفسٍ سَتُوَفّى سَعيَها\nولها ميقاتُ يَومٍ قد وجَب",
      "قال أبو العتاهية:\nرحمَ اللهُ امرأً أنصفَ مِن\nنفسِهِ إِذ قالَ خيرًا أو صَمَت"
    ],
    // السريع
    [
      "قال أبو فراس الحمداني:\nهَيهاتَ ما في الناسِ مِن خالِدِ\nلا بُـدَّ مِـن فَقـدٍ ومِـن فاقِـدِ",
      "قال غازي القصيبي:\nأُغالبُ الآلام مهما طَغَت\nبـ(حسبيَ اللهُ ونِعمَ الوكيل)",
      "قال ابن الرومي:\nوقد نرى الأرواحَ تُهدي لنا\nنشرًا من الأَطيبِ فالأطيبِ",
      "قال البحتري:\nشِبتُ فما أَنفَكُّ مِن حسرةٍ\nوالشَّيبُ في الرَّأسِ رسولُ الرَّدى",
      "قال أبو العتاهية:\nما أَزيَنَ الحِلمَ لأَربابِهِ\nوغايةُ الحِلمِ تمامُ التُّقى"
    ],
    // المنسرح
    [
      "قال المتنبي:\nوكيـــف لا يُحسَــدُ امــرُؤٌ عَلَــمٌ\nلهُ علــى كُــلِّ هامــةٍ قَــدَمُ",
      "قال المتنبي:\nتُعــرَفُ فــي عينِــهِ حقـائِقُهُ\nكـأَنَّهُ بالـــذَّكاءِ مُكتحِــلُ",
      "قال أبو العتاهية:\nإِيَّاكَ أن تأمنَ الزَّمانَ فما\nزالَ علينا الزَّمانُ يَنقلبُ",
      "قال أبو العتاهية:\nالموتُ حقٌّ والدَّارُ فانيةٌ\nوكلُّ نفسٍ تُجزى بما كسبت",
      "قال الشافعي:\nصبرًا جميلًا، ما أقربَ الفرجا \nمَن راقبَ اللهَ في الأمورِ نجا"
    ],
    // الخفيف
    [
      "قال المتنبي:\nوإذا كانت النُّفوسُ كبارًا\nتعبَت في مُرادِها الأجسامُ",
      "قال المتنبي:\nوإذا لم يكن مِنَ الـموتِ بٌدٌّ\nفمِن العجزِ أن تموت جبانا",
      "قال أبو ماضي:\nوالذي نفسُهُ بغيرِ جَمالٍ\nلا يرى في الوجودِ شيئًا جميلا",
      "قال أحمد شوقي:\nإنَّ سهمًا أصابَ منك حبيبًا\n وقعُهُ في القلوبِ والأكبادِ",
      "قال محمود سامي البارودي:\nإِنَّما هذهِ الحياةُ غُرُورٌ\nتَنقَضي بالشَّقاءِ والحِرمانِ"
    ]
  ];

  static List<List<String>> abyatG3 =
  [
    // المضارع
    [
      "قال أبو حيان الأندلسي:\nرماني الرَّشا بِسَهمٍ\nمُصـيبٍ بِـهِ فُـؤادي",
      "قال أبو نواس:\nحبيــبي بأَيِّ ذنـبٍ\nبهِجرانِــكَ ابتُلِيــتُ",
      "قال ابن عبد ربه:\nأرى للصِّبا وداعا\nوما يذكرُ اجتماعا",
      "قال الشريف المرتضى:\nوكـم ذا أجـودُ دهـرِي\nلـمَــن ليـس بـالجوادِ",
      "قال الشاعر:\nألا مَن يبيعُ نومًا\nلِـمَن قطُّ لا ينامُ"
    ],
    // المقتضب
    [
      "قال أبو نواس:\nحاملُ الهوى تَعِبُ\nيستخفُّهُ الطَّربُ",
      "قال صفي الدين الحلي:\nليس عنك مُصطبَـرُ\nحين أسعدَ القَدَرُ",
      "قال بشارة الخوري:\nقد أتاك يعتذرُ\nلا تسلهُ ما الخَبَـرُ",
      "قال خليل مطران:\nالقلوبُ والـمُقَلُ\nهُنَّ للهوى رُسُلُ",
      "قال مصطفى صادق الرافعي:\nهـل لذا الجفا سببُ\nأم صـــدودُهُ لعِــبُ"
    ],
    // المجتث
    [
      "قال ابن زيدون:\nمتى أبُثُّك ما بي\nيا راحتي وعذابي",
      "قال أبو فراس الحمداني:\nيا معشرَ النَّاسِ هل لي\nمِمَّــا لَقيــتُ مُجيـرُ",
      "قال أبو العتاهية:\nمــا تَـأتِهِ مِـن جَميـلٍ\nيُكســِبكَ أجـرًا وحمـدا",
      "قال أبو نواس:\nالـمَـوتُ مِنّـَا قَريـبٌ\nوليـسَ عنّـَا بِنـازِح",
      "قال أحمد رامي:\nرُوحي جَنَيْتُ عليها\nلكِن بِغَيرِ اختياري"
    ],
    // المتقارب
    [
      "قال المتنبي:\nكـأنْ لـم يكـن بعد أن كان لي\nكمـا كـان لـي بعد أن لم يكُن",
      "قال الأحوص:\nلقد شاقكَ الحيُّ إِذ وَدَّعوا\nفعينُك في إِثرِهم تدمَعُ",
      "قال أحمد شوقي:\nوكم في الجديدِ من الطيِّبات\nوإن ضربوا بالقديمِ الـمَثَل",
      "قال محمود سامي البارودي:\nيلومُ على غيرِ ذَنبٍ جرى\nويغضبُ مِن قَبلِ أَن يفهما",
      "قال أبو العتاهية:\nأَشَدُّ الجِهادِ جِهادُ الهوى\nوما كَرَّمَ الـمَرءَ إِلا التُّقى"
    ],
    // المتدارك
    [
      "قال الحصري:\nكلَّا لا ذَنْبَ لمَن قَتَلَت\nعيناهُ ولم تَقتُل يدُهُ",
      "قال المفتي:\nلكَ يا مولايَ بَسطتُ يدي\nوعليكَ إِلهي مُعتَمدي",
      "قال أحمد شوقي:\nبيني في الحُبِّ وبينَكَ ما\nلا يَقدِرُ واشٍ يُفسِدُهُ",
      "قال لسان الدين بن الخطيب:\nوأقامَ الحقَّ وجاءَ بهِ\nفإذا بالباطلِ قد زهقا",
      "قال أبو حيان الأندلسي:\nنظرت عينايَ محاسنَهُ\nوالحُبُّ يُهَيِّجُهُ النَّظَرُ"
    ]
  ];

  static bool isHome = true;
  bool getIsHome(){return isHome;}
  void setIsHome(bool b){
    isHome = b;
    gameIsActive = false;
  }

  static int index = indexTrack[indexOfTracker];

  static int indexOfTracker = 0;

  static List<int> indexTrack = [0,1,2,3,4,5,6,7,8,9];


  static GameForm options = Data().newGameForm();


  void setNum(int x) {
    groupNumber = x;
  }

  int getNum() {
    return groupNumber;
  }

  void setIndex(int x) {
    index = x;
  }

  int getIndex() {
    return index;
  }

  void increaseIndexOfTracker() {
    if(indexOfTracker!=(indexTrack.length-1)) {
      indexOfTracker++;
    }
  }

  int getIndexOfTracker() {
    return indexOfTracker;
  }

  List<String> getProsodyNames() {
    return prosodiesNames;
  }

  List<String> getG1() {
    return g1;
  }

  List<String> getG2() {
    return g2;
  }

  List<String> getG3() {
    return g3;
  }

  void setOptions() {
    options = Data().newGameForm();
  }

  GameForm getOptions() {
    return options;
  }

  void newIndexTracker() {
    var r = Random();
    int one = r.nextInt(5);
    int two = r.nextInt(5);
    int three = r.nextInt(5);
    int four = r.nextInt(5);
    int five = r.nextInt(5);
    int six = r.nextInt(5);
    int seven = r.nextInt(5);
    int eight = r.nextInt(5);
    int nine = r.nextInt(5);
    int ten = r.nextInt(5);
    // while(
    // one == two || one == three || one == four || one == five ||
    //     two == three || two == four || two == five ||
    //     three == four || three == five ||
    //     four == five
    // ) {
    //   one = r.nextInt(5);
    //   two = r.nextInt(5);
    //   three = r.nextInt(5);
    //   four = r.nextInt(5);
    //   five = r.nextInt(5);
    // }
    indexTrack = [one, two, three, four, five, six, seven, eight, nine, ten];
    indexOfTracker = 0;
    index = indexTrack[indexOfTracker];
  }

  List<int> getIndexTrack() {
    return indexTrack;
  }

  List<String> giveMeCurrentG() {
    if(Data().getNum() == 1) {
      return Data().getG1();
    } else if(Data().getNum() == 2) {
      return Data().getG2();
    } else {
      return Data().getG3();
    }
  }

  static bool gameIsActive = false;
  void setGameIsActive(bool b) {
    gameIsActive = b;
  }
  bool getGameIsActive() {
    return gameIsActive;
  }
  GameForm newGameForm() {
    return const GameForm();
  }

  // ignore: non_constant_identifier_names
  static bool OC1Play = false;
  // ignore: non_constant_identifier_names
  static bool OC2Play = false;
  // ignore: non_constant_identifier_names
  static bool OC3Play = false;
  void setOC1(bool b) {
    if(b==true){
      OC2Play = false;
      OC3Play = false;
    }
    OC1Play = b;
  }
  void setOC2(bool b) {
    if(b==true){
      OC1Play = false;
      OC3Play = false;
    }
    OC2Play = b;
  }
  void setOC3(bool b) {
    if(b==true){
      OC1Play = false;
      OC2Play = false;
    }
    OC3Play = b;
  }
  bool getOC1Play() {
    return OC1Play;
  }
  bool getOC2Play() {
    return OC2Play;
  }
  bool getOC3Play() {
    return OC3Play;
  }
  void resetOCAll() {
    OC1Play = false;
    OC2Play = false;
    OC3Play = false;
  }
  List<String> soundsAll = ["1.mp3","2.mp3","3.mp3","4.mp3","5.mp3","6.mp3","7.mp3","8.mp3","9.mp3","10.mp3","11.mp3","12.mp3","13.mp3","14.mp3","15.mp3"] ;
  List<String> soundsG1 = ["1.mp3","2.mp3","3.mp3","4.mp3","5.mp3"];
  List<String> soundsG2 = ["6.mp3","7.mp3","8.mp3","9.mp3","10.mp3"];
  List<String> soundsG3 = ["11.mp3","12.mp3","13.mp3","14.mp3","15.mp3"];

  static var player = AudioPlayer();

  void playAudio(int i) async {

    player.play(AssetSource("sounds/${soundsAll[i]}"));
  }

  // stop audio
  void stopAudio() {
    player.stop();
  }

  String giveMeRandomBayt(int g, int key) {

    var r = Random();
    int x;

    if (g==1) {
      x = r.nextInt(abyatG1[key].length);
    } else if (g==2) {
      x = r.nextInt(abyatG2[key].length);
    } else {
      x = r.nextInt(abyatG3[key].length);
    }


    if (g==1) {
      return abyatG1[key][x];
    } else if (g==2) {
      return abyatG2[key][x];
    } else {
      return abyatG3[key][x];
    }
  }


  // gameform data
  static String rBayt = Data().giveMeRandomBayt(Data().getNum(), Data().getIndex());
  String getRBayt(){
    return rBayt;
  }
  void resetMEE(){
    Data().setDisableButtonToF();
    listA = randomList();
    myMap.putAt(4, 0);
    myMap.putAt(5, 0);
    rBayt = Data().giveMeRandomBayt(Data().getNum(), Data().getIndex());
  }
  // next Game form
  void changeTheGameForm() {
    setOC1(false);
    setOC2(false);
    setOC3(false);
    if(Data().getIndexOfTracker()<=(indexTrack.length-2)) {
      Data().increaseIndexOfTracker();
      Data().setIndex(Data().getIndexTrack()[Data().getIndexOfTracker()]);
    } else if (Data().getIndexOfTracker()==(indexTrack.length-1)) {
      Data().increaseIndexOfTracker();
    }
    randomKey();
    listA = randomList();
    rBayt = Data().giveMeRandomBayt(Data().getNum(), Data().getIndex());
  }

  static List<String> listA = randomList();

  List<String> getListA() {
    return listA;
  }
  bool isItTheAnswer(String ans) {
    if(Data().getNum()==1) {
      if(ans==Data().getG1()[Data().getIndex()]) {
        return true;
      }
    } else if(Data().getNum()==2) {
      if(ans==Data().getG2()[Data().getIndex()]) {
        return true;
      }
    } else {
      if(ans==Data().getG3()[Data().getIndex()]) {
        return true;
      }
    }
    return false;
  }


  static List<int> randomKey() {
    var random = Random();
    var random1 = random.nextInt(4);
    var random2 = random.nextInt(4);

    while(random1==Data().getIndex() ||
        random2==Data().getIndex() ||
        random1==random2) {
      random1 = random.nextInt(4);
      random2 = random.nextInt(4);
    }
    return [random1,random2];

  }

  static List<String> randomList() {
    List<int> rTemp = randomKey();

    List<String> l1 = [
      Data().getG1()[Data().getIndex()],
      Data().getG1()[rTemp[0]],
      Data().getG1()[rTemp[1]]
    ];

    List<String> l2 = [
      Data().getG2()[Data().getIndex()],
      Data().getG2()[rTemp[0]],
      Data().getG2()[rTemp[1]]
    ];

    List<String> l3 = [
      Data().getG3()[Data().getIndex()],
      Data().getG3()[rTemp[0]],
      Data().getG3()[rTemp[1]],
    ];

    var r = Random();
    var one = r.nextInt(3);
    var two = r.nextInt(3);
    var three = r.nextInt(3);

    while(one==two||one==three||two==three) {
      one = r.nextInt(3);
      two = r.nextInt(3);
      three = r.nextInt(3);
    }

    if(Data().getNum()==1){
      return <String>[l1[one], l1[two], l1[three]];
      // return l1;
    } else if(Data().getNum()==2){
      return <String>[l2[one], l2[two], l2[three]];
    } else {
      return <String>[l3[one], l3[two], l3[three]];
    }
  }

  static bool disableButton = false;
  void setDisableButtonToT() {
    disableButton = true;
  }
  void setDisableButtonToF() {
    disableButton = false;
  }
  bool getDisableButton() {
    return disableButton;
  }
  static Color firstOC = Colors.white;
  Color getFirstOptionColor() {
    return firstOC;
  }
  void setFirstOC(Color c) {
    firstOC = c;
  }

  static Color secondOC = Colors.white;
  Color getSecondOptionColor() {
    return secondOC;
  }
  void setSecondOC(Color c) {
    secondOC = c;
  }
  static Color thirdOC = Colors.white;
  Color getThirdOptionColor() {
    return thirdOC;
  }
  void setThirdOC(Color c) {
    thirdOC = c;
  }

  void resetOCColor() {
    firstOC = Colors.white;
    secondOC = Colors.white;
    thirdOC = Colors.white;
  }
  void resetOCC(int i) {
    i == 1?firstOC = Colors.white :
        i == 2? secondOC = Colors.white:
            thirdOC = Colors.white;
  }

// static FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
// FlutterView getView() {
//   return view;
// }
// // Dimensions in physical pixels (px)
// static late Size size;
// static late double width;
// static late double height;
// void setSize(Size s) {
//     size = s;
// }
// Size getSize() {
//   return size;
// }
// double getWidth() {
//   return width;
// }
// double getHeight() {
//   return height;
// }
// void setWidthHeight(double w, double h) {
//   width = w;
//   height = h;
// }

}