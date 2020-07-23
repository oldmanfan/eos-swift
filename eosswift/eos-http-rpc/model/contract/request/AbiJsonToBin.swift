//
//  AbiJsonToBin.swift
//  eosswift
//
//  Created by fanliangqin on 2020/7/22.
//  Copyright © 2020 memtrip. All rights reserved.
//

import Foundation

public struct AbiJsonToBin: Encodable {
    public let code: String
    public let action: String
    public let args: Dictionary<String, AnyCodable>
    
    public init(code: String, action: String, args: Dictionary<String, AnyCodable>) {
        self.code = code
        self.action = action
        self.args = args
    }
}
