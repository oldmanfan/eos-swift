//
//  CommonActionChain.swift
//  eosswift
//
//  Created by fanliangqin on 2020/7/22.
//  Copyright © 2020 memtrip. All rights reserved.
//

import Foundation
import RxSwift

public class CommonActionChain : ChainTransaction {

    private let _chainApi: ChainApi

    public init(chainApi: ChainApi) {
        self._chainApi = chainApi
    }

    public func chainApi() -> ChainApi {
        return _chainApi
    }

    public func exec(
        contract: String,
        action: String,
        hexData: String,
        pemissionLevel: String,
        transactionContext: TransactionContext
    ) -> Single<ChainResponse<TransactionCommitted>> {
        return push(
            actions: buildAbiList(contract: contract, action: action, hexData: hexData, pl: pemissionLevel, transactionContext: transactionContext),
            transactionContext: transactionContext
        )
    }

    private func buildAbiList(
        contract: String,
        action: String,
        hexData: String,
        pl: String,
        transactionContext: TransactionContext
    ) -> [ActionAbi] {
        return [ActionAbi(
            account: AccountNameWriterValue(name: contract),
            name: AccountActionWriterValue(name: action),
            authorization: [TransactionAuthorizationAbi(
                actor: AccountNameWriterValue(name: transactionContext.authorizingAccountName),
                permission: AccountNameWriterValue(name: pl))],
            data: DataWriterValue(hex: hexData)
        )]
    }
}

