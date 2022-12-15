class TemplateMessageModel {
  final int id;
  final String name, templateName, language, body;
  final bool isActive;

  TemplateMessageModel({
    required this.id,
    this.name = '',
    this.templateName = '',
    this.language = '',
    this.body = 'queue',
    this.isActive = false,
  });
}

List<TemplateMessageModel> templatesList = [
  TemplateMessageModel(
    id: 0,
    name: "Restoran Menu",
    templateName: "restaurantmenu",
    language: "tr",
    body:
        "Sevgili {{1}},D Maris Bay'de birçok çeşit restoran ve bar bulunmaktadır.Restorantlarimizin ve barlarımızın açılış ve kapanış saatlerini bulabilirsiniz.Sizi restaurant ve barlarımız hakkında bilgilendirmemi ister misiniz?",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 1,
    name: "Watersport Döküman",
    templateName: "watersports",
    language: "tr",
    body:
        "{{1}} Hayal edebileceklerinizin birsınırı var mı?{{2}} Dalgalar üzerinde yelken açmaktan bulutlara yelken açmaya kadar, baydreaming ile tüm hayaller mümkün.",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 2,
    name: "Issue Update",
    templateName: "issueupdate",
    language: "tr",
    body:
        "Opex'i tercih ettiginiz icin tesekkur ederiz. {{1}} numarali talebiniz {{2}} tarafindan tamamlanmistir. Yapılan islemden memnun musunuz?",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 3,
    name: "Order Update",
    templateName: "order_update",
    language: "en",
    body:
        "Your order {ID} for a total of {AGENCY} is confirmed. The expected delivery is {CHECKIN}.",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 4,
    name: "Restaurant Opening",
    templateName: "restaurantopening",
    language: "en",
    body:
        "Dear {{1}}, We have a selection of bars and restaurants in Opex. Here is the opening hours of our restaurants and bars. Would like your personal assistant to make a reservation for you?",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 5,
    name: "WhatsApp Consent",
    templateName: "whatsappconsent",
    language: "en",
    body:
        "Dear {{1}}, This WhatsApp group, created with your consent and whose servers are set abroad, is only used for the services we will provide during your stay at Opex. Your contact information within the group will not be used for any reason other than this purpose. This group will be deleted after the purpose of the business ends. Correspondence will be kept in a separate and secure system for 3 years for possible disagreements. For detailed information about our policy regarding personal data, you can visit the website below: https://opex.app/privacy-policy.html Do you approve this chat for Opex services? Opex Guest Assistant",
    isActive: true,
  ),
];

List<TemplateMessageModel> interactiveMessageList = [
  TemplateMessageModel(
    id: 0,
    name: "İnteraktif Liste Mesajı",
    language: "tr",
    body:
        "Sevgili {{1}},D Maris Bay'de birçok çeşit restoran ve bar bulunmaktadır.Restorantlarimizin ve barlarımızın açılış ve kapanış saatlerini bulabilirsiniz.Sizi restaurant ve barlarımız hakkında bilgilendirmemi ister misiniz?",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 1,
    name: "İnteraktif Mesaj Buton",
    language: "tr",
    body:
        "{{1}} Hayal edebileceklerinizin birsınırı var mı?{{2}} Dalgalar üzerinde yelken açmaktan bulutlara yelken açmaya kadar, baydreaming ile tüm hayaller mümkün.",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 2,
    name: "DGYM",
    language: "tr",
    body:
        "Opex'i tercih ettiginiz icin tesekkur ederiz. {{1}} numarali talebiniz {{2}} tarafindan tamamlanmistir. Yapılan islemden memnun musunuz?",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 3,
    name: "D GYM button",
    language: "en",
    body:
        "Your order {ID} for a total of {AGENCY} is confirmed. The expected delivery is {CHECKIN}.",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 4,
    name: "Dining",
    language: "en",
    body:
        "Dear {{1}}, We have a selection of bars and restaurants in Opex. Here is the opening hours of our restaurants and bars. Would like your personal assistant to make a reservation for you?",
    isActive: true,
  ),
  TemplateMessageModel(
    id: 5,
    name: "Transportation",
    language: "en",
    body:
        "Dear {{1}}, This WhatsApp group, created with your consent and whose servers are set abroad, is only used for the services we will provide during your stay at Opex. Your contact information within the group will not be used for any reason other than this purpose. This group will be deleted after the purpose of the business ends. Correspondence will be kept in a separate and secure system for 3 years for possible disagreements. For detailed information about our policy regarding personal data, you can visit the website below: https://opex.app/privacy-policy.html Do you approve this chat for Opex services? Opex Guest Assistant",
    isActive: true,
  ),
];
