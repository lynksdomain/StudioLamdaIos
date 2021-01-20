//
//  videoModel.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/31/20.
//

import Foundation

class clientModel {
    var imageName: String
    var isVideo: Bool
    var videoName: String

    init(imageName: String, isVideo:Bool, videoName:String){
        self.imageName = imageName
        self.isVideo = isVideo
        self.videoName = videoName
    }
    
    static let clientModelArray = [clientModel(imageName: "photo1", isVideo: false, videoName: "" ),clientModel(imageName: "photo2", isVideo: true, videoName: "v1"),clientModel(imageName: "photo3", isVideo: false, videoName: ""),clientModel(imageName: "photo4", isVideo: true, videoName: "v2"),clientModel(imageName: "photo5", isVideo: true, videoName: "v3")]

}
