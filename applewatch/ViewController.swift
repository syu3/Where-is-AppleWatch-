//
//  ViewController.swift
//  applewatch
//
//  Created by 加藤 周 on 2015/05/09.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    @IBOutlet var myMapView : MKMapView!
    var info = [PFObject]()

    @IBOutlet var label : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        // Do any additional setup after loading the view, typically from a nib.
        self.loadData { (objects, error) -> () in
            for object in objects {
                self.info.append(object as PFObject)
                
            }
            //            self.latitude = self.info.objectForKey("latitude") as String
            var latitudeString : CLLocationDegrees = self.info.last!.objectForKey("latitude") as CLLocationDegrees
            
        
            
            var longitudeString : CLLocationDegrees = self.info.last!.objectForKey("longitude") as CLLocationDegrees
//
            
            NSLog("infoは、%@",self.info)
            
            
            let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitudeString, longitudeString)
            
            // MapViewに中心点を設定.
            self.myMapView.setCenterCoordinate(center, animated: true)
            
            // 縮尺.
            // 表示領域.
            let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.1)
            let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center, mySpan)
            
            // MapViewにregionを追加.
            self.myMapView.region = myRegion
            
            // viewにMapViewを追加.
            self.view.addSubview(self.myMapView)
            
            // ピンを生成.
            var myPin: MKPointAnnotation = MKPointAnnotation()
            
            // 座標を設定.
            myPin.coordinate = center
            
            // タイトルを設定.
            myPin.title = "タイトル"
            
            // サブタイトルを設定.
            myPin.subtitle = "サブタイトル"
            
            // MapViewにピンを追加.
            self.myMapView.addAnnotation(myPin)
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadData(callback:([PFObject]!, NSError!) -> ())  {
        var query: PFQuery = PFQuery(className: "AppleWatch")
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            if (error != nil){
                // エラー処理
            }
            callback(objects as [PFObject], error)
        }
    }
    
}

