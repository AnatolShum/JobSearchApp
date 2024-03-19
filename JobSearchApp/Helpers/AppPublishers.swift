//
//  Publishers.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 19.03.2024.
//

import Foundation
import Combine

public var favouritePublisher = PassthroughSubject<Void, Never>()
public var badgePublisher = PassthroughSubject<Int, Never>()
