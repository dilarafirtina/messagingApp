import 'dart:convert';

class Company {
  int id;
  String fullname;
  String firstname;
  String lastname;
  String address;
  String www;
  String phone;
  String email;
  String description;
  String splashUrl;
  String slogan;
  String lat;
  String long;
  String whatsAppPhone;
  String instagram;
  String facebook;
  String twitter;
  String youtube;
  String spotify;
  String tiktok;
  String vk;
  String ok;
  String pinterest;
  String swarm;
  String linkedin;
  String gdprlink;
  String emailpermissionlink;

  Company(
      {required this.id,
      required this.fullname,
      required this.firstname,
      required this.lastname,
      required this.www,
      required this.phone,
      required this.email,
      required this.description,
      required this.splashUrl,
      required this.slogan,
      required this.address,
      required this.lat,
      required this.long,
      required this.whatsAppPhone,
      required this.instagram,
      required this.facebook,
      required this.twitter,
      required this.youtube,
      required this.spotify,
      required this.tiktok,
      required this.vk,
      required this.ok,
      required this.pinterest,
      required this.swarm,
      required this.linkedin,
      required this.gdprlink,
      required this.emailpermissionlink});

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
      id: json["ID"],
      fullname: json["FULLNAME"],
      firstname: json["FIRSTNAME"],
      lastname: json["LASTNAME"],
      www: json["WWW"],
      phone: json["PHONE"],
      email: json["EMAIL"],
      description: json["DESCRIPTION"],
      splashUrl: json["SPLASHURL"],
      slogan: json["SLOGAN"],
      address: json["ADDRESS"],
      lat: json["LAT"],
      long: json["LONG"],
      whatsAppPhone: json["WHATSAPPROUTE"],
      instagram: json["INSTAGRAM"],
      facebook: json["FACEBOOK"],
      twitter: json["TWITTER"],
      youtube: json["YOUTUBE"],
      spotify: json["SPOTIFY"],
      tiktok: json["TIKTOK"],
      vk: json["VK"],
      ok: json["OK"],
      pinterest: json["PINTEREST"],
      swarm: json["SWARM"],
      linkedin: json["LINKEDIN"],
      gdprlink: json["GDPRLINK"],
      emailpermissionlink: json["EMAILPERMISSIONLINK"]
      //detailArgument: json["DETAILARGUMENT"]
      );
}
