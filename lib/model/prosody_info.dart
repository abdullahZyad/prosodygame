
class ProsodyInf {
  
  static List<String> prosodiesNames =
  ["الطويل", "المديد", "البسيط", "الوافر", "الكامل",
    "الهَزَج", "الرمل", "السريع", "المنسرح", "الخفيف",
    "المضارع", "المقتضب", "المجتث", "المتقارب", "المتدارك"];

  static List<List<String>> allAbyat = [
    abyatG1[0], abyatG1[1], abyatG1[2], abyatG1[3], abyatG1[4],
    abyatG2[0], abyatG2[1], abyatG2[2], abyatG2[3], abyatG2[4],
    abyatG3[0], abyatG3[1], abyatG3[2], abyatG3[3], abyatG3[4]
  ];
  
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


}