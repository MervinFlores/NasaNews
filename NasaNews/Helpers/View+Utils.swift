//
//  View+Utils.swift
//  NasaNews
//
//  Created by Mervin Flores on 2/29/24.
//

import UIKit

extension UIView {
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.gradientLayer?.frame = self.bounds
//    }
    
    func applyBorderWithCornerRadius(borderWidth: CGFloat = 1.0, borderColor: UIColor = .lightGray, cornerRadius: CGFloat = 8.0) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    func applyGradient(from startColor: UIColor, to endColor: UIColor, startEdge: UIRectEdge, endEdge: UIRectEdge) {
            // Crear gradient layer
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradientLayer.frame = self.bounds

            // Ajustar puntos de inicio y fin según los bordes especificados
            switch (startEdge, endEdge) {
                case (.top, .bottom):
                    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
                    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
                case (.bottom, .top):
                    gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
                    gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
                case (.left, .right):
                    gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
                    gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
                case (.right, .left):
                    gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
                    gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
                default:
                    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
                    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            }

            // Asegurar que el gradiente cubra el view completamente incluso después de cambios de layout
            gradientLayer.frame = self.bounds
            self.layer.insertSublayer(gradientLayer, at: 0)
            
            // Ajustar el gradiente a las esquinas redondeadas
            self.layer.cornerRadius = self.layer.cornerRadius
            self.layer.masksToBounds = true
            
            // Actualizar el frame del gradientLayer en cambios de layout
            gradientLayer.frame = self.bounds
            
            // Remover cualquier gradient layer anterior para evitar duplicados
            self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
            self.layer.insertSublayer(gradientLayer, at: 0)
        }

        
}

