/*

  Copyright (c) 2015 al7dev - Alex Leite. All rights reserved.

*/

import UIKit

class ViewController: UIViewController {
    
    //MARK- View lifecycle
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: self.view.bounds)
        label.textAlignment = .center
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Tap Anywhere in screen\nto see Spotlight View"
        self.view.addSubview(label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTap(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK- Tap Gesture Recognizer
    
	@objc func onTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.view)
        var spotlightCenter = CGPoint.zero
        spotlightCenter.x = location.x / self.view.bounds.size.width
        spotlightCenter.y = location.y / self.view.bounds.size.height
        
        let spotlightView = ALSpotlightView(spotlightCenter: spotlightCenter)
        spotlightView.onTapHandler = {
            spotlightView.hide()
        }
        spotlightView.show()
    }

}

