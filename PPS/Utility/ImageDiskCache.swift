//
//  ImageDiskCache.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//


import UIKit

class ImageDiskCache
{
    
    static func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    
    static func getDateCreated(filePath:String)->Date?
    {
        do {
            let fileAttributes = try FileManager.default.attributesOfItem(atPath: filePath)
            let creationDate = fileAttributes[FileAttributeKey.creationDate] as? Date

            return creationDate
            
        }catch let error as NSError {
            Log.print("file not found:", error)
        }
        return nil
    }
    
    static func loadImageFromPath(_ filename: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: filename)
        
        if image == nil {
            //Log.print("missing image at: \(filename)")
        }
        //Log.print("Loading image from path: \(filename)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
    //save image to disk
    static func saveImageToDisk(_ filename:String,UIImage image:UIImage)
    {
        
        if let data = UIImagePNGRepresentation(image) {
            
            let filename = getDocumentsDirectory().appendingPathComponent(filename)
            do {
                try data.write(to: URL(fileURLWithPath: filename), options: .atomicWrite)
                // Log.print("writing image to cache \(filename)")
            } catch {
                Log.print(error)
            }
        }
        
        
    }
    
    //read image from disk
    static func readImageFromDisk(_ filename:String)->UIImage
    {
        let filename = getDocumentsDirectory().appendingPathComponent(filename)
        let image = UIImage(contentsOfFile: filename)
        
        if image == nil {
            //Log.print("missing image at: \(filename)")
        }
        //Log.print("Loading image from path: \(filename)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image!
        
    }
    
    static func isImageCached(_ filename:String ) -> Bool
    {
        let filename = getDocumentsDirectory().appendingPathComponent(filename)
        if (FileManager.default.fileExists(atPath: filename))
        {
            return true
        }
        return false;
    }
    
}
