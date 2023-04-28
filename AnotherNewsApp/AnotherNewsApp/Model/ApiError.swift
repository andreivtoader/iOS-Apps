//
//  ApiError.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 28.04.2023.
//

import Foundation

enum ApiError: Error {
  case notFound // 404
  case serverError // 5xx
  case requestError // 4xx
  case jsonError
  case couldNotConnectToHost
}
