//
//  registerViewController.swift
//  applewatch
//
//  Created by 加藤 周 on 2015/05/09.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class registerViewController: UIViewController,CLLocationManagerDelegate{
    var myLocationManager:CLLocationManager!
    var latitudeString = "41.8317765556665"
    var longitudeString = "140.752969533336"
    var latitude: CLLocationDegrees = 0
    var longitude: CLLocationDegrees = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // 現在地の取得.
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func register(){
        
        
        myLocationManager = CLLocationManager()
        
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 取得頻度の設定.
        
        myLocationManager.distanceFilter = 100
        myLocationManager.startUpdatingLocation()
        myLocationManager.delegate = self
        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        //        if(status == CLAuthorizationStatus.NotDetermined) {
        //            println("didChangeAuthorizationStatus:\(status)");
        //            // まだ承認が得られていない場合は、認証ダイアログを表示.
        //            self.myLocationManager.requestAlwaysAuthorization()
        //        }
        
        // 取得精度の設定.

        
        
        NSLog("hello")
        
        
        
        
    }
    // 位置情報取得に成功したときに呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!){
        
        // 緯度・経度の表示.
        //        myLatitudeLabel.text = "緯度：\(manager.location.coordinate.latitude)"
        //        myLongitudeLabel.text = "経度：\(manager.location.coordinate.longitude)"
        NSLog("locationmanger")
        latitude = (manager.location.coordinate.latitude)
        longitude = (manager.location.coordinate.longitude)
        NSLog("latitudeは%@", latitudeString)
        NSLog("longitudeは%@", longitudeString)
        var object: PFObject = PFObject(className: "AppleWatch")
        object["latitude"] = latitude
        object["longitude"] = longitude
        object.saveInBackgroundWithBlock { (succeeded, error) -> Void in
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}
