//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by David Andres Cespedes on 4/21/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif: NSObject {
	let url:URL
	let videoURL:URL
	let caption:String?
	let gifImage:UIImage?
	var gifData:Data?
	
	public init(_ url:URL, videoURL:URL, caption:String?) {
		self.url = url
		self.videoURL = videoURL
		self.caption = caption
		self.gifImage = UIImage.gif(url: url.absoluteString)
		self.gifData = nil
	}
//	public init(_ name:String) {
//		self.gifImage = UIImage.gif(name: name)
//	}
	
}
