//
//  Category.swift
//  MartabakManis (macOS)
//
//  Created by David Gunawan on 28/07/21.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
  var id: String {
    return rawValue
  }

  case bsd
  case kemang
  case cengkareng
  case grogol
  case tomang

  var name: String {
    switch self {
    case .bsd: return "BSD"
    case .kemang: return "Kemang Village"
    case .cengkareng: return "Green Lake City"
    case .grogol: return "Binus Kemanggisan"
    case .tomang: return "Taman Anggrek"
    }
  }

  var urlSuffix: String {
    return self.rawValue
  }

  var icon: String {
    switch self {
    case .bsd: return "rosette"
    case .kemang: return "clock"
    case .cengkareng: return "flame.fill"
    case .grogol: return "questionmark.circle"
    case .tomang: return "eye"
    }
  }
}
