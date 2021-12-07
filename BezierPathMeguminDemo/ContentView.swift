//
//  ContentView.swift
//  BezierPathMeguminDemo
//
//  Created by 張又壬 on 2021/11/27.
//

import SwiftUI

struct DrawMeguminView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
//        let imageView = UIImageView(image: UIImage(named: "Megumin"))
//        imageView.frame = CGRect(x: 0, y: 0, width: 390, height: 390)
//        imageView.alpha = 0.5
//        view.addSubview(imageView)
        view.addSubview(createMegumin())
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func facePath() -> UIBezierPath {
        let path = UIBezierPath()
        // 脖子右邊臉頰
        path.move(to: CGPoint(x: 210, y: 354))
        path.addQuadCurve(to: CGPoint(x: 290, y: 325), controlPoint: CGPoint(x: 270, y: 345))
        path.addQuadCurve(to: CGPoint(x: 294, y: 250), controlPoint: CGPoint(x: 335, y: 285))
        // 頭頂遮住的地方
        path.addLine(to: CGPoint(x: 270, y: 130))
        path.addLine(to: CGPoint(x: 90, y: 151))
        path.addLine(to: CGPoint(x: 73, y: 253))
        // 左耳
        path.addQuadCurve(to: CGPoint(x: 76, y: 290), controlPoint: CGPoint(x: 53, y: 260))
        path.addLine(to: CGPoint(x: 123, y: 329))
        // 左臉頰
        path.addQuadCurve(to: CGPoint(x: 183, y: 350), controlPoint: CGPoint(x: 145, y: 349))
        return path
    }
    
    func addFaceOutline() -> CAShapeLayer {
        let path = facePath()
        let headLayer = CAShapeLayer()
        headLayer.path = path.cgPath
        headLayer.fillColor = UIColor.clear.cgColor
//        headLayer.fillColor = UIColor(named: "Face")?.cgColor
//        headLayer.strokeColor = UIColor(named: "Outline")?.cgColor
//        headLayer.lineWidth = 3
        
        return headLayer
    }
    
    func fillFace() -> CAShapeLayer {
        let path = facePath()
        path.close()
        let headLayer = CAShapeLayer()
        headLayer.path = path.cgPath
        headLayer.fillColor = UIColor.clear.cgColor
        headLayer.fillColor = UIColor(named: "Face")?.cgColor
        
        let faceShadowPath = UIBezierPath()
        faceShadowPath.move(to: CGPoint(x: 124, y: 275))
        faceShadowPath.addQuadCurve(to: CGPoint(x: 140, y: 341), controlPoint: CGPoint(x: 129, y: 309))
        faceShadowPath.addQuadCurve(to: CGPoint(x: 120, y: 328), controlPoint: CGPoint(x: 126, y: 334))
        faceShadowPath.addLine(to: CGPoint(x: 111, y: 268))
        let faceShadowLayer = CAShapeLayer()
        faceShadowLayer.path = faceShadowPath.cgPath
        faceShadowLayer.fillColor = UIColor(red: 100/255, green: 10/255, blue: 10/255, alpha: 0.1).cgColor
        
        headLayer.addSublayer(faceShadowLayer)
        
        return headLayer
    }
    
    // 左腮紅
    func addLeftBlush() -> CAShapeLayer {
        let path = UIBezierPath(ovalIn: CGRect(x: 134, y: 285, width: 42, height: 21))
        
        let leftBlushLayer = CAShapeLayer()
        leftBlushLayer.path = path.cgPath
        leftBlushLayer.fillColor = UIColor(red: 250/255, green: 194/255, blue: 187/255, alpha: 0.6).cgColor
        
        let linePointArray : [(start: CGPoint, end: CGPoint)] = [
            (start: CGPoint(x: 147, y: 287), end: CGPoint(x: 137, y: 298)),
            (start: CGPoint(x: 158, y: 285), end: CGPoint(x: 141, y: 305)),
            (start: CGPoint(x: 165, y: 286), end: CGPoint(x: 150, y: 306)),
            (start: CGPoint(x: 171, y: 287), end: CGPoint(x: 160, y: 305)),
            (start: CGPoint(x: 177, y: 289), end: CGPoint(x: 172, y: 299)),
        ]
        
        for (start, end) in linePointArray {
            let line = UIBezierPath()
            line.move(to: start)
            line.addLine(to: end)
            let lineLayer = CAShapeLayer()
            lineLayer.path = line.cgPath
            lineLayer.strokeColor = UIColor(named: "Outline")?.cgColor
            leftBlushLayer.addSublayer(lineLayer)
        }
        
        return leftBlushLayer
    }
    
    // 右腮紅
    func addRightBlush() -> CAShapeLayer {
        let path = UIBezierPath(ovalIn: CGRect(x: 266, y: 271, width: 39, height: 20))
        
        let leftBlushLayer = CAShapeLayer()
        leftBlushLayer.path = path.cgPath
        leftBlushLayer.fillColor = UIColor(red: 250/255, green: 194/255, blue: 187/255, alpha: 0.6).cgColor
        
        let linePointArray : [(start: CGPoint, end: CGPoint)] = [
            (start: CGPoint(x: 276, y: 271), end: CGPoint(x: 267, y: 285)),
            (start: CGPoint(x: 283, y: 272), end: CGPoint(x: 275, y: 288)),
            (start: CGPoint(x: 291, y: 271), end: CGPoint(x: 281, y: 292)),
            (start: CGPoint(x: 298, y: 272), end: CGPoint(x: 289, y: 289)),
            (start: CGPoint(x: 303, y: 274), end: CGPoint(x: 297, y: 288)),
        ]
        
        for (start, end) in linePointArray {
            let line = UIBezierPath()
            line.move(to: start)
            line.addLine(to: end)
            let lineLayer = CAShapeLayer()
            lineLayer.path = line.cgPath
            lineLayer.strokeColor = UIColor(named: "Outline")?.cgColor
            leftBlushLayer.addSublayer(lineLayer)
        }
        
        return leftBlushLayer
    }
    
    // 嘴巴
    func addMouth() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 189, y: 293))
        path.addQuadCurve(to: CGPoint(x: 222, y: 292), controlPoint: CGPoint(x: 198, y: 299))
        path.addQuadCurve(to: CGPoint(x: 243, y: 292), controlPoint: CGPoint(x: 235, y: 288))
        path.addQuadCurve(to: CGPoint(x: 263, y: 290), controlPoint: CGPoint(x: 255, y: 297))
        path.addQuadCurve(to: CGPoint(x: 217, y: 345), controlPoint: CGPoint(x: 268, y: 345))
        path.addQuadCurve(to: CGPoint(x: 189, y: 293), controlPoint: CGPoint(x: 170, y: 340))
        
        let mouthLayer = CAShapeLayer()
        mouthLayer.path = path.cgPath
        mouthLayer.strokeColor = UIColor(named: "Outline")?.cgColor
//        mouthLayer.strokeColor = UIColor.clear.cgColor
        mouthLayer.lineWidth = 2
//        mouthLayer.fillColor = UIColor.clear.cgColor
        mouthLayer.fillColor = UIColor(red: 210/255, green: 80/255, blue: 87/255, alpha: 1).cgColor
        
        let tonguePath = UIBezierPath()
        tonguePath.move(to: CGPoint(x: 189, y: 295))
        tonguePath.addQuadCurve(to: CGPoint(x: 212, y: 296), controlPoint: CGPoint(x: 198, y: 299))
        tonguePath.addQuadCurve(to: CGPoint(x: 234, y: 292), controlPoint: CGPoint(x: 231, y: 290))
        tonguePath.addQuadCurve(to: CGPoint(x: 261, y: 313), controlPoint: CGPoint(x: 254, y: 299))
        tonguePath.addQuadCurve(to: CGPoint(x: 217, y: 344), controlPoint: CGPoint(x: 254, y: 344))
        tonguePath.addQuadCurve(to: CGPoint(x: 189, y: 295), controlPoint: CGPoint(x: 172, y: 339))
        let tongueLayer = CAShapeLayer()
        tongueLayer.path = tonguePath.cgPath
        tongueLayer.fillColor = UIColor.clear.cgColor
