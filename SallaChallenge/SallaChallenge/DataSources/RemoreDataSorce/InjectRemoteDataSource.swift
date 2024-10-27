//
//  InjectRemoteDataSource.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation


private struct RemoteDataSourceKey: InjectionKey {
    static var currentValue: RemoteSource = RemoteDataSource()
}

extension InjectedValues {
    var remoteDataSource: RemoteSource {
        get { Self[RemoteDataSourceKey.self] }
        set { Self[RemoteDataSourceKey.self] = newValue }
    }
}
