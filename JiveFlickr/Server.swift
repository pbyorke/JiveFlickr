//
//  Server.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

class Server {
    
    static var sharedInstance = Server() // singleton
    
    func fetch(_ string: String, done: @escaping ([String:Any])->Void) {
        let url = URL(string: string)
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                done(json as! [String : Any])
            } catch {}
        }
        task.resume()
    }
    
}

// http://www.flickr.com/services/api/

/*
 ["stat": ok, "photos": {
 page = 1;
 pages = 2600;
 perpage = 100;
 photo =     (
 {
 farm = 3;
 id = 32544103040;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "82131880@N07";
 secret = 5bce1307a2;
 server = 2298;
 title = "Off to Market";
 },
 {
 farm = 3;
 id = 32081457294;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "151803536@N05";
 secret = 62764d2862;
 server = 2943;
 title = "Hurid-326 (Or that red droid from Maz's castle) MOC";
 },
 {
 farm = 1;
 id = 32109690963;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "151803536@N05";
 secret = c6175deeab;
 server = 423;
 title = "Hurid-326 (Or that red droid from Maz's castle) MOC";
 },
 {
 farm = 4;
 id = 32081456354;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "151803536@N05";
 secret = e99988a1aa;
 server = 3756;
 title = "Hurid-326 (Or that red droid from Maz's castle) MOC";
 },
 {
 farm = 3;
 id = 32081455734;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "151803536@N05";
 secret = 2115f05191;
 server = 2235;
 title = "Hurid-326 (Or that red droid from Maz's castle) MOC";
 },
 {
 farm = 6;
 id = 15364523939;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "127566467@N07";
 secret = d4936e325d;
 server = 5604;
 title = "Macedonia,  Kavala, city view panorama from the cast;le with girl's glance, Greece #\U039cacedonia";
 },
 {
 farm = 3;
 id = 32770680302;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "54432452@N08";
 secret = 49cd96104f;
 server = 2785;
 title = "Dalquharren Castle";
 },
 {
 farm = 3;
 id = 32770654622;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "54432452@N08";
 secret = 5e97be0fe0;
 server = 2105;
 title = "Dalquharren Castle";
 },
 {
 farm = 3;
 id = 32800219821;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "9710967@N02";
 secret = 33af95a154;
 server = 2845;
 title = "Corn Dog Castle";
 },
 {
 farm = 8;
 id = 26892979465;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "44233857@N00";
 secret = 051bb27fa9;
 server = 7619;
 title = "Bellver Castle";
 },
 {
 farm = 4;
 id = 32080625954;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "146626464@N02";
 secret = 685de3dce4;
 server = 3876;
 title = "Castle Clash Hack Updates February 16, 2017 at 05:36AM";
 },
 {
 farm = 1;
 id = 32923768675;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "146626464@N02";
 secret = e980f35eec;
 server = 693;
 title = "Castle Clash Hack Updates February 16, 2017 at 05:36AM";
 },
 {
 farm = 3;
 id = 32770199972;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "60803345@N02";
 secret = 2ea287bf19;
 server = 2164;
 title = "Schloss Neuhaus";
 },
 {
 farm = 3;
 id = 32799881841;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "92035486@N03";
 secret = 73b5cac82d;
 server = 2745;
 title = Salzburg;
 },
 {
 farm = 4;
 id = 32799717611;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "147726029@N02";
 secret = fb717df536;
 server = 3829;
 title = "DSC06176 Nice living room";
 },
 {
 farm = 1;
 id = 32923576155;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "147726029@N02";
 secret = 10cda6a94a;
 server = 298;
 title = "DSC06205 Castle of Vianden";
 },
 {
 farm = 3;
 id = 32923558305;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "30825927@N00";
 secret = 3e16c3e95b;
 server = 2426;
 title = "_2149669";
 },
 {
 farm = 3;
 id = 32108756463;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "30825927@N00";
 secret = cbf02bb42d;
 server = 2066;
 title = "_2149667";
 },
 {
 farm = 3;
 id = 32769935572;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "30825927@N00";
 secret = aae355f468;
 server = 2369;
 title = "_2149665";
 },
 {
 farm = 3;
 id = 32079326354;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "93528850@N05";
 secret = 9068c98836;
 server = 2001;
 title = "A Very Big House In The Country";
 },
 {
 farm = 3;
 id = 14549389799;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "94209416@N06";
 secret = 93251c720b;
 server = 2932;
 title = "Port of Dover, Dover, Kent";
 },
 {
 farm = 1;
 id = 32079802214;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "147561804@N07";
 secret = faf74e12fb;
 server = 452;
 title = "torrelodones tower";
 },
 {
 farm = 3;
 id = 32079459314;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "63108252@N07";
 secret = 9d37c5ca32;
 server = 2103;
 title = Disneyworld;
 },
 {
 farm = 1;
 id = 32542204480;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "63108252@N07";
 secret = 966b25e1e1;
 server = 700;
 title = Disneyworld;
 },
 {
 farm = 4;
 id = 32882191796;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "63108252@N07";
 secret = 549f8418ba;
 server = 3668;
 title = Disneyworld;
 },
 {
 farm = 3;
 id = 32798669331;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "7324442@N03";
 secret = 392d91848a;
 server = 2861;
 title = "Castell, Peralada (E)";
 },
 {
 farm = 3;
 id = 32768839372;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "28956912@N07";
 secret = 4a0b098722;
 server = 2011;
 title = "Raf Trans, Warsaw (PL) WN 9914E";
 },
 {
 farm = 4;
 id = 32922294735;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "127964761@N02";
 secret = 8da973b718;
 server = 3906;
 title = "Caerlaverock Castle, D&G";
 },
 {
 farm = 3;
 id = 32798545071;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "57157595@N02";
 secret = 9bc23b6aa8;
 server = 2921;
 title = "Prague Panorama";
 },
 {
 farm = 3;
 id = 32768688342;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "126434487@N07";
 secret = dd94dd1acf;
 server = 2731;
 title = "Traditional Wooden Structure";
 },
 {
 farm = 3;
 id = 32798248551;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "126434487@N07";
 secret = d359ba8e92;
 server = 2669;
 title = "Historical Rize Castle, Turkey";
 },
 {
 farm = 3;
 id = 32881690926;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "76795678@N04";
 secret = 09b18871f0;
 server = 2405;
 title = "Castle Stary Jicin";
 },
 {
 farm = 3;
 id = 32078910874;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "127964761@N02";
 secret = 18ce4a2385;
 server = 2396;
 title = "Caerlaverock Castle";
 },
 {
 farm = 3;
 id = 32541587330;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "24866547@N02";
 secret = cc4f43e243;
 server = 2891;
 title = Castello;
 },
 {
 farm = 1;
 id = 32107060963;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "39571325@N04";
 secret = b844027a48;
 server = 660;
 title = "And a king";
 },
 {
 farm = 4;
 id = 32921885165;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "39571325@N04";
 secret = 9d1acd791e;
 server = 3788;
 title = "A coke and a castle";
 },
 {
 farm = 1;
 id = 32798009371;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "131756503@N08";
 secret = 0c9ed32283;
 server = 741;
 title = "Saint Germain en Laye";
 },
 {
 farm = 1;
 id = 32078212794;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "146272131@N07";
 secret = 16f381a61b;
 server = 424;
 title = img490;
 },
 {
 farm = 1;
 id = 32106460273;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "146272131@N07";
 secret = 0931ea9c25;
 server = 492;
 title = "sep 1977 (3)";
 },
 {
 farm = 3;
 id = 32767744802;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "146272131@N07";
 secret = 495531fa72;
 server = 2921;
 title = "sep 1977 Pembroke";
 },
 {
 farm = 1;
 id = 32078465564;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "11803211@N06";
 secret = b0b8feabed;
 server = 314;
 title = "Castle and Canigou Massif, near Valmanya, Roussillon";
 },
 {
 farm = 4;
 id = 32768042302;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "136001710@N06";
 secret = 55a4db887a;
 server = 3729;
 title = "Pendragon Castle 150217 IMG_7633-a";
 },
 {
 farm = 1;
 id = 32797497721;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "134996152@N03";
 secret = 2c423c5641;
 server = 731;
 title = Olsztyn;
 },
 {
 farm = 4;
 id = 32540546180;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77330645@N06";
 secret = 988fe3d640;
 server = 3671;
 title = "Night view of the abbey of mont saint michel.";
 },
 {
 farm = 1;
 id = 32106034903;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77330645@N06";
 secret = 94b3ceafde;
 server = 375;
 title = "Cloister of the Palace of Carlos V in the Alhambra of Granada.";
 },
 {
 farm = 3;
 id = 32796968681;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77330645@N06";
 secret = a6869f94a9;
 server = 2630;
 title = "The Alhambra of Granada from the viewpoint of San Nicol\U00e1s.";
 },
 {
 farm = 4;
 id = 32077729404;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "139194555@N05";
 secret = 1ab04b6787;
 server = 3899;
 title = "Site of The Castle of Liverpool, England";
 },
 {
 farm = 3;
 id = 32767299362;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = df66ec01a2;
 server = 2583;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32077694454;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 51d18bdf53;
 server = 2469;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32880326766;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 2ae9c86fce;
 server = 2184;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32077674354;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 5c3420f8ed;
 server = 2178;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32767272402;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 352aa07e22;
 server = 694;
 title = "Plus gros tonneau du monde - Heidelberg Schloss";
 },
 {
 farm = 1;
 id = 32540445700;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = d777bfe922;
 server = 439;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 4;
 id = 32796866471;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = dd7f94e6ba;
 server = 3937;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32880313506;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 801fc385fb;
 server = 650;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32880310836;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 4fc08a2c75;
 server = 2907;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32796860381;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = f3fa4b2556;
 server = 654;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32767265302;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 03bc4ed514;
 server = 2840;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32767264262;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 5825364536;
 server = 2588;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32077646264;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = dce3ab2edb;
 server = 682;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32105914603;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "147844061@N05";
 secret = e185d7003f;
 server = 2535;
 title = "Lulworth Castle, Dorset, England";
 },
 {
 farm = 3;
 id = 32796853051;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 944fe155ed;
 server = 2430;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32540430020;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 7b555281d1;
 server = 363;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32796846801;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = a686c65546;
 server = 2645;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32880295866;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 3e22868148;
 server = 2576;
 title = "Jardins du Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32767249152;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 11f6ec2691;
 server = 2246;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32796832701;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = d834f959c3;
 server = 2308;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32105899923;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 7eae2f5aa3;
 server = 491;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 3;
 id = 32920702965;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = 77d11914d2;
 server = 2706;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32920686845;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = e7f85c5fdd;
 server = 443;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32077577724;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "34326197@N04";
 secret = c5f1d93347;
 server = 557;
 title = "Ch\U00e2teau d'Heidelberg";
 },
 {
 farm = 1;
 id = 32105762423;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "11803211@N06";
 secret = 1d37543604;
 server = 497;
 title = "Evol castle, Roussillon";
 },
 {
 farm = 3;
 id = 32920494785;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77334245@N00";
 secret = b3b429afbc;
 server = 2215;
 title = "Yogya Water Palace - Taman Sari";
 },
 {
 farm = 3;
 id = 32767060312;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77334245@N00";
 secret = daea65842d;
 server = 2804;
 title = "Yogya Water Palace - Taman Sari";
 },
 {
 farm = 1;
 id = 32540167650;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77334245@N00";
 secret = 7d3a46a4b8;
 server = 463;
 title = "Yogya Water Palace - Taman Sari";
 },
 {
 farm = 4;
 id = 32767057152;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77334245@N00";
 secret = 6750c211ff;
 server = 3665;
 title = "Yogya Water Palace - Taman Sari";
 },
 {
 farm = 3;
 id = 32920480865;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77334245@N00";
 secret = 5c24b99fef;
 server = 2081;
 title = "Yogya Water Palace - Taman Sari";
 },
 {
 farm = 3;
 id = 32796591511;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "77334245@N00";
 secret = 4394ed9533;
 server = 2766;
 title = "Yogya Water Palace - Taman Sari";
 },
 {
 farm = 1;
 id = 32920297875;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "29511211@N05";
 secret = 037ebf83f0;
 server = 453;
 title = "High Castle of F\U00fcssen";
 },
 {
 farm = 3;
 id = 32539988530;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "66543158@N03";
 secret = df30b7f7c2;
 server = 2719;
 title = "Highland cow";
 },
 {
 farm = 4;
 id = 32077226674;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "45503185@N06";
 secret = 86f81939d9;
 server = 3936;
 title = CidneOn;
 },
 {
 farm = 4;
 id = 32920262695;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "45503185@N06";
 secret = a7512ce968;
 server = 3681;
 title = CidneOn;
 },
 {
 farm = 3;
 id = 32795831261;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "100954775@N03";
 secret = 928894cef1;
 server = 2042;
 title = "R\U00f3nay Castle, Kiszombor, Hungary";
 },
 {
 farm = 3;
 id = 32539308280;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "100954775@N03";
 secret = 08ef5312f2;
 server = 2516;
 title = "R\U00f3nay Castle, Kiszombor, Hungary";
 },
 {
 farm = 3;
 id = 32879511726;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "130642776@N03";
 secret = c7ba9c2ca6;
 server = 2125;
 title = "#photo #landscape#skyline#mountains#blackendwhite#Castle";
 },
 {
 farm = 4;
 id = 32919940585;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "38022064@N07";
 secret = 45c852541d;
 server = 3872;
 title = "Ice Castles";
 },
 {
 farm = 4;
 id = 32076884334;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "7815453@N05";
 secret = 111757eb95;
 server = 3801;
 title = "Portugal Tomar 165 - Castelo dos Templ\U00e1rios - Convento de Cristo";
 },
 {
 farm = 4;
 id = 32879384356;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "7815453@N05";
 secret = 3be2386091;
 server = 3888;
 title = "Portugal Tomar 166 - Castelo dos Templ\U00e1rios - Convento de Cristo";
 },
 {
 farm = 3;
 id = 32795691731;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "52559257@N02";
 secret = 1a29b6321a;
 server = 2287;
 title = 26225;
 },
 {
 farm = 3;
 id = 32766061902;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "52559257@N02";
 secret = 4bdcb4309a;
 server = 2230;
 title = 26217;
 },
 {
 farm = 1;
 id = 32919302355;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "125927602@N05";
 secret = 926f2e1cc5;
 server = 623;
 title = "Saint Mal\U00f2, Fort National";
 },
 {
 farm = 3;
 id = 32919270495;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "24393689@N05";
 secret = 1812724e4d;
 server = 2433;
 title = "Okeechobee Florida December 2016";
 },
 {
 farm = 1;
 id = 32918887495;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "37409944@N02";
 secret = d8f6a9e9f5;
 server = 444;
 title = "Waiting for the tide to turn.";
 },
 {
 farm = 3;
 id = 32075962334;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "52559257@N02";
 secret = 58bffe6bed;
 server = 2569;
 title = 26213;
 },
 {
 farm = 3;
 id = 32918759545;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "52559257@N02";
 secret = 0108a86145;
 server = 2343;
 title = 26215;
 },
 {
 farm = 1;
 id = 32538156880;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "38134034@N04";
 secret = 923c4bed0b;
 server = 525;
 title = "Stately Home";
 },
 {
 farm = 1;
 id = 32543113330;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "150851636@N07";
 secret = dcb8fdd454;
 server = 518;
 title = "IMG_9825_DxO.jpg";
 },
 {
 farm = 4;
 id = 32799101661;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "46618448@N05";
 secret = a0352aae1f;
 server = 3700;
 title = "Canossa vista da Rossenella";
 },
 {
 farm = 4;
 id = 32541974210;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "24710541@N08";
 secret = 7780b90f84;
 server = 3862;
 title = "'Rooftops And Turrets' - Conwy";
 },
 {
 farm = 3;
 id = 32541928690;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "49815157@N05";
 secret = ce632f9965;
 server = 2618;
 title = "Edinburgh Firework-Scotland UK";
 }
 );
 total = 259941;
 }]
 
 */
