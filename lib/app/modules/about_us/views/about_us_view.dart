import 'package:aqarat/app/modules/about_us/controllers/about_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTextSection('ال ئێس عقار چۆن کار دەکات'),
              _buildTextSection(
                  'ئێمە وەک ال اس عقار کار دەکەین لە خزمەت گوزاری عقاری کەبەشێوازێکی نوێ سەدەمیانە کار دەکەیین کە بە ئاسانترین شێواز کریار و فرۆشیار دەگەیەنین بەیەک ئێمە کار دەکەین لەسەر نەهێشتنی ئەو ترسانەی کە کریار و فرۆشیار هەیانە لە کاتی مامەڵەدا بەشێوازێک کە فرۆشیار لە کاتی فرۆشتنی موڵکەکەی نرخی موڵکەکەی بۆ دیاری دەکەین بە پێی بازار و وەکریاریش بە زوترین کات ئەو موڵکەی بۆ دەدۆزینەوە کە بەدوایدا دەگەرێت وە ئێمە تیمێکی راوێژ کاری بەهێزمان هەیە کە دەتوانن راوێژی دروستمان لەگەل بکەن پێش بریار دان'),
              // Add more sections with _buildTextSection for each paragraph
              _buildTextSection('How LS Real Estate Works'),
              _buildTextSection(
                  'We as LS Real Estate work in real estate services that work in a new way that brings buyers and sellers together in the easiest way. We work to eliminate the fears that buyers and sellers have during the transaction We determine according to the market and as soon as the buyer finds the property he is looking for and we have a strong consulting team that can consult with us before making a decisionWhat should you do if you have a property you want to sell or rent?Contact us directly LS Real Estate team will come to your property as soon as possibleWhat should you do if you want to buy or rent a property?Contact us directly for the property you are interested in. We will send you the property you are dreaming of as soon as possibleAddress : Sulaimani Opposite Qaywan CityPhone : 07703261212 07501501212'),
              _buildTextSection('كيف تعمل شركة ال اس العقارية'),
              _buildTextSection(
                  'نحن في LS Real Estate نعمل في الخدمات العقارية التي تعمل بشكل جديد يجمع المشترين والبائعين معًا بأسهل الطرق، ونعمل على إزالة المخاوف التي تنتاب المشترين والبائعين أثناء الصفقة التي نحددها وفقًا للسوق وفي أقرب وقت حيث يجد المشتري العقار الذي يبحث عنه ولدينا فريق استشاري قوي يمكنه التشاور معنا قبل اتخاذ القرار'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
