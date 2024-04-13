//
//  GFErrorMessage.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 12/04/24.
//

import Foundation

enum GFErrorMessage: String, Error {
    case invalidUsername = "This username created invalid request. Please try again."
    case unableToComplete = "Unable to completed your request. Please check your request"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data receive from the server is invalid. Please try again"
    case invalidDecodeData = "Error when extracting the data"
    case unableToFavorites = "There was an error favoriting this user. Please try again"
    case alreadyInFavorite = "You already favorite this user. You must really like them!"
}
