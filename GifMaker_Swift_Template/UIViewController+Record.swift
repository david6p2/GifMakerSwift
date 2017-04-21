//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by David Andres Cespedes on 4/17/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

// Regift constants
let frameCount = 16
let delayTime = 0.2;
let loopCount = 0;	// 0 means loop forever

extension UIViewController:UINavigationControllerDelegate{
	
	@IBAction func launchVideoCamera(_ sender: AnyObject) {
		let recordVideoController = UIImagePickerController()
		recordVideoController.sourceType = UIImagePickerControllerSourceType.camera
		recordVideoController.mediaTypes = [kUTTypeMovie as String]
		recordVideoController.allowsEditing = false
		recordVideoController.delegate = self
		
		present(recordVideoController, animated: true, completion: nil)
	}
}

// MARK: - UIViewController: UIImagePickerControllerDelegate

extension UIViewController: UIImagePickerControllerDelegate{
	
	public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let mediaType = info[UIImagePickerControllerMediaType] as! String
		
		if mediaType == kUTTypeMovie as String {
			let videoURL = info[UIImagePickerControllerMediaURL] as! URL
			dismiss(animated: true,completion: nil)
			convertVideoToGIF(videoURL: videoURL)
			//UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, nil, nil, nil)
		}
	}
	
	public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		
	}
	
// GIF conversion methods
	func convertVideoToGIF(videoURL: URL) {
		let regift = Regift(sourceFileURL: videoURL, frameCount: frameCount, delayTime: Float(delayTime), loopCount: loopCount)
		let gifURL = regift.createGif()
		let gif = Gif(gifURL!, videoURL: videoURL, caption: nil)
		displayGIF(gif)
	}
	
	func displayGIF(_ gif: Gif) {
		let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
		gifEditorVC.gif = gif
		navigationController?.pushViewController(gifEditorVC, animated: true)
	}
}
