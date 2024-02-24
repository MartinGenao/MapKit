//
//  Geocoding.swift
//  LocationRequest
//
//  Created by Martin on 2/23/24.
//

import Foundation
import MapKit

func getAddressFromCoordinates(latitude: Double, longitude: Double, completion: @escaping (String?) -> Void) {
    let geoCoder = CLGeocoder()
    let location = CLLocation(latitude: latitude, longitude: longitude)

    geoCoder.reverseGeocodeLocation(location) { placemarks, error in
        guard let placemark = placemarks?.first else {
            completion(nil)
            return
        }

        var addressComponents = [String]()

        if let subThoroughfare = placemark.subThoroughfare {
            addressComponents.append(subThoroughfare)
        }

        if let thoroughfare = placemark.thoroughfare {
            addressComponents.append(thoroughfare)
        }

        if let locality = placemark.locality {
            addressComponents.append(locality)
        }

        if let country = placemark.country {
            addressComponents.append(country)
        }

        let address = addressComponents.joined(separator: ", ")
        completion(address)
    }
}


