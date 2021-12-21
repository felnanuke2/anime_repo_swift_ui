//
//  BundleDataUtils.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 21/12/21.
//

import Foundation

func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch let e{
        print(String(describing: e))
    }
    
    return nil
}
