import 'package:get/get.dart';

import '../models/company_model.dart';
import '../models/menu_date_model.dart';
import '../models/menu_model.dart';

List<Menu> menuData = [];
List<MenuDisplay> menuDisplay = [];
Rx<Company> company = Company(
        id: 1,
        fullname: "",
        firstname: "",
        lastname: "",
        www: "",
        phone: "",
        email: "",
        description: "",
        splashUrl: "",
        slogan: "",
        address: "",
        lat: "",
        long: "",
        whatsAppPhone: "",
        instagram: "",
        facebook: "",
        twitter: "",
        youtube: "",
        spotify: "",
        tiktok: "",
        vk: "",
        ok: "",
        pinterest: "",
        swarm: "",
        linkedin: "",
        gdprlink: "https://opexcdn.blob.core.windows.net/ela/KVKK.pdf",
        emailpermissionlink:
            "https://opexcdn.blob.core.windows.net/ela/Iletisim.pdf")
    .obs;

List<Menu> bottomMenuItems = [];

List<Menu> drawerMenu = [];

List<Menu> serviceMenu = [];

List<Menu> reservationMenu = [];
