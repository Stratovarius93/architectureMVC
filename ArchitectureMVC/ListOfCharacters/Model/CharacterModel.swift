//
//  CharacterModel.swift
//  ArchitectureMVC
//
//  Created by Juan Carlos Catagña Tipantuña on 17/6/23.
//

import Foundation

struct CharacterModel: Decodable {
    let name: String
    let status: String
    let species: String
    let image: String
}
