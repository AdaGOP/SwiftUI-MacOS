//
//  ImageCacher.swift
//  MartabakManis
//
//  Created by David Gunawan on 29/07/21.
//

import SwiftUI
import AppKit

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageCacher: ObservableObject {
    
    @Published var image: NSImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache

    func loadImage(with url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? NSImage {
            self.image = imageFromCache
            print("Image from cache")
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = NSImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                    print("Image from background")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
