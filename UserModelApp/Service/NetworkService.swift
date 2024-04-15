//
//  NetworkService.swift
//  UserModelApp
//
//  Created by Berkay Emre Aslan on 15.04.2024.
//

import Foundation

protocol NetworkService{
    func download(_ resource: String) async throws -> [User]
    var type: String { get }
    }