//        tongueLayer.strokeColor = UIColor(named: "Outline")?.cgColor
//        tongueLayer.fillColor = UIColor.clear.cgColor
        tongueLayer.fillColor = UIColor(red: 251/255, green: 96/255, blue: 102/255, alpha: 1).cgColor
        
        let leftToothPath = UIBezierPath()
        leftToothPath.move(to: CGPoint(x: 192, y: 295))
        leftToothPath.addQuadCurve(to: CGPoint(x: 200, y: 297), controlPoint: CGPoint(x: 195, y: 297))
        leftToothPath.addLine(to: CGPoint(x: 196, y: 302))
        leftToothPath.close()
        let leftToothLayer = CAShapeLayer()
        leftToothLayer.path = leftToothPath.cgPath
        leftToothLayer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftToothLayer.fillColor = UIColor.white.cgColor
        
        let rightToothPath = UIBezierPath()
        rightToothPath.move(to: CGPoint(x: 251, y: 295))
        rightToothPath.addQuadCurve(to: CGPoint(x: 258, y: 294), controlPoint: CGPoint(x: 254, y: 295))
        rightToothPath.addLine(to: CGPoint(x: 255, y: 299))
        rightToothPath.close()
        let rightToothLayer = CAShapeLayer()
        rightToothLayer.path = rightToothPath.cgPath
        rightToothLayer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightToothLayer.fillColor = UIColor.white.cgColor
        
        let smilePointArray : [(start: CGPoint, end: CGPoint)] = [
            (start: CGPoint(x: 184, y: 292), end: CGPoint(x: 189, y: 293)),
            (start: CGPoint(x: 263, y: 290), end: CGPoint(x: 266, y: 288))
        ]
        for (start, end) in smilePointArray {
            let smileLine = UIBezierPath()
            smileLine.move(to: start)
            smileLine.addLine(to: end)
            let smileLayer = CAShapeLayer()
            smileLayer.path = smileLine.cgPath
            smileLayer.strokeColor = UIColor(named: "Outline")?.cgColor
            smileLayer.lineWidth = 2
            smileLayer.fillColor = UIColor.clear.cgColor
            mouthLayer.addSublayer(smileLayer)
        }
        
        mouthLayer.addSublayer(tongueLayer)
        mouthLayer.addSublayer(leftToothLayer)
        mouthLayer.addSublayer(rightToothLayer)
        
        return mouthLayer
    }
    
    // 鼻子
    func addNose() -> CAShapeLayer {
        let nosePath = UIBezierPath()
        nosePath.move(to: CGPoint(x: 234, y: 267))
        nosePath.addQuadCurve(to: CGPoint(x: 237, y: 272), controlPoint: CGPoint(x: 238, y: 267))
        let noseLayer = CAShapeLayer()
        noseLayer.path = nosePath.cgPath
        noseLayer.lineWidth = 2
        noseLayer.strokeColor = UIColor(named: "Outline")?.cgColor
        noseLayer.fillColor = UIColor.clear.cgColor
        
        return noseLayer
    }
    
    // 左眼
    func addLeftEye() -> CAShapeLayer {
        let eye1Path = UIBezierPath()
        eye1Path.move(to: CGPoint(x: 127, y: 261))
        eye1Path.addQuadCurve(to: CGPoint(x: 181, y: 229), controlPoint: CGPoint(x: 139, y: 212))
        eye1Path.addQuadCurve(to: CGPoint(x: 186, y: 267), controlPoint: CGPoint(x: 190, y: 250))
        eye1Path.addQuadCurve(to: CGPoint(x: 159, y: 276), controlPoint: CGPoint(x: 180, y: 280))
        eye1Path.addQuadCurve(to: CGPoint(x: 127, y: 261), controlPoint: CGPoint(x: 142, y: 272))
        let eye1Layer = CAShapeLayer()
        eye1Layer.path = eye1Path.cgPath
//        eye1Layer.lineWidth = 1
//        eye1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
//        eye1Layer.fillColor = UIColor.clear.cgColor
        eye1Layer.fillColor = UIColor.white.cgColor
        
        let eye2Path = UIBezierPath()
        eye2Path.move(to: CGPoint(x: 125, y: 261))
        eye2Path.addQuadCurve(to: CGPoint(x: 176, y: 219), controlPoint: CGPoint(x: 127, y: 210))
        eye2Path.addQuadCurve(to: CGPoint(x: 181, y: 229), controlPoint: CGPoint(x: 181, y: 223))
        eye2Path.addQuadCurve(to: CGPoint(x: 127, y: 262), controlPoint: CGPoint(x: 139, y: 212))
        eye2Path.close()
        let eye2Layer = CAShapeLayer()
        eye2Layer.path = eye2Path.cgPath
//        eye2Layer.lineWidth = 1
//        eye2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
//        eye2Layer.fillColor = UIColor.clear.cgColor
        eye2Layer.fillColor = UIColor(red: 157/255, green: 109/255, blue: 109/255, alpha: 1).cgColor
        
        let eye3Path = UIBezierPath()
        eye3Path.move(to: CGPoint(x: 153, y: 237))
        eye3Path.addQuadCurve(to: CGPoint(x: 185, y: 244), controlPoint: CGPoint(x: 173, y: 221))
        eye3Path.addQuadCurve(to: CGPoint(x: 185, y: 268), controlPoint: CGPoint(x: 189, y: 256))
        eye3Path.addQuadCurve(to: CGPoint(x: 169, y: 277), controlPoint: CGPoint(x: 181, y: 276))
        eye3Path.addQuadCurve(to: CGPoint(x: 148, y: 267), controlPoint: CGPoint(x: 151, y: 277))
        eye3Path.addQuadCurve(to: CGPoint(x: 149, y: 244), controlPoint: CGPoint(x: 143, y: 257))
        eye3Path.addQuadCurve(to: CGPoint(x: 159, y: 246), controlPoint: CGPoint(x: 153, y: 252))
        eye3Path.addQuadCurve(to: CGPoint(x: 153, y: 237), controlPoint: CGPoint(x: 161, y: 236))
        let eye3Layer = CAShapeLayer()
        eye3Layer.path = eye3Path.cgPath
        eye3Layer.lineWidth = 1.5
        eye3Layer.strokeColor = UIColor(named: "Outline")?.cgColor
//        eye3Layer.fillColor = UIColor.clear.cgColor
        eye3Layer.fillColor = UIColor(red: 245/255, green: 69/255, blue: 76/255, alpha: 1).cgColor
        
        let eye4Path = UIBezierPath()
        eye4Path.move(to: CGPoint(x: 155, y: 256))
        eye4Path.addQuadCurve(to: CGPoint(x: 177, y: 251), controlPoint: CGPoint(x: 173, y: 275))
        eye4Path.addQuadCurve(to: CGPoint(x: 186, y: 254), controlPoint: CGPoint(x: 182, y: 251))
        eye4Path.addQuadCurve(to: CGPoint(x: 176, y: 275), controlPoint: CGPoint(x: 188, y: 270))
        eye4Path.addQuadCurve(to: CGPoint(x: 155, y: 256), controlPoint: CGPoint(x: 151, y: 278))
        let eye4Layer = CAShapeLayer()
        eye4Layer.path = eye4Path.cgPath
//        eye4Layer.lineWidth = 0.5
//        eye4Layer.strokeColor = UIColor(named: "Outline")?.cgColor
//        eye4Layer.fillColor = UIColor.clear.cgColor
        eye4Layer.fillColor = UIColor(red: 249/255, green: 165/255, blue: 170/255, alpha: 1).cgColor
        
        eye1Layer.addSublayer(eye2Layer)
        eye1Layer.addSublayer(eye3Layer)
        eye1Layer.addSublayer(eye4Layer)
        
        return eye1Layer
    }
    
    // 眼罩
    func addEyeMask() -> CAShapeLayer {
        let mask1Path = UIBezierPath()
        mask1Path.move(to: CGPoint(x: 239, y: 215))
        mask1Path.addQuadCurve(to: CGPoint(x: 279, y: 208), controlPoint: CGPoint(x: 259, y: 210))
        mask1Path.addQuadCurve(to: CGPoint(x: 289, y: 246), controlPoint: CGPoint(x: 288, y: 229))
        mask1Path.addQuadCurve(to: CGPoint(x: 274, y: 269), controlPoint: CGPoint(x: 285, y: 259))
        mask1Path.addQuadCurve(to: CGPoint(x: 245, y: 254), controlPoint: CGPoint(x: 253, y: 261))
        mask1Path.addQuadCurve(to: CGPoint(x: 239, y: 215), controlPoint: CGPoint(x: 240, y: 238))
        let mask1Layer = CAShapeLayer()
        mask1Layer.path = mask1Path.cgPath
        mask1Layer.lineWidth = 1.5
        mask1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        mask1Layer.fillColor = UIColor.clear.cgColor
        mask1Layer.fillColor = UIColor(red: 251/255, green: 196/255, blue: 115/255, alpha: 1).cgColor
        
        let mask2Path = UIBezierPath()
        mask2Path.move(to: CGPoint(x: 245, y: 219))
        mask2Path.addQuadCurve(to: CGPoint(x: 277, y: 214), controlPoint: CGPoint(x: 261, y: 214))
        mask2Path.addQuadCurve(to: CGPoint(x: 285, y: 245), controlPoint: CGPoint(x: 284, y: 230))
        mask2Path.addQuadCurve(to: CGPoint(x: 274, y: 263), controlPoint: CGPoint(x: 281, y: 254))
        mask2Path.addQuadCurve(to: CGPoint(x: 250, y: 250), controlPoint: CGPoint(x: 257, y: 256))
        mask2Path.addQuadCurve(to: CGPoint(x: 245, y: 219), controlPoint: CGPoint(x: 244, y: 233))
        let mask2Layer = CAShapeLayer()
        mask2Layer.path = mask2Path.cgPath
        mask2Layer.lineWidth = 0.5
        mask2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        mask2Layer.fillColor = UIColor.clear.cgColor
        mask2Layer.fillColor = UIColor(red: 245/255, green: 65/255, blue: 70/255, alpha: 1).cgColor
        
        let mask3Path = UIBezierPath()
        mask3Path.move(to: CGPoint(x: 252, y: 231))
        mask3Path.addLine(to: CGPoint(x: 263, y: 229))
        mask3Path.addLine(to: CGPoint(x: 261, y: 219))
        mask3Path.addLine(to: CGPoint(x: 266, y: 218))
        mask3Path.addLine(to: CGPoint(x: 268, y: 228))
        mask3Path.addLine(to: CGPoint(x: 277, y: 226))
        mask3Path.addLine(to: CGPoint(x: 278, y: 231))
        mask3Path.addLine(to: CGPoint(x: 270, y: 233))
        mask3Path.addLine(to: CGPoint(x: 274, y: 256))
        mask3Path.addLine(to: CGPoint(x: 269, y: 257))
        mask3Path.addLine(to: CGPoint(x: 265, y: 234))
        mask3Path.addLine(to: CGPoint(x: 253, y: 236))
        mask3Path.close()
        
        let mask3Layer = CAShapeLayer()
        mask3Layer.path = mask3Path.cgPath
        mask3Layer.lineWidth = 1
        mask3Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        mask3Layer.fillColor = UIColor.clear.cgColor
        mask3Layer.fillColor = UIColor.white.cgColor
        
        mask1Layer.addSublayer(mask2Layer)
        mask1Layer.addSublayer(mask3Layer)
        
        return mask1Layer
    }
    
    // 左眉毛
    func addLeftEyebrow() -> CAShapeLayer {
        let leftEyebrowPath = UIBezierPath()
        leftEyebrowPath.move(to: CGPoint(x: 118, y: 182))
        leftEyebrowPath.addQuadCurve(to: CGPoint(x: 181, y: 219), controlPoint: CGPoint(x: 145, y: 200))
        leftEyebrowPath.addQuadCurve(to: CGPoint(x: 181, y: 217), controlPoint: CGPoint(x: 183, y: 219))
        leftEyebrowPath.addQuadCurve(to: CGPoint(x: 118, y: 179), controlPoint: CGPoint(x: 151, y: 197))
        leftEyebrowPath.addQuadCurve(to: CGPoint(x: 118, y: 182), controlPoint: CGPoint(x: 116, y: 180))
        
        let leftEyebrowLayer = CAShapeLayer()
        leftEyebrowLayer.path = leftEyebrowPath.cgPath
        leftEyebrowLayer.lineWidth = 0.5
//        leftEyebrowLayer.strokeColor = UIColor(named: "Outline")?.cgColor
//        leftEyebrowLayer.fillColor = UIColor.clear.cgColor
        leftEyebrowLayer.fillColor = UIColor(named: "Outline")?.cgColor
        
        return leftEyebrowLayer
    }
    
    // 右眉毛
    func addRightEyebrow() -> CAShapeLayer {
        let rightEyebrowPath = UIBezierPath()
        rightEyebrowPath.move(to: CGPoint(x: 239, y: 209))
        rightEyebrowPath.addQuadCurve(to: CGPoint(x: 275, y: 170), controlPoint: CGPoint(x: 260, y: 189))
        rightEyebrowPath.addQuadCurve(to: CGPoint(x: 277, y: 173), controlPoint: CGPoint(x: 279, y: 168))
        rightEyebrowPath.addQuadCurve(to: CGPoint(x: 240, y: 211), controlPoint: CGPoint(x: 267, y: 189))
        rightEyebrowPath.addQuadCurve(to: CGPoint(x: 239, y: 209), controlPoint: CGPoint(x: 238, y: 211))
        
        let rightEyebrowLayer = CAShapeLayer()
        rightEyebrowLayer.path = rightEyebrowPath.cgPath
//        rightEyebrowLayer.lineWidth = 0.5
//        rightEyebrowLayer.strokeColor = UIColor(named: "Outline")?.cgColor
//        rightEyebrowLayer.fillColor = UIColor.clear.cgColor
        rightEyebrowLayer.fillColor = UIColor(named: "Outline")?.cgColor
        
        return rightEyebrowLayer
    }
    
    // 脖子
    func addNeck() -> CAShapeLayer {
        let neck1Path = UIBezierPath()
        neck1Path.move(to: CGPoint(x: 175, y: 354))
        neck1Path.addQuadCurve(to: CGPoint(x: 216, y: 357), controlPoint: CGPoint(x: 193, y: 357))
        neck1Path.addLine(to: CGPoint(x: 215, y: 366))
        neck1Path.addQuadCurve(to: CGPoint(x: 175, y: 362), controlPoint: CGPoint(x: 190, y: 366))
        let neck1Layer = CAShapeLayer()
        neck1Layer.path = neck1Path.cgPath
        neck1Layer.lineWidth = 1.5
        neck1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        neck1Layer.fillColor = UIColor.clear.cgColor
        neck1Layer.fillColor = UIColor(red: 112/255, green: 64/255, blue: 65/255, alpha: 1).cgColor
        
        let neck2Path = UIBezierPath()
        neck2Path.move(to: CGPoint(x: 213, y: 356))
        neck2Path.addQuadCurve(to: CGPoint(x: 226, y: 354), controlPoint: CGPoint(x: 219, y: 354))
        neck2Path.addLine(to: CGPoint(x: 225, y: 362))
        neck2Path.addQuadCurve(to: CGPoint(x: 213, y: 366), controlPoint: CGPoint(x: 222, y: 367))
        neck2Path.close()
        let neck2Layer = CAShapeLayer()
        neck2Layer.path = neck2Path.cgPath
        neck2Layer.lineWidth = 2.5
        neck2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        neck2Layer.fillColor = UIColor.clear.cgColor
        neck2Layer.fillColor = UIColor(red: 112/255, green: 64/255, blue: 65/255, alpha: 1).cgColor
        neck1Layer.addSublayer(neck2Layer)
        
        return neck1Layer
    }
    
    // 身體
    func addBody() -> CAShapeLayer {
        let bodyPath = UIBezierPath()
        bodyPath.move(to: CGPoint(x: 178, y: 349))
        bodyPath.addLine(to: CGPoint(x: 180, y: 390))
        bodyPath.addLine(to: CGPoint(x: 248, y: 390))
        bodyPath.addLine(to: CGPoint(x: 248, y: 376))
        bodyPath.addLine(to: CGPoint(x: 224, y: 350))
        bodyPath.close()
        
        let bodyLayer = CAShapeLayer()
        bodyLayer.path = bodyPath.cgPath
        bodyLayer.fillColor = UIColor(named: "Face")?.cgColor
        
        return bodyLayer
    }
    
    // 衣服
    func addClothe() -> CAShapeLayer {
        let leftClothePath = UIBezierPath()
        leftClothePath.move(to: CGPoint(x: 175, y: 337))
        leftClothePath.addQuadCurve(to: CGPoint(x: 179, y: 377), controlPoint: CGPoint(x: 181, y: 360))
        leftClothePath.addLine(to: CGPoint(x: 172, y: 390))
        leftClothePath.addLine(to: CGPoint(x: 159, y: 390))
        leftClothePath.addQuadCurve(to: CGPoint(x: 164, y: 339), controlPoint: CGPoint(x: 173, y: 371))
        leftClothePath.close()
        let leftClotheLayer = CAShapeLayer()
        leftClotheLayer.path = leftClothePath.cgPath
        leftClotheLayer.lineWidth = 2
        leftClotheLayer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftClotheLayer.fillColor = UIColor.clear.cgColor
        leftClotheLayer.fillColor = UIColor(red: 197/255, green: 159/255, blue: 66/255, alpha: 1).cgColor
        
        let leftClothe2Path = UIBezierPath()
        leftClothe2Path.move(to: CGPoint(x: 164, y: 339))
        leftClothe2Path.addQuadCurve(to: CGPoint(x: 159, y: 390), controlPoint: CGPoint(x: 173, y: 371))
        leftClothe2Path.addLine(to: CGPoint(x: 109, y: 390))
        leftClothe2Path.addLine(to: CGPoint(x: 128, y: 372))
        leftClothe2Path.addLine(to: CGPoint(x: 136, y: 340))
        leftClothe2Path.close()
        let leftClothe2Layer = CAShapeLayer()
        leftClothe2Layer.path = leftClothe2Path.cgPath
        leftClothe2Layer.lineWidth = 2
        leftClothe2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftClothe2Layer.fillColor = UIColor.clear.cgColor
        leftClothe2Layer.fillColor = UIColor(red: 86/255, green: 55/255, blue: 59/255, alpha: 1).cgColor
        
        let leftClothe3Path = UIBezierPath()
        leftClothe3Path.move(to: CGPoint(x: 174, y: 336))
        leftClothe3Path.addLine(to: CGPoint(x: 171, y: 359))
        leftClothe3Path.addLine(to: CGPoint(x: 164, y: 372))
        leftClothe3Path.addLine(to: CGPoint(x: 159, y: 390))
//        leftClothe3Path.move(to: CGPoint(x: 154, y: 390))
        leftClothe3Path.addLine(to: CGPoint(x: 154, y: 390))
        leftClothe3Path.addLine(to: CGPoint(x: 136, y: 374))
        leftClothe3Path.addLine(to: CGPoint(x: 123, y: 367))
        leftClothe3Path.addLine(to: CGPoint(x: 135, y: 339))
        leftClothe3Path.addQuadCurve(to: CGPoint(x: 174, y: 336), controlPoint: CGPoint(x: 152, y: 341))
        let leftClothe3Layer = CAShapeLayer()
        leftClothe3Layer.path = leftClothe3Path.cgPath
        leftClothe3Layer.lineWidth = 2
        leftClothe3Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftClothe3Layer.fillColor = UIColor.clear.cgColor
        leftClothe3Layer.fillColor = UIColor(red: 246/255, green: 197/255, blue: 83/255, alpha: 1).cgColor
        
        let leftClothe4Path = UIBezierPath()
        leftClothe4Path.move(to: CGPoint(x: 163, y: 339))
        leftClothe4Path.addQuadCurve(to: CGPoint(x: 155, y: 363), controlPoint: CGPoint(x: 161, y: 354))
        leftClothe4Path.addQuadCurve(to: CGPoint(x: 153, y: 374), controlPoint: CGPoint(x: 152, y: 366))
        leftClothe4Path.addLine(to: CGPoint(x: 128, y: 358))
        leftClothe4Path.addLine(to: CGPoint(x: 136, y: 340))
        leftClothe4Path.addQuadCurve(to: CGPoint(x: 163, y: 339), controlPoint: CGPoint(x: 152, y: 340))
        let leftClothe4Layer = CAShapeLayer()
        leftClothe4Layer.path = leftClothe4Path.cgPath
        leftClothe4Layer.lineWidth = 2
        leftClothe4Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftClothe4Layer.fillColor = UIColor.clear.cgColor
        leftClothe4Layer.fillColor = UIColor(red: 87/255, green: 57/255, blue: 60/255, alpha: 1).cgColor
        
        let leftClothe5Path = UIBezierPath()
        leftClothe5Path.move(to: CGPoint(x: 180, y: 371))
        leftClothe5Path.addLine(to: CGPoint(x: 215, y: 390))
        leftClothe5Path.addLine(to: CGPoint(x: 170, y: 390))
        leftClothe5Path.close()
        let leftClothe5Layer = CAShapeLayer()
        leftClothe5Layer.path = leftClothe5Path.cgPath
        leftClothe5Layer.lineWidth = 1.5
        leftClothe5Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftClothe5Layer.fillColor = UIColor.clear.cgColor
        leftClothe5Layer.fillColor = UIColor(red: 247/255, green: 198/255, blue: 129/255, alpha: 1).cgColor
        
        let leftClothe6Path = UIBezierPath()
        leftClothe6Path.move(to: CGPoint(x: 178, y: 376))
        leftClothe6Path.addLine(to: CGPoint(x: 205, y: 390))
        leftClothe6Path.addLine(to: CGPoint(x: 170, y: 390))
        leftClothe6Path.close()
        let leftClothe6Layer = CAShapeLayer()
        leftClothe6Layer.path = leftClothe6Path.cgPath
        leftClothe6Layer.lineWidth = 1.5
        leftClothe6Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftClothe6Layer.fillColor = UIColor.clear.cgColor
        leftClothe6Layer.fillColor = UIColor(red: 244/255, green: 69/255, blue: 81/255, alpha: 1).cgColor
        
        let leftClothe6ShadowPath = UIBezierPath()
        leftClothe6ShadowPath.move(to: CGPoint(x: 189, y: 365))
        leftClothe6ShadowPath.addQuadCurve(to: CGPoint(x: 186, y: 390), controlPoint: CGPoint(x: 191, y: 377))
        leftClothe6ShadowPath.addLine(to: CGPoint(x: 170, y: 390))
        leftClothe6ShadowPath.addLine(to: CGPoint(x: 173, y: 364))
        let leftClothe6ShadowLayer = CAShapeLayer()
        leftClothe6ShadowLayer.path = leftClothe6ShadowPath.cgPath
        leftClothe6ShadowLayer.fillColor = UIColor(red: 100/255, green: 10/255, blue: 10/255, alpha: 0.1).cgColor
        
        let centerClothePath = UIBezierPath()
        centerClothePath.move(to: CGPoint(x: 181, y: 377))
        centerClothePath.addQuadCurve(to: CGPoint(x: 239, y: 377), controlPoint: CGPoint(x: 215, y: 384))
        centerClothePath.addLine(to: CGPoint(x: 248, y: 390))
        centerClothePath.addLine(to: CGPoint(x: 174, y: 390))
        centerClothePath.close()
        let centerClotheLayer = CAShapeLayer()
        centerClotheLayer.path = centerClothePath.cgPath
        centerClotheLayer.lineWidth = 1.5
        centerClotheLayer.strokeColor = UIColor(named: "Outline")?.cgColor
        centerClotheLayer.fillColor = UIColor.clear.cgColor
        centerClotheLayer.fillColor = UIColor.white.cgColor
        
        let rightClothe1Path = UIBezierPath()
        rightClothe1Path.move(to: CGPoint(x: 230, y: 366))
        rightClothe1Path.addLine(to: CGPoint(x: 220, y: 390))
        rightClothe1Path.addLine(to: CGPoint(x: 248, y: 390))
        rightClothe1Path.close()
        let rightClothe1Layer = CAShapeLayer()
        rightClothe1Layer.path = rightClothe1Path.cgPath
        rightClothe1Layer.lineWidth = 1.5
        rightClothe1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightClothe1Layer.fillColor = UIColor.clear.cgColor
        rightClothe1Layer.fillColor = UIColor(red: 247/255, green: 198/255, blue: 129/255, alpha: 1).cgColor
        
        let rightClothe2Path = UIBezierPath()
        rightClothe2Path.move(to: CGPoint(x: 233, y: 371))
        rightClothe2Path.addLine(to: CGPoint(x: 226, y: 390))
        rightClothe2Path.addLine(to: CGPoint(x: 248, y: 390))
        rightClothe2Path.close()
        let rightClothe2Layer = CAShapeLayer()
        rightClothe2Layer.path = rightClothe2Path.cgPath
        rightClothe2Layer.lineWidth = 1.5
        rightClothe2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightClothe2Layer.fillColor = UIColor.clear.cgColor
        rightClothe2Layer.fillColor = UIColor(red: 244/255, green: 69/255, blue: 81/255, alpha: 1).cgColor
        
        let rightClothe3Path = UIBezierPath()
        rightClothe3Path.move(to: CGPoint(x: 251, y: 346))
        rightClothe3Path.addQuadCurve(to: CGPoint(x: 274, y: 385), controlPoint: CGPoint(x: 257, y: 366))
        rightClothe3Path.addQuadCurve(to: CGPoint(x: 235, y: 373), controlPoint: CGPoint(x: 248, y: 383))
        rightClothe3Path.addLine(to: CGPoint(x: 230, y: 351))
        rightClothe3Path.addQuadCurve(to: CGPoint(x: 251, y: 346), controlPoint: CGPoint(x: 243, y: 349))
        let rightClothe3Layer = CAShapeLayer()
        rightClothe3Layer.path = rightClothe3Path.cgPath
        rightClothe3Layer.lineWidth = 1.5
        rightClothe3Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightClothe3Layer.fillColor = UIColor.clear.cgColor
        rightClothe3Layer.fillColor = UIColor(red: 187/255, green: 149/255, blue: 81/255, alpha: 1).cgColor
        
        let rightClothe4Path = UIBezierPath()
        rightClothe4Path.move(to: CGPoint(x: 243, y: 348))
        rightClothe4Path.addQuadCurve(to: CGPoint(x: 257, y: 381), controlPoint: CGPoint(x: 244, y: 368))
        rightClothe4Path.addQuadCurve(to: CGPoint(x: 235, y: 373), controlPoint: CGPoint(x: 241, y: 379))
        rightClothe4Path.addLine(to: CGPoint(x: 230, y: 351))
        rightClothe4Path.addQuadCurve(to: CGPoint(x: 243, y: 348), controlPoint: CGPoint(x: 234, y: 351))
        let rightClothe4Layer = CAShapeLayer()
        rightClothe4Layer.path = rightClothe4Path.cgPath
        rightClothe4Layer.lineWidth = 1.5
        rightClothe4Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightClothe4Layer.fillColor = UIColor.clear.cgColor
        rightClothe4Layer.fillColor = UIColor(red: 87/255, green: 57/255, blue: 60/255, alpha: 1).cgColor
        
        let rightClothe5Path = UIBezierPath()
        rightClothe5Path.move(to: CGPoint(x: 230, y: 360))
        rightClothe5Path.addLine(to: CGPoint(x: 255, y: 374))
        rightClothe5Path.addLine(to: CGPoint(x: 260, y: 390))
        rightClothe5Path.addLine(to: CGPoint(x: 239, y: 390))
        rightClothe5Path.addQuadCurve(to: CGPoint(x: 232, y: 374), controlPoint: CGPoint(x: 234, y: 384))
        rightClothe5Path.close()
        let rightClothe5Layer = CAShapeLayer()
        rightClothe5Layer.path = rightClothe5Path.cgPath
        rightClothe5Layer.lineWidth = 1.5
        rightClothe5Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightClothe5Layer.fillColor = UIColor.clear.cgColor
        rightClothe5Layer.fillColor = UIColor(red: 247/255, green: 198/255, blue: 129/255, alpha: 1).cgColor
        
        let rightClothe6Path = UIBezierPath()
        rightClothe6Path.move(to: CGPoint(x: 234, y: 363))
        rightClothe6Path.addQuadCurve(to: CGPoint(x: 247, y: 390), controlPoint: CGPoint(x: 239, y: 380))
        rightClothe6Path.addLine(to: CGPoint(x: 260, y: 390))
        rightClothe6Path.addLine(to: CGPoint(x: 255, y: 374))
        rightClothe6Path.close()
        let rightClothe6Layer = CAShapeLayer()
        rightClothe6Layer.path = rightClothe6Path.cgPath
        rightClothe6Layer.lineWidth = 1.5
        rightClothe6Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightClothe6Layer.fillColor = UIColor.clear.cgColor
        rightClothe6Layer.fillColor = UIColor(red: 87/255, green: 57/255, blue: 60/255, alpha: 1).cgColor
        
        let rightClothe7Path = UIBezierPath()
        rightClothe7Path.move(to: CGPoint(x: 235, y: 350))
        rightClothe7Path.addQuadCurve(to: CGPoint(x: 233, y: 378), controlPoint: CGPoint(x: 230, y: 362))
        rightClothe7Path.addLine(to: CGPoint(x: 226, y: 365))
        rightClothe7Path.addLine(to: CGPoint(x: 226, y: 351))
        rightClothe7Path.close()
        let rightClothe7Layer = CAShapeLayer()
        rightClothe7Layer.path = rightClothe7Path.cgPath
        rightClothe7Layer.lineWidth = 1.5
        rightClothe7Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightClothe7Layer.fillColor = UIColor.clear.cgColor
        rightClothe7Layer.fillColor = UIColor(red: 187/255, green: 149/255, blue: 81/255, alpha: 1).cgColor
        
        centerClotheLayer.addSublayer(leftClothe5Layer)
        centerClotheLayer.addSublayer(rightClothe1Layer)
        leftClothe5Layer.addSublayer(leftClothe6Layer)
        leftClothe5Layer.addSublayer(leftClothe6ShadowLayer)
        leftClothe5Layer.addSublayer(leftClothe2Layer)
        leftClothe2Layer.addSublayer(leftClotheLayer)
        leftClothe2Layer.addSublayer(leftClothe3Layer)
        leftClothe2Layer.addSublayer(leftClothe4Layer)
        rightClothe1Layer.addSublayer(rightClothe3Layer)
        rightClothe1Layer.addSublayer(rightClothe4Layer)
        rightClothe1Layer.addSublayer(rightClothe2Layer)
        rightClothe1Layer.addSublayer(rightClothe5Layer)
        rightClothe1Layer.addSublayer(rightClothe6Layer)
        rightClothe1Layer.addSublayer(rightClothe7Layer)
        
        return centerClotheLayer
    }
    
    // 帽子 後層
    func addHat_back() -> CAShapeLayer {
        let hatPath = UIBezierPath()
        hatPath.move(to: CGPoint(x: -1, y: 265))
        hatPath.addQuadCurve(to: CGPoint(x: 240, y: 143), controlPoint: CGPoint(x: 89, y: 163))
        hatPath.addQuadCurve(to: CGPoint(x: 326, y: 164), controlPoint: CGPoint(x: 281, y: 150))
        hatPath.addQuadCurve(to: CGPoint(x: 391, y: 173), controlPoint: CGPoint(x: 360, y: 169))
        hatPath.addLine(to: CGPoint(x: 391, y: 190))
        hatPath.addQuadCurve(to: CGPoint(x: 330, y: 207), controlPoint: CGPoint(x: 346, y: 197))
        hatPath.addLine(to: CGPoint(x: 42, y: 292))
        hatPath.addLine(to: CGPoint(x: -1, y: 298))
        hatPath.close()
        
        let hatLayer = CAShapeLayer()
        hatLayer.path = hatPath.cgPath
        hatLayer.lineWidth = 2.5
        hatLayer.strokeColor = UIColor(named: "Outline")?.cgColor
        hatLayer.fillColor = UIColor.clear.cgColor
        hatLayer.fillColor = UIColor(red: 84/255, green: 71/255, blue: 97/255, alpha: 1).cgColor
        
        return hatLayer
    }
    
    func addHair_ClotheBack() -> CAShapeLayer {
        let leftHairPath = UIBezierPath()
        leftHairPath.move(to: CGPoint(x: 85, y: 390))
        leftHairPath.addQuadCurve(to: CGPoint(x: 87, y: 326), controlPoint: CGPoint(x: 92, y: 367))
        leftHairPath.addLine(to: CGPoint(x: 138, y: 322))
        leftHairPath.addLine(to: CGPoint(x: 138, y: 390))
        leftHairPath.close()
        let leftHairLayer = CAShapeLayer()
        leftHairLayer.path = leftHairPath.cgPath
        leftHairLayer.lineWidth = 2
        leftHairLayer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftHairLayer.fillColor = UIColor.clear.cgColor
        leftHairLayer.fillColor = UIColor(red: 98/255, green: 61/255, blue: 60/255, alpha: 1).cgColor
        
        let leftHair2Path = UIBezierPath()
        leftHair2Path.move(to: CGPoint(x: 82, y: 192))
        leftHair2Path.addLine(to: CGPoint(x: 45, y: 220))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 34, y: 248), controlPoint: CGPoint(x: 38, y: 231))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 18, y: 267), controlPoint: CGPoint(x: 31, y: 261))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 42, y: 251), controlPoint: CGPoint(x: 39, y: 266))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 51, y: 309), controlPoint: CGPoint(x: 32, y: 275))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 55, y: 268), controlPoint: CGPoint(x: 55, y: 287))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 66, y: 324), controlPoint: CGPoint(x: 52, y: 306))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 69, y: 344), controlPoint: CGPoint(x: 70, y: 330))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 76, y: 326), controlPoint: CGPoint(x: 78, y: 336))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 97, y: 390), controlPoint: CGPoint(x: 92, y: 362))
        leftHair2Path.addLine(to: CGPoint(x: 138, y: 390))
        leftHair2Path.addLine(to: CGPoint(x: 136, y: 340))
        leftHair2Path.addLine(to: CGPoint(x: 79, y: 220))
        leftHair2Path.addQuadCurve(to: CGPoint(x: 82, y: 192), controlPoint: CGPoint(x: 76, y: 208))
        let leftHair2Layer = CAShapeLayer()
        leftHair2Layer.path = leftHair2Path.cgPath
        leftHair2Layer.lineWidth = 2
        leftHair2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        leftHair2Layer.fillColor = UIColor.clear.cgColor
        leftHair2Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let rightHair1Path = UIBezierPath()
        rightHair1Path.move(to: CGPoint(x: 289, y: 375))
        rightHair1Path.addQuadCurve(to: CGPoint(x: 288, y: 390), controlPoint: CGPoint(x: 288, y: 385))
        rightHair1Path.addLine(to: CGPoint(x: 236, y: 390))
        rightHair1Path.addLine(to: CGPoint(x: 236, y: 343))
        rightHair1Path.addLine(to: CGPoint(x: 282, y: 341))
        rightHair1Path.close()
        let rightHair1Layer = CAShapeLayer()
        rightHair1Layer.path = rightHair1Path.cgPath
        rightHair1Layer.lineWidth = 2
        rightHair1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair1Layer.fillColor = UIColor.clear.cgColor
        rightHair1Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let rightHair2Path = UIBezierPath()
        rightHair2Path.move(to: CGPoint(x: 287, y: 325))
        rightHair2Path.addQuadCurve(to: CGPoint(x: 306, y: 384), controlPoint: CGPoint(x: 287, y: 362))
        rightHair2Path.addQuadCurve(to: CGPoint(x: 280, y: 365), controlPoint: CGPoint(x: 288, y: 378))
        rightHair2Path.addQuadCurve(to: CGPoint(x: 280, y: 390), controlPoint: CGPoint(x: 283, y: 378))
        rightHair2Path.addQuadCurve(to: CGPoint(x: 256, y: 342), controlPoint: CGPoint(x: 246, y: 367))
        let rightHair2Layer = CAShapeLayer()
        rightHair2Layer.path = rightHair2Path.cgPath
        rightHair2Layer.lineWidth = 2
        rightHair2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair2Layer.fillColor = UIColor.clear.cgColor
        rightHair2Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        
        
        let rightHair3Path = UIBezierPath()
        rightHair3Path.move(to: CGPoint(x: 312, y: 160))
        rightHair3Path.addQuadCurve(to: CGPoint(x: 364, y: 173), controlPoint: CGPoint(x: 327, y: 172))
        rightHair3Path.addQuadCurve(to: CGPoint(x: 300, y: 168), controlPoint: CGPoint(x: 323, y: 179))
        let rightHair3Layer = CAShapeLayer()
        rightHair3Layer.path = rightHair3Path.cgPath
        rightHair3Layer.lineWidth = 2
        rightHair3Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair3Layer.fillColor = UIColor.clear.cgColor
        rightHair3Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let rightHair4Path = UIBezierPath()
        rightHair4Path.move(to: CGPoint(x: 307, y: 166))
        rightHair4Path.addQuadCurve(to: CGPoint(x: 340, y: 293), controlPoint: CGPoint(x: 335, y: 204))
        rightHair4Path.addQuadCurve(to: CGPoint(x: 320, y: 215), controlPoint: CGPoint(x: 331, y: 246))
        rightHair4Path.addQuadCurve(to: CGPoint(x: 324, y: 309), controlPoint: CGPoint(x: 333, y: 265))
        rightHair4Path.addQuadCurve(to: CGPoint(x: 327, y: 340), controlPoint: CGPoint(x: 323, y: 320))
        rightHair4Path.addQuadCurve(to: CGPoint(x: 285, y: 170), controlPoint: CGPoint(x: 293, y: 296))
        let rightHair4Layer = CAShapeLayer()
        rightHair4Layer.path = rightHair4Path.cgPath
        rightHair4Layer.lineWidth = 2
        rightHair4Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair4Layer.fillColor = UIColor.clear.cgColor
        rightHair4Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let rightHair5Path = UIBezierPath()
        rightHair5Path.move(to: CGPoint(x: 298, y: 222))
        rightHair5Path.addQuadCurve(to: CGPoint(x: 298, y: 360), controlPoint: CGPoint(x: 339, y: 282))
        rightHair5Path.addQuadCurve(to: CGPoint(x: 298, y: 333), controlPoint: CGPoint(x: 298, y: 349))
        rightHair5Path.addQuadCurve(to: CGPoint(x: 275, y: 370), controlPoint: CGPoint(x: 292, y: 365))
        rightHair5Path.addQuadCurve(to: CGPoint(x: 276, y: 230), controlPoint: CGPoint(x: 280, y: 276))
        let rightHair5Layer = CAShapeLayer()
        rightHair5Layer.path = rightHair5Path.cgPath
        rightHair5Layer.lineWidth = 2
        rightHair5Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair5Layer.fillColor = UIColor.clear.cgColor
        rightHair5Layer.fillColor = UIColor(red: 98/255, green: 64/255, blue: 63/255, alpha: 1).cgColor
        
        let rightHair6Path = UIBezierPath()
        rightHair6Path.move(to: CGPoint(x: 293, y: 161))
        rightHair6Path.addQuadCurve(to: CGPoint(x: 300, y: 250), controlPoint: CGPoint(x: 315, y: 206))
        rightHair6Path.addQuadCurve(to: CGPoint(x: 269, y: 171), controlPoint: CGPoint(x: 266, y: 217))
        let rightHair6Layer = CAShapeLayer()
        rightHair6Layer.path = rightHair6Path.cgPath
        rightHair6Layer.lineWidth = 2
        rightHair6Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair6Layer.fillColor = UIColor.clear.cgColor
        rightHair6Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let rightHair7Path = UIBezierPath()
        rightHair7Path.move(to: CGPoint(x: 270, y: 141))
        rightHair7Path.addLine(to: CGPoint(x: 288, y: 149))
        rightHair7Path.addLine(to: CGPoint(x: 293, y: 161))
        rightHair7Path.addLine(to: CGPoint(x: 278, y: 168))
        let rightHair7Layer = CAShapeLayer()
        rightHair7Layer.path = rightHair7Path.cgPath
