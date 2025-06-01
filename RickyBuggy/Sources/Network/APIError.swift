//
//  APIError.swift
//  RickyBuggy
//

import Foundation

// FIXME: 1 - Refactor so it accepts and displays underlaying error
// fixed
enum APIError: Error {
    case imageDataRequestFailed(Error?)
    case charactersRequestFailed(Error?)
    case characterDetailRequestFailed(Error?)
    case locationRequestFailed(Error?)
}

extension APIError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .imageDataRequestFailed(let underlyingError):
            if let error = underlyingError {
                return "Could not download image: \(error.localizedDescription)"
            }
            return "Could not download image"
        case .charactersRequestFailed:
            if let description = errorDescription {
                return "Could not fetch characters: \(description)"
            }
            return "Could not fetch characters"
        case .characterDetailRequestFailed:
            if let description = errorDescription {
                return "Could not get details of character: \(description)"
            }
            return "Could not get details of character"
        case .locationRequestFailed:
            if let description = errorDescription {
                return "Could not get details of location: \(description)"
            }
            return "Could not get details of location"
        }
    }
}
