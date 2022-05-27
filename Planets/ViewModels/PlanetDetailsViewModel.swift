//
//  PlanetDetailsViewModel.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation

final class PlanetDetailsViewModel: ObservableObject {
    @Published var planet: Planet?
    @Published var image_url = Constants.IMAGE_URL_BASE + "0" + Constants.IMAGE_SIZE
    private let index: Int
    
    /**
     This method is here to initiate current view.

     Here is the discussion. This method will initiate the current view while taking following paramers.

     - parameter id: Current pagination index.
     - parameter planet: Receive the object that pass data to the current view.

     # Notes: #
     1. Parameter must be **Int** type
     2. Parameter must be **Planet** type

     # Example #
    ```
     let object = PlanetDetailsViewModel(id: index, planet: Planet())
     ```
    */
    
    init(id: Int, planet: Planet?) {
        self.planet = planet
        self.index = id
        setupImageIconURL()
    }
    
    /**
     This method is here to configure random image URL.

     Here is the discussion. This void type method will configure random image URL using 'id' variable and do not return anything. **image_url** variable need to be access from a class object

     # Notes: #
     This is a void type method, hence will not return anything. **image_url** variable need to be access from a class object

     # Example #
     ```
     PlanetDetailsViewModel().setupImageIconURL()
     ```
    */
    
    private func setupImageIconURL() {
        image_url = Constants.IMAGE_URL_BASE + "\(self.index)" + Constants.IMAGE_SIZE
    }
}
