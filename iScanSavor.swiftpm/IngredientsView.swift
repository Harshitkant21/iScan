//
//  IngredientsView.swift
//  BarCodeScanner
//
//  Created by Aditya Gaba on 07/05/24.
//

import SwiftUI

struct IngredientsView: View {
    let selectedAllergies: Set<String>
    let allergyInformation: [Information] // Assuming this is accessible

    var filteredIngredients: [String] {
        return allergyInformation
            .filter { info in selectedAllergies.contains(info.allergy) }
            .flatMap { $0.ingredients }
    }

    var body: some View {
        List(filteredIngredients, id: \.self) { ingredient in
            Text(ingredient)
        }
    }
}