//        rightHair7Layer.lineWidth = 2
//        rightHair7Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair7Layer.fillColor = UIColor.clear.cgColor
        rightHair7Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let rightHair8Path = UIBezierPath()
        rightHair8Path.move(to: CGPoint(x: 287, y: 149))
        rightHair8Path.addLine(to: CGPoint(x: 313, y: 161))
        rightHair8Path.addLine(to: CGPoint(x: 297, y: 170))
        let rightHair8Layer = CAShapeLayer()
        rightHair8Layer.path = rightHair8Path.cgPath
//        rightHair8Layer.lineWidth = 2
//        rightHair8Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        rightHair8Layer.fillColor = UIColor.clear.cgColor
        rightHair8Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        leftHairLayer.addSublayer(rightHair3Layer)
        leftHairLayer.addSublayer(rightHair4Layer)
        leftHairLayer.addSublayer(rightHair5Layer)
        leftHairLayer.addSublayer(rightHair8Layer)
        leftHairLayer.addSublayer(rightHair6Layer)
        leftHairLayer.addSublayer(rightHair7Layer)
        
        leftHairLayer.addSublayer(rightHair1Layer)
        leftHairLayer.addSublayer(rightHair2Layer)
        leftHairLayer.addSublayer(leftHair2Layer)
        
        return leftHairLayer
    }
    
    func addHair_Front() -> CAShapeLayer {
        let hair1Path = UIBezierPath()
        hair1Path.move(to: CGPoint(x: 160, y: 154))
        hair1Path.addQuadCurve(to: CGPoint(x: 139, y: 238), controlPoint: CGPoint(x: 154, y: 197))
        hair1Path.addQuadCurve(to: CGPoint(x: 143, y: 180), controlPoint: CGPoint(x: 136, y: 207))
        hair1Path.addQuadCurve(to: CGPoint(x: 85, y: 249), controlPoint: CGPoint(x: 117, y: 244))
        hair1Path.addLine(to: CGPoint(x: 83, y: 220))
        let hair1Layer = CAShapeLayer()
        hair1Layer.path = hair1Path.cgPath
        hair1Layer.lineWidth = 2
        hair1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hair1Layer.fillColor = UIColor.clear.cgColor
        hair1Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let hair1_1Path = UIBezierPath()
        hair1_1Path.move(to: CGPoint(x: 79, y: 189))
        hair1_1Path.addLine(to: CGPoint(x: 160, y: 154))
        hair1_1Path.addQuadCurve(to: CGPoint(x: 73, y: 222), controlPoint: CGPoint(x: 97, y: 218))
        hair1_1Path.close()
        let hair1_1Layer = CAShapeLayer()
        hair1_1Layer.path = hair1_1Path.cgPath
//        hair1_1Layer.lineWidth = 2
//        hair1_1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hair1_1Layer.fillColor = UIColor.clear.cgColor
        hair1_1Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let hair1_2Path = UIBezierPath()
        hair1_2Path.move(to: CGPoint(x: 110, y: 390))
        hair1_2Path.addLine(to: CGPoint(x: 126, y: 390))
        hair1_2Path.addQuadCurve(to: CGPoint(x: 117, y: 357), controlPoint: CGPoint(x: 120, y: 376))
        hair1_2Path.addQuadCurve(to: CGPoint(x: 125, y: 377), controlPoint: CGPoint(x: 120, y: 368))
        hair1_2Path.addQuadCurve(to: CGPoint(x: 119, y: 331), controlPoint: CGPoint(x: 119, y: 355))
        hair1_2Path.addLine(to: CGPoint(x: 108, y: 270))
        hair1_2Path.addLine(to: CGPoint(x: 83, y: 269))
        hair1_2Path.addLine(to: CGPoint(x: 83, y: 306))
        
        let hair1_2Layer = CAShapeLayer()
        hair1_2Layer.path = hair1_2Path.cgPath
        hair1_2Layer.lineWidth = 2
        hair1_2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hair1_2Layer.fillColor = UIColor.clear.cgColor
        hair1_2Layer.fillColor = UIColor(red: 98/255, green: 64/255, blue: 63/255, alpha: 1).cgColor
        
        let hair2Path = UIBezierPath()
        hair2Path.move(to: CGPoint(x: 129, y: 191))
        hair2Path.addQuadCurve(to: CGPoint(x: 118, y: 246), controlPoint: CGPoint(x: 119, y: 211))
        hair2Path.addQuadCurve(to: CGPoint(x: 137, y: 292), controlPoint: CGPoint(x: 119, y: 267))
        hair2Path.addQuadCurve(to: CGPoint(x: 117, y: 269), controlPoint: CGPoint(x: 120, y: 280))
        hair2Path.addQuadCurve(to: CGPoint(x: 136, y: 366), controlPoint: CGPoint(x: 117, y: 304))
        hair2Path.addQuadCurve(to: CGPoint(x: 104, y: 271), controlPoint: CGPoint(x: 100, y: 333))
        hair2Path.addQuadCurve(to: CGPoint(x: 117, y: 382), controlPoint: CGPoint(x: 102, y: 329))
        hair2Path.addQuadCurve(to: CGPoint(x: 77, y: 220), controlPoint: CGPoint(x: 65, y: 298))
        let hair2Layer = CAShapeLayer()
        hair2Layer.path = hair2Path.cgPath
        hair2Layer.lineWidth = 2
        hair2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hair2Layer.fillColor = UIColor.clear.cgColor
        hair2Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let hair3Path = UIBezierPath()
        hair3Path.move(to: CGPoint(x: 218, y: 140))
        hair3Path.addQuadCurve(to: CGPoint(x: 254, y: 220), controlPoint: CGPoint(x: 230, y: 184))
        hair3Path.addQuadCurve(to: CGPoint(x: 208, y: 222), controlPoint: CGPoint(x: 231, y: 225))
        hair3Path.addLine(to: CGPoint(x: 202, y: 206))
        hair3Path.addLine(to: CGPoint(x: 204, y: 222))
        hair3Path.addQuadCurve(to: CGPoint(x: 199, y: 220), controlPoint: CGPoint(x: 200, y: 222))
        hair3Path.addQuadCurve(to: CGPoint(x: 176, y: 169), controlPoint: CGPoint(x: 184, y: 195))
        hair3Path.addQuadCurve(to: CGPoint(x: 192, y: 222), controlPoint: CGPoint(x: 181, y: 196))
        hair3Path.addQuadCurve(to: CGPoint(x: 162, y: 154), controlPoint: CGPoint(x: 165, y: 182))
        let hair3Layer = CAShapeLayer()
        hair3Layer.path = hair3Path.cgPath
        hair3Layer.lineWidth = 2
        hair3Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hair3Layer.fillColor = UIColor.clear.cgColor
        hair3Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let hair4Path = UIBezierPath()
        hair4Path.move(to: CGPoint(x: 283, y: 171))
        hair4Path.addQuadCurve(to: CGPoint(x: 292, y: 227), controlPoint: CGPoint(x: 296, y: 197))
        hair4Path.addLine(to: CGPoint(x: 288, y: 219))
        hair4Path.addLine(to: CGPoint(x: 287, y: 225))
        hair4Path.addLine(to: CGPoint(x: 274, y: 222))
        hair4Path.addQuadCurve(to: CGPoint(x: 221, y: 142), controlPoint: CGPoint(x: 243, y: 191))
        let hair4Layer = CAShapeLayer()
        hair4Layer.path = hair4Path.cgPath
        hair4Layer.lineWidth = 2
        hair4Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hair4Layer.fillColor = UIColor.clear.cgColor
        hair4Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        let hair5Path = UIBezierPath()
        hair5Path.move(to: CGPoint(x: 223, y: 144))
        hair5Path.addLine(to: CGPoint(x: 241, y: 136))
        hair5Path.addLine(to: CGPoint(x: 270, y: 139))
        hair5Path.addQuadCurve(to: CGPoint(x: 289, y: 194), controlPoint: CGPoint(x: 278, y: 157))
        hair5Path.addQuadCurve(to: CGPoint(x: 249, y: 190), controlPoint: CGPoint(x: 270, y: 185))
        hair5Path.addQuadCurve(to: CGPoint(x: 223, y: 144), controlPoint: CGPoint(x: 234, y: 168))
        let hair5Layer = CAShapeLayer()
        hair5Layer.path = hair5Path.cgPath
//        hair5Layer.lineWidth = 2
//        hair5Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hair5Layer.fillColor = UIColor.clear.cgColor
        hair5Layer.fillColor = UIColor(named: "Hair")?.cgColor
        
        hair1Layer.addSublayer(hair1_1Layer)
        hair1Layer.addSublayer(hair1_2Layer)
        hair1Layer.addSublayer(hair2Layer)
        hair1Layer.addSublayer(hair3Layer)
        hair1Layer.addSublayer(hair4Layer)
        hair1Layer.addSublayer(hair5Layer)
        
        
        return hair1Layer
    }
    
    // 頭髮陰影
    func addHairShadow() -> CAShapeLayer {
        let shadow1Path = UIBezierPath()
        shadow1Path.move(to: CGPoint(x: 41, y: 217))
        shadow1Path.addQuadCurve(to: CGPoint(x: 20, y: 266), controlPoint: CGPoint(x: 41, y: 245))
        shadow1Path.addQuadCurve(to: CGPoint(x: 40, y: 255), controlPoint: CGPoint(x: 37, y: 265))
        shadow1Path.addQuadCurve(to: CGPoint(x: 40, y: 283), controlPoint: CGPoint(x: 35, y: 267))
        shadow1Path.addQuadCurve(to: CGPoint(x: 72, y: 255), controlPoint: CGPoint(x: 53, y: 258))
        shadow1Path.addQuadCurve(to: CGPoint(x: 117, y: 226), controlPoint: CGPoint(x: 75, y: 235))
        shadow1Path.addQuadCurve(to: CGPoint(x: 228, y: 189), controlPoint: CGPoint(x: 170, y: 193))
        shadow1Path.addQuadCurve(to: CGPoint(x: 244, y: 207), controlPoint: CGPoint(x: 232, y: 197))
        shadow1Path.addQuadCurve(to: CGPoint(x: 236, y: 187), controlPoint: CGPoint(x: 238, y: 192))
        shadow1Path.addQuadCurve(to: CGPoint(x: 289, y: 194), controlPoint: CGPoint(x: 268, y: 190))
        shadow1Path.addQuadCurve(to: CGPoint(x: 292, y: 226), controlPoint: CGPoint(x: 297, y: 213))
        shadow1Path.addQuadCurve(to: CGPoint(x: 297, y: 197), controlPoint: CGPoint(x: 299, y: 216))
        shadow1Path.addQuadCurve(to: CGPoint(x: 324, y: 205), controlPoint: CGPoint(x: 314, y: 195))
        shadow1Path.addQuadCurve(to: CGPoint(x: 310, y: 170), controlPoint: CGPoint(x: 322, y: 185))
        shadow1Path.addQuadCurve(to: CGPoint(x: 361, y: 174), controlPoint: CGPoint(x: 333, y: 181))
        shadow1Path.addQuadCurve(to: CGPoint(x: 316, y: 162), controlPoint: CGPoint(x: 328, y: 173))
        shadow1Path.addLine(to: CGPoint(x: 235, y: 117))
        shadow1Path.addLine(to: CGPoint(x: 44, y: 194))
        
        let shadow1Layer = CAShapeLayer()
        shadow1Layer.path = shadow1Path.cgPath
//        shadow1Layer.lineWidth = 2
//        shadow1Layer.strokeColor = UIColor.white.cgColor
//        shadow1Layer.fillColor = UIColor.clear.cgColor
        shadow1Layer.fillColor = UIColor(red: 100/255, green: 10/255, blue: 10/255, alpha: 0.1).cgColor
        
        return shadow1Layer
    }
    
    func addHat() -> CAShapeLayer {
        let hat1Path = UIBezierPath()
        hat1Path.move(to: CGPoint(x: 0, y: 99))
        hat1Path.addQuadCurve(to: CGPoint(x: 15, y: 83), controlPoint: CGPoint(x: 8, y: 95))
        hat1Path.addLine(to: CGPoint(x: 17, y: 128))
        hat1Path.addQuadCurve(to: CGPoint(x: 0, y: 132), controlPoint: CGPoint(x: 8, y: 132))
        
        let hat1Layer = CAShapeLayer()
        hat1Layer.path = hat1Path.cgPath
        hat1Layer.lineWidth = 2
        hat1Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat1Layer.fillColor = UIColor.clear.cgColor
        hat1Layer.fillColor = UIColor(red: 75/255, green: 57/255, blue: 56/255, alpha: 1).cgColor
        
        let hat2Path = UIBezierPath()
        hat2Path.move(to: CGPoint(x: 0, y: 115))
        hat2Path.addQuadCurve(to: CGPoint(x: 15, y: 83), controlPoint: CGPoint(x: 12, y: 101))
        hat2Path.addQuadCurve(to: CGPoint(x: 32, y: 50), controlPoint: CGPoint(x: 21, y: 64))
        hat2Path.addQuadCurve(to: CGPoint(x: 37, y: 132), controlPoint: CGPoint(x: 60, y: 86))
        hat2Path.addQuadCurve(to: CGPoint(x: 14, y: 127), controlPoint: CGPoint(x: 24, y: 135))
        let hat2Layer = CAShapeLayer()
        hat2Layer.path = hat2Path.cgPath
        hat2Layer.lineWidth = 2
        hat2Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat2Layer.fillColor = UIColor.clear.cgColor
        hat2Layer.fillColor = UIColor(red: 101/255, green: 76/255, blue: 79/255, alpha: 1).cgColor
        
        let hat2ShadowPath = UIBezierPath()
        hat2ShadowPath.move(to: CGPoint(x: 14, y: 127))
        hat2ShadowPath.addQuadCurve(to: CGPoint(x: 37, y: 132), controlPoint: CGPoint(x: 24, y: 135))
        hat2ShadowPath.addQuadCurve(to: CGPoint(x: 36, y: 97), controlPoint: CGPoint(x: 47, y: 110))
        hat2ShadowPath.addQuadCurve(to: CGPoint(x: 27, y: 127), controlPoint: CGPoint(x: 33, y: 119))
        hat2ShadowPath.addQuadCurve(to: CGPoint(x: 14, y: 127), controlPoint: CGPoint(x: 20, y: 127))
        let hat2ShadowLayer = CAShapeLayer()
        hat2ShadowLayer.path = hat2ShadowPath.cgPath
//        hat2ShadowLayer.lineWidth = 2
//        hat2ShadowLayer.strokeColor = UIColor.white.cgColor
        hat2ShadowLayer.fillColor = UIColor(red: 76/255, green: 59/255, blue: 59/255, alpha: 1).cgColor
        
        let hat3Path = UIBezierPath()
        hat3Path.move(to: CGPoint(x: 32, y: 50))
        hat3Path.addQuadCurve(to: CGPoint(x: 98, y: 6), controlPoint: CGPoint(x: 59, y: 26))
        hat3Path.addQuadCurve(to: CGPoint(x: 281, y: 112), controlPoint: CGPoint(x: 243, y: 40))
        hat3Path.addQuadCurve(to: CGPoint(x: 102, y: 150), controlPoint: CGPoint(x: 184, y: 108))
        hat3Path.addQuadCurve(to: CGPoint(x: 31, y: 183), controlPoint: CGPoint(x: 74, y: 161))
        hat3Path.addQuadCurve(to: CGPoint(x: 43, y: 114), controlPoint: CGPoint(x: 25, y: 170))
        hat3Path.addQuadCurve(to: CGPoint(x: 36, y: 94), controlPoint: CGPoint(x: 37, y: 107))
        let hat3Layer = CAShapeLayer()
        hat3Layer.path = hat3Path.cgPath
        hat3Layer.lineWidth = 2
        hat3Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat3Layer.fillColor = UIColor.clear.cgColor
        hat3Layer.fillColor = UIColor(red: 101/255, green: 76/255, blue: 79/255, alpha: 1).cgColor
        
        let hat4Path = UIBezierPath()
        hat4Path.move(to: CGPoint(x: 0, y: 212))
        hat4Path.addQuadCurve(to: CGPoint(x: 31, y: 183), controlPoint: CGPoint(x: 8, y: 198))
        hat4Path.addQuadCurve(to: CGPoint(x: 102, y: 150), controlPoint: CGPoint(x: 74, y: 161))
        hat4Path.addQuadCurve(to: CGPoint(x: 281, y: 112), controlPoint: CGPoint(x: 184, y: 108))
        hat4Path.addQuadCurve(to: CGPoint(x: 390, y: 156), controlPoint: CGPoint(x: 336, y: 131))
        hat4Path.addLine(to: CGPoint(x: 390, y: 173))
        hat4Path.addQuadCurve(to: CGPoint(x: 327, y: 164), controlPoint: CGPoint(x: 360, y: 170))
        hat4Path.addQuadCurve(to: CGPoint(x: 241, y: 141), controlPoint: CGPoint(x: 281, y: 148))
        hat4Path.addQuadCurve(to: CGPoint(x: 0, y: 261), controlPoint: CGPoint(x: 85, y: 167))
        let hat4Layer = CAShapeLayer()
        hat4Layer.path = hat4Path.cgPath
        hat4Layer.lineWidth = 2.5
        hat4Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat4Layer.fillColor = UIColor.clear.cgColor
        hat4Layer.fillColor = UIColor(red: 251/255, green: 200/255, blue: 114/255, alpha: 1).cgColor
        
        let hat5Path = UIBezierPath()
        hat5Path.move(to: CGPoint(x: 0, y: 212))
        hat5Path.addQuadCurve(to: CGPoint(x: 31, y: 183), controlPoint: CGPoint(x: 8, y: 198))
        hat5Path.addQuadCurve(to: CGPoint(x: 102, y: 150), controlPoint: CGPoint(x: 74, y: 161))
        hat5Path.addQuadCurve(to: CGPoint(x: 281, y: 112), controlPoint: CGPoint(x: 184, y: 108))
        hat5Path.addQuadCurve(to: CGPoint(x: 390, y: 156), controlPoint: CGPoint(x: 336, y: 131))
        hat5Path.addLine(to: CGPoint(x: 390, y: 167))
        hat5Path.addQuadCurve(to: CGPoint(x: 327, y: 156), controlPoint: CGPoint(x: 358, y: 162))
        hat5Path.addQuadCurve(to: CGPoint(x: 233, y: 129), controlPoint: CGPoint(x: 284, y: 138))
        hat5Path.addQuadCurve(to: CGPoint(x: 0, y: 248), controlPoint: CGPoint(x: 57, y: 172))
        let hat5Layer = CAShapeLayer()
        hat5Layer.path = hat5Path.cgPath
        hat5Layer.lineWidth = 2.5
        hat5Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat5Layer.fillColor = UIColor.clear.cgColor
        hat5Layer.fillColor = UIColor(red: 102/255, green: 76/255, blue: 79/255, alpha: 1).cgColor
        
        let hat5_1Path = UIBezierPath()
        hat5_1Path.move(to: CGPoint(x: 68, y: 165))
        hat5_1Path.addQuadCurve(to: CGPoint(x: 102, y: 150), controlPoint: CGPoint(x: 87, y: 156))
        let hat5_1Layer = CAShapeLayer()
        hat5_1Layer.path = hat5_1Path.cgPath
        hat5_1Layer.lineWidth = 3.5
        hat5_1Layer.strokeColor = UIColor(red: 102/255, green: 76/255, blue: 79/255, alpha: 1).cgColor
        hat5_1Layer.fillColor = UIColor.clear.cgColor
        
        // 條紋
        let hat6Path = UIBezierPath()
        hat6Path.move(to: CGPoint(x: 36, y: 137))
        hat6Path.addQuadCurve(to: CGPoint(x: 47, y: 124), controlPoint: CGPoint(x: 40, y: 118))
        hat6Path.addQuadCurve(to: CGPoint(x: 64, y: 113), controlPoint: CGPoint(x: 54, y: 117))
        hat6Path.addQuadCurve(to: CGPoint(x: 68, y: 102), controlPoint: CGPoint(x: 65, y: 108))
        hat6Path.addQuadCurve(to: CGPoint(x: 107, y: 83), controlPoint: CGPoint(x: 86, y: 94))
        hat6Path.addQuadCurve(to: CGPoint(x: 116, y: 88), controlPoint: CGPoint(x: 112, y: 85))
        hat6Path.addQuadCurve(to: CGPoint(x: 157, y: 74), controlPoint: CGPoint(x: 136, y: 80))
        hat6Path.addQuadCurve(to: CGPoint(x: 160, y: 66), controlPoint: CGPoint(x: 158, y: 70))
        hat6Path.addQuadCurve(to: CGPoint(x: 205, y: 63), controlPoint: CGPoint(x: 183, y: 61))
        hat6Path.addQuadCurve(to: CGPoint(x: 212, y: 68), controlPoint: CGPoint(x: 210, y: 65))
        hat6Path.addQuadCurve(to: CGPoint(x: 239, y: 68), controlPoint: CGPoint(x: 226, y: 68))
        hat6Path.addLine(to: CGPoint(x: 238, y: 65))
        hat6Path.addLine(to: CGPoint(x: 245, y: 65))
        hat6Path.addQuadCurve(to: CGPoint(x: 278, y: 106), controlPoint: CGPoint(x: 262, y: 83))
        hat6Path.addQuadCurve(to: CGPoint(x: 264, y: 104), controlPoint: CGPoint(x: 271, y: 103))
        hat6Path.addQuadCurve(to: CGPoint(x: 263, y: 107), controlPoint: CGPoint(x: 264, y: 104))
        hat6Path.addQuadCurve(to: CGPoint(x: 230, y: 108), controlPoint: CGPoint(x: 246, y: 109))
        hat6Path.addQuadCurve(to: CGPoint(x: 222, y: 104), controlPoint: CGPoint(x: 228, y: 107))
        hat6Path.addQuadCurve(to: CGPoint(x: 183, y: 108), controlPoint: CGPoint(x: 202, y: 104))
        hat6Path.addQuadCurve(to: CGPoint(x: 179, y: 114), controlPoint: CGPoint(x: 180, y: 112))
        hat6Path.addQuadCurve(to: CGPoint(x: 125, y: 133), controlPoint: CGPoint(x: 150, y: 123))
        hat6Path.addQuadCurve(to: CGPoint(x: 117, y: 130), controlPoint: CGPoint(x: 122, y: 132))
        hat6Path.addQuadCurve(to: CGPoint(x: 78, y: 148), controlPoint: CGPoint(x: 89, y: 141))
        hat6Path.addQuadCurve(to: CGPoint(x: 75, y: 154), controlPoint: CGPoint(x: 76, y: 153))
        hat6Path.addQuadCurve(to: CGPoint(x: 49, y: 168), controlPoint: CGPoint(x: 61, y: 162))
        hat6Path.addLine(to: CGPoint(x: 43, y: 167))
        hat6Path.addLine(to: CGPoint(x: 31, y: 176))
        hat6Path.addQuadCurve(to: CGPoint(x: 36, y: 137), controlPoint: CGPoint(x: 30, y: 160))
        let hat6Layer = CAShapeLayer()
        hat6Layer.path = hat6Path.cgPath
        hat6Layer.lineWidth = 2
        hat6Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat6Layer.fillColor = UIColor.clear.cgColor
        hat6Layer.fillColor = UIColor(named: "HatYellowLine")?.cgColor
        
        let hat7Path = UIBezierPath()
        hat7Path.move(to: CGPoint(x: 36, y: 137))
        hat7Path.addQuadCurve(to: CGPoint(x: 47, y: 124), controlPoint: CGPoint(x: 40, y: 118))
        hat7Path.addQuadCurve(to: CGPoint(x: 64, y: 113), controlPoint: CGPoint(x: 54, y: 117))
        hat7Path.addQuadCurve(to: CGPoint(x: 68, y: 102), controlPoint: CGPoint(x: 65, y: 108))
        hat7Path.addQuadCurve(to: CGPoint(x: 107, y: 83), controlPoint: CGPoint(x: 86, y: 94))
        hat7Path.addQuadCurve(to: CGPoint(x: 116, y: 88), controlPoint: CGPoint(x: 112, y: 85))
        hat7Path.addQuadCurve(to: CGPoint(x: 157, y: 74), controlPoint: CGPoint(x: 136, y: 80))
        hat7Path.addQuadCurve(to: CGPoint(x: 160, y: 66), controlPoint: CGPoint(x: 158, y: 70))
        hat7Path.addQuadCurve(to: CGPoint(x: 205, y: 63), controlPoint: CGPoint(x: 183, y: 61))
        hat7Path.addQuadCurve(to: CGPoint(x: 212, y: 68), controlPoint: CGPoint(x: 210, y: 65))
        hat7Path.addQuadCurve(to: CGPoint(x: 239, y: 68), controlPoint: CGPoint(x: 226, y: 68))
        hat7Path.addLine(to: CGPoint(x: 238, y: 65))
        hat7Path.addLine(to: CGPoint(x: 245, y: 65))
        hat7Path.addLine(to: CGPoint(x: 250, y: 71))
        hat7Path.addLine(to: CGPoint(x: 245, y: 71))
        hat7Path.addLine(to: CGPoint(x: 245, y: 75))
        hat7Path.addQuadCurve(to: CGPoint(x: 214, y: 75), controlPoint: CGPoint(x: 227, y: 75))
        hat7Path.addQuadCurve(to: CGPoint(x: 204, y: 69), controlPoint: CGPoint(x: 208, y: 73))
        hat7Path.addQuadCurve(to: CGPoint(x: 166, y: 71), controlPoint: CGPoint(x: 185, y: 70))
        hat7Path.addQuadCurve(to: CGPoint(x: 161, y: 78), controlPoint: CGPoint(x: 163, y: 77))
        hat7Path.addQuadCurve(to: CGPoint(x: 113, y: 95), controlPoint: CGPoint(x: 136, y: 87))
        hat7Path.addQuadCurve(to: CGPoint(x: 106, y: 91), controlPoint: CGPoint(x: 111, y: 95))
        hat7Path.addQuadCurve(to: CGPoint(x: 73, y: 106), controlPoint: CGPoint(x: 87, y: 101))
        hat7Path.addQuadCurve(to: CGPoint(x: 69, y: 117), controlPoint: CGPoint(x: 71, y: 112))
        hat7Path.addQuadCurve(to: CGPoint(x: 46, y: 131), controlPoint: CGPoint(x: 57, y: 122))
        hat7Path.close()
        let hat7Layer = CAShapeLayer()
        hat7Layer.path = hat7Path.cgPath
        hat7Layer.lineWidth = 2
        hat7Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat7Layer.fillColor = UIColor.clear.cgColor
        hat7Layer.fillColor = UIColor(named: "HatRedLine")?.cgColor
        
        let hat8Path = UIBezierPath()
        hat8Path.move(to: CGPoint(x: 31, y: 169))
        hat8Path.addQuadCurve(to: CGPoint(x: 41, y: 162), controlPoint: CGPoint(x: 37, y: 165))
        hat8Path.addQuadCurve(to: CGPoint(x: 47, y: 162), controlPoint: CGPoint(x: 44, y: 162))
        hat8Path.addQuadCurve(to: CGPoint(x: 69, y: 151), controlPoint: CGPoint(x: 56, y: 158))
        hat8Path.addQuadCurve(to: CGPoint(x: 72, y: 144), controlPoint: CGPoint(x: 71, y: 147))
        hat8Path.addQuadCurve(to: CGPoint(x: 118, y: 122), controlPoint: CGPoint(x: 88, y: 130))
        hat8Path.addQuadCurve(to: CGPoint(x: 125, y: 126), controlPoint: CGPoint(x: 121, y: 124))
        hat8Path.addQuadCurve(to: CGPoint(x: 174, y: 110), controlPoint: CGPoint(x: 150, y: 113))
        hat8Path.addQuadCurve(to: CGPoint(x: 176, y: 104), controlPoint: CGPoint(x: 175, y: 107))
        hat8Path.addQuadCurve(to: CGPoint(x: 223, y: 97), controlPoint: CGPoint(x: 199, y: 96))
        hat8Path.addQuadCurve(to: CGPoint(x: 230, y: 103), controlPoint: CGPoint(x: 226, y: 99))
        hat8Path.addQuadCurve(to: CGPoint(x: 258, y: 103), controlPoint: CGPoint(x: 246, y: 102))
        hat8Path.addQuadCurve(to: CGPoint(x: 258, y: 97), controlPoint: CGPoint(x: 258, y: 101))
        hat8Path.addQuadCurve(to: CGPoint(x: 274, y: 99), controlPoint: CGPoint(x: 264, y: 96))
        hat8Path.addQuadCurve(to: CGPoint(x: 278, y: 106), controlPoint: CGPoint(x: 275, y: 100))
        hat8Path.addQuadCurve(to: CGPoint(x: 264, y: 104), controlPoint: CGPoint(x: 271, y: 103))
        hat8Path.addQuadCurve(to: CGPoint(x: 263, y: 107), controlPoint: CGPoint(x: 264, y: 104))
        hat8Path.addQuadCurve(to: CGPoint(x: 230, y: 108), controlPoint: CGPoint(x: 246, y: 109))
        hat8Path.addQuadCurve(to: CGPoint(x: 222, y: 104), controlPoint: CGPoint(x: 228, y: 107))
        hat8Path.addQuadCurve(to: CGPoint(x: 183, y: 108), controlPoint: CGPoint(x: 202, y: 104))
        hat8Path.addQuadCurve(to: CGPoint(x: 179, y: 114), controlPoint: CGPoint(x: 180, y: 112))
        hat8Path.addQuadCurve(to: CGPoint(x: 125, y: 133), controlPoint: CGPoint(x: 150, y: 123))
        hat8Path.addQuadCurve(to: CGPoint(x: 117, y: 130), controlPoint: CGPoint(x: 122, y: 132))
        hat8Path.addQuadCurve(to: CGPoint(x: 78, y: 148), controlPoint: CGPoint(x: 89, y: 141))
        hat8Path.addQuadCurve(to: CGPoint(x: 75, y: 154), controlPoint: CGPoint(x: 76, y: 153))
        hat8Path.addQuadCurve(to: CGPoint(x: 49, y: 168), controlPoint: CGPoint(x: 61, y: 162))
        hat8Path.addLine(to: CGPoint(x: 43, y: 167))
        hat8Path.addLine(to: CGPoint(x: 31, y: 176))
        hat8Path.close()
        let hat8Layer = CAShapeLayer()
        hat8Layer.path = hat8Path.cgPath
        hat8Layer.lineWidth = 2
        hat8Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat8Layer.fillColor = UIColor.clear.cgColor
        hat8Layer.fillColor = UIColor(named: "HatRedLine")?.cgColor
        
        let hat9Path = UIBezierPath()
        hat9Path.move(to: CGPoint(x: 31, y: 171))
        hat9Path.addQuadCurve(to: CGPoint(x: 43, y: 128), controlPoint: CGPoint(x: 33, y: 148))
        hat9Path.addQuadCurve(to: CGPoint(x: 64, y: 149), controlPoint: CGPoint(x: 56, y: 142))
        hat9Path.addQuadCurve(to: CGPoint(x: 82, y: 98), controlPoint: CGPoint(x: 71, y: 127))
        hat9Path.addQuadCurve(to: CGPoint(x: 121, y: 122), controlPoint: CGPoint(x: 103, y: 112))
        hat9Path.addQuadCurve(to: CGPoint(x: 148, y: 77), controlPoint: CGPoint(x: 131, y: 100))
        hat9Path.addQuadCurve(to: CGPoint(x: 190, y: 97), controlPoint: CGPoint(x: 172, y: 88))
        hat9Path.addQuadCurve(to: CGPoint(x: 208, y: 64), controlPoint: CGPoint(x: 197, y: 81))
        hat9Path.addQuadCurve(to: CGPoint(x: 249, y: 97), controlPoint: CGPoint(x: 232, y: 84))
        hat9Path.addQuadCurve(to: CGPoint(x: 250, y: 73), controlPoint: CGPoint(x: 250, y: 88))
        hat9Path.addQuadCurve(to: CGPoint(x: 252, y: 105), controlPoint: CGPoint(x: 257, y: 79))
        hat9Path.addQuadCurve(to: CGPoint(x: 209, y: 72), controlPoint: CGPoint(x: 223, y: 85))
        hat9Path.addQuadCurve(to: CGPoint(x: 191, y: 105), controlPoint: CGPoint(x: 203, y: 86))
        hat9Path.addQuadCurve(to: CGPoint(x: 150, y: 84), controlPoint: CGPoint(x: 169, y: 95))
        hat9Path.addQuadCurve(to: CGPoint(x: 124, y: 130), controlPoint: CGPoint(x: 139, y: 105))
        hat9Path.addQuadCurve(to: CGPoint(x: 84, y: 108), controlPoint: CGPoint(x: 97, y: 117))
        hat9Path.addQuadCurve(to: CGPoint(x: 66, y: 156), controlPoint: CGPoint(x: 77, y: 129))
        hat9Path.addQuadCurve(to: CGPoint(x: 44, y: 136), controlPoint: CGPoint(x: 53, y: 148))
        hat9Path.addQuadCurve(to: CGPoint(x: 31, y: 171), controlPoint: CGPoint(x: 37, y: 151))
        let hat9Layer = CAShapeLayer()
        hat9Layer.path = hat9Path.cgPath
        hat9Layer.lineWidth = 2
        hat9Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat9Layer.fillColor = UIColor.clear.cgColor
        hat9Layer.fillColor = UIColor(named: "HatRedLine")?.cgColor
        
        // 左鈕扣
        let hat10Path = UIBezierPath()
        hat10Path.move(to: CGPoint(x: 56, y: 69))
        hat10Path.addQuadCurve(to: CGPoint(x: 91, y: 44), controlPoint: CGPoint(x: 65, y: 50))
        hat10Path.addQuadCurve(to: CGPoint(x: 113, y: 60), controlPoint: CGPoint(x: 116, y: 39))
        hat10Path.addQuadCurve(to: CGPoint(x: 80, y: 91), controlPoint: CGPoint(x: 112, y: 79))
        hat10Path.addQuadCurve(to: CGPoint(x: 56, y: 69), controlPoint: CGPoint(x: 42, y: 103))
        let hat10Layer = CAShapeLayer()
        hat10Layer.path = hat10Path.cgPath
        hat10Layer.lineWidth = 2
        hat10Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat10Layer.fillColor = UIColor.clear.cgColor
        hat10Layer.fillColor = UIColor(named: "HatRedLine")?.cgColor
        
        let hat11Path = UIBezierPath()
        hat11Path.move(to: CGPoint(x: 56, y: 73))
        hat11Path.addQuadCurve(to: CGPoint(x: 90, y: 46), controlPoint: CGPoint(x: 65, y: 52))
        hat11Path.addQuadCurve(to: CGPoint(x: 104, y: 63), controlPoint: CGPoint(x: 112, y: 44))
        hat11Path.addQuadCurve(to: CGPoint(x: 72, y: 86), controlPoint: CGPoint(x: 100, y: 79))
        hat11Path.addQuadCurve(to: CGPoint(x: 56, y: 73), controlPoint: CGPoint(x: 50, y: 91))
        let hat11Layer = CAShapeLayer()
        hat11Layer.path = hat11Path.cgPath
        hat11Layer.lineWidth = 2
        hat11Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat11Layer.fillColor = UIColor.clear.cgColor
        
        let hat12Path = UIBezierPath()
        hat12Path.move(to: CGPoint(x: 59, y: 86))
        hat12Path.addQuadCurve(to: CGPoint(x: 99, y: 47), controlPoint: CGPoint(x: 69, y: 55))
        hat12Path.addQuadCurve(to: CGPoint(x: 105, y: 50), controlPoint: CGPoint(x: 104, y: 46))
        hat12Path.addQuadCurve(to: CGPoint(x: 64, y: 87), controlPoint: CGPoint(x: 73, y: 60))
        hat12Path.addQuadCurve(to: CGPoint(x: 59, y: 86), controlPoint: CGPoint(x: 60, y: 87))
        let hat12Layer = CAShapeLayer()
        hat12Layer.path = hat12Path.cgPath
        hat12Layer.lineWidth = 2
        hat12Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat12Layer.fillColor = UIColor.clear.cgColor
        hat12Layer.fillColor =  UIColor(named: "HatYellowLine")?.cgColor
        
        let hat13Path = UIBezierPath()
        hat13Path.move(to: CGPoint(x: 69, y: 56))
        hat13Path.addQuadCurve(to: CGPoint(x: 99, y: 72), controlPoint: CGPoint(x: 84, y: 60))
        hat13Path.addQuadCurve(to: CGPoint(x: 94, y: 77), controlPoint: CGPoint(x: 99, y: 75))
        hat13Path.addQuadCurve(to: CGPoint(x: 64, y: 60), controlPoint: CGPoint(x: 82, y: 66))
        hat13Path.addQuadCurve(to: CGPoint(x: 69, y: 56), controlPoint: CGPoint(x: 67, y: 59))
        let hat13Layer = CAShapeLayer()
        hat13Layer.path = hat13Path.cgPath
        hat13Layer.lineWidth = 2
        hat13Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat13Layer.fillColor = UIColor.clear.cgColor
        hat13Layer.fillColor =  UIColor(named: "HatYellowLine")?.cgColor
        
        // 右鈕扣
        let hat14Path = UIBezierPath()
        hat14Path.move(to: CGPoint(x: 172, y: 26))
        hat14Path.addQuadCurve(to: CGPoint(x: 219, y: 49), controlPoint: CGPoint(x: 200, y: 29))
        hat14Path.addQuadCurve(to: CGPoint(x: 191, y: 54), controlPoint: CGPoint(x: 217, y: 58))
        hat14Path.addQuadCurve(to: CGPoint(x: 168, y: 39), controlPoint: CGPoint(x: 173, y: 48))
        hat14Path.addQuadCurve(to: CGPoint(x: 172, y: 26), controlPoint: CGPoint(x: 160, y: 29))
        let hat14Layer = CAShapeLayer()
        hat14Layer.path = hat14Path.cgPath
        hat14Layer.lineWidth = 2
        hat14Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat14Layer.fillColor = UIColor.clear.cgColor
        hat14Layer.fillColor = UIColor(named: "HatRedLine")?.cgColor
        
        let hat15Path = UIBezierPath()
        hat15Path.move(to: CGPoint(x: 172, y: 30))
        hat15Path.addQuadCurve(to: CGPoint(x: 214, y: 49), controlPoint: CGPoint(x: 181, y: 52))
        let hat15Layer = CAShapeLayer()
        hat15Layer.path = hat15Path.cgPath
        hat15Layer.lineWidth = 2
        hat15Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat15Layer.fillColor = UIColor.clear.cgColor
        
        let hat16Path = UIBezierPath()
        hat16Path.move(to: CGPoint(x: 172, y: 26))
        hat16Path.addQuadCurve(to: CGPoint(x: 216, y: 46), controlPoint: CGPoint(x: 200, y: 29))
        hat16Path.addQuadCurve(to: CGPoint(x: 214, y: 49), controlPoint: CGPoint(x: 216, y: 48))
        hat16Path.addQuadCurve(to: CGPoint(x: 172, y: 30), controlPoint: CGPoint(x: 197, y: 33))
        hat16Path.close()
        let hat16Layer = CAShapeLayer()
        hat16Layer.path = hat16Path.cgPath
        hat16Layer.lineWidth = 2
        hat16Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat16Layer.fillColor = UIColor.clear.cgColor
        hat16Layer.fillColor =  UIColor(named: "HatYellowLine")?.cgColor
        
        let hat17Path = UIBezierPath()
        hat17Path.move(to: CGPoint(x: 192, y: 30))
        hat17Path.addQuadCurve(to: CGPoint(x: 198, y: 32), controlPoint: CGPoint(x: 196, y: 31))
        hat17Path.addQuadCurve(to: CGPoint(x: 192, y: 47), controlPoint: CGPoint(x: 196, y: 41))
        hat17Path.addQuadCurve(to: CGPoint(x: 184, y: 44), controlPoint: CGPoint(x: 187, y: 47))
        hat17Path.addQuadCurve(to: CGPoint(x: 192, y: 30), controlPoint: CGPoint(x: 189, y: 36))
        let hat17Layer = CAShapeLayer()
        hat17Layer.path = hat17Path.cgPath
        hat17Layer.lineWidth = 2
        hat17Layer.strokeColor = UIColor(named: "Outline")?.cgColor
        hat17Layer.fillColor = UIColor.clear.cgColor
        hat17Layer.fillColor =  UIColor(named: "HatYellowLine")?.cgColor
        
        hat1Layer.addSublayer(hat2Layer)
        hat1Layer.addSublayer(hat2ShadowLayer)
        hat1Layer.addSublayer(hat3Layer)
        hat1Layer.addSublayer(hat4Layer)
        hat1Layer.addSublayer(hat5Layer)
        hat1Layer.addSublayer(hat5_1Layer)
        hat1Layer.addSublayer(hat6Layer)
        hat1Layer.addSublayer(hat7Layer)
        hat1Layer.addSublayer(hat8Layer)
        hat1Layer.addSublayer(hat9Layer)
        hat1Layer.addSublayer(hat10Layer)
        hat1Layer.addSublayer(hat11Layer)
        hat1Layer.addSublayer(hat12Layer)
        hat1Layer.addSublayer(hat13Layer)
        hat1Layer.addSublayer(hat14Layer)
        hat1Layer.addSublayer(hat15Layer)
        hat1Layer.addSublayer(hat16Layer)
        hat1Layer.addSublayer(hat17Layer)
        
        return hat1Layer
    }
    
    func createMegumin() -> UIView {
        let containerView = UIView()
        containerView.layer.addSublayer(addHat_back())
        containerView.layer.addSublayer(addHair_ClotheBack())
        containerView.layer.addSublayer(addFaceOutline())
        containerView.layer.addSublayer(fillFace())
        containerView.layer.addSublayer(addLeftBlush())
        containerView.layer.addSublayer(addRightBlush())
        containerView.layer.addSublayer(addMouth())
        containerView.layer.addSublayer(addNose())
        containerView.layer.addSublayer(addLeftEye())
        containerView.layer.addSublayer(addEyeMask())
        containerView.layer.addSublayer(addBody())
        containerView.layer.addSublayer(addNeck())

        containerView.layer.addSublayer(addClothe())

        containerView.layer.addSublayer(addHair_Front())
        containerView.layer.addSublayer(addHairShadow())

        // 眉毛要畫在頭髮後面一層
        let eyebrowView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        eyebrowView.layer.addSublayer(addLeftEyebrow())
        eyebrowView.layer.addSublayer(addRightEyebrow())
        
        UIView.animate(withDuration: 0.2, delay: 1, options: .repeat) {
            eyebrowView.frame = CGRect(x: 0, y: -5, width: 0, height: 0)
        }

        containerView.addSubview(eyebrowView)
        
        containerView.layer.addSublayer(addHat())
        
        return containerView
    }
    
}

struct ContentView: View {
    var body: some View {
        ZStack {
//            Color.black
            DrawMeguminView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
