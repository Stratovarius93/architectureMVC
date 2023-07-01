//
//  CharacterModelResponse.swift
//  ArchitectureMVC
//
//  Created by Juan Carlos Catagña Tipantuña on 17/6/23.
//

import Foundation

struct CharacterModelResponse: Decodable {
    let results: [CharacterModel]
}
