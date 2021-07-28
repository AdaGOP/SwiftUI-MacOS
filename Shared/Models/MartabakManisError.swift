//
//  MartabakManisError.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import Foundation

enum MartabakManisError: Error {
  case message(String)
  case other(Error)

  static func map(_ error: Error) -> MartabakManisError {
    return (error as? MartabakManisError) ?? .other(error)
  }
}

extension MartabakManisError: CustomStringConvertible {
  var description: String {
    switch self {
    case .message(let message):
      return message
    case .other(let error):
      return error.localizedDescription
    }
  }
}
