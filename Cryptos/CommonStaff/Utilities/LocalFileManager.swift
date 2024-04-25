//
//  LocalFileManager.swift
//  Cryptos
//
//  Created by Иван Карплюк on 25.09.2023.
//

import SwiftUI


final class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() { }
    
    func getImage(imageName: String,
                  folderName: String
    ) -> UIImage? {
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path)
        else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    func saveImage(image: UIImage,
                           imageName: String,
                           folderName: String)
    {
        //Creating folder
        createFolderIfNeeded(folderName: folderName)
        
        //Getting path for image
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName,
                                     folderName: folderName)
        else { return }
        
        //Saving image to url-path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. \(error)")
        }
        
    }
    
    private func getURLForFolder(folerName: String
    ) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory,
                                                 in: .userDomainMask).first
        else {
            return nil
        }
        return url.appendingPathComponent(folerName)
    }
    
    private func getURLForImage(imageName: String,
                                folderName: String
    ) -> URL? {
        guard let folderURL = getURLForFolder(folerName: folderName)
        else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folerName: folderName)
        else {
            return
        }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url,
                                                        withIntermediateDirectories: true,
                                                        attributes: nil)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    
}
