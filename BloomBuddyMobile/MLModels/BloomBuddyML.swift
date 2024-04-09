//
//  BloomBuddyML.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 09/04/2024.
//

import CoreML
import Vision
import SwiftUI

class BloomBuddyML {
    static let shared = BloomBuddyML()
    
    private let model: BloomBuddyMLV1
    
    private init() {
        do {
            self.model = try BloomBuddyMLV1(contentsOf: BloomBuddyMLV1.urlOfModelInThisBundle)
        } catch {
            fatalError("Failed to load ML model: \(error)")
        }
    }
    
    /// This function uses the model instance to cast a prediction on an image.
    /// Predictions are sorted by confidence, e.g. the label with the most confidence is the first element in the array of predictions passed to the completion handler.
    ///
    /// - Parameters:
    ///     - _ image: The image to cast the predicion on.
    ///     - completion: The completion handler with the prediction results or nil.
    func classifyImage(_ image: UIImage, completion: @escaping ([Prediction]?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let ciImage = CIImage(image: image) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            guard let pixelBuffer = self.pixelBuffer(from: ciImage) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let input = BloomBuddyMLV1Input(image: pixelBuffer)
            
            do {
                let output = try self.model.prediction(input: input)
                let targetProbability = output.targetProbability
                
                var predictions: [Prediction] = []
                for (label, confidence) in targetProbability {
                    let prediction = Prediction(label: label, confidence: confidence)
                    predictions.append(prediction)
                }
                
                predictions.sort { $0.confidence > $1.confidence }
                
                DispatchQueue.main.async {
                    completion(predictions)
                }
            } catch {
                print("Error: Failed to perform prediction - \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
    private func pixelBuffer(from image: CIImage) -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let attrs = [
            kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
            kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
        ] as CFDictionary
        let width = Int(image.extent.width)
        let height = Int(image.extent.height)
        _ = CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32BGRA, attrs, &pixelBuffer)
        guard let buffer = pixelBuffer else { return nil }
        CIContext().render(image, to: buffer)
        return buffer
    }
}
