

import SwiftUI

struct AllergyView: View {
    private var listOfAllergies = allergyData
    @State var searchText = ""
    @State private var navigateToContentView: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(allergies, id: \.self) { allergy in
                    AllergyRow(allergy: allergy, isSelected: selectedAllergies.contains(allergy.name))
                        .padding()
                        .onTapGesture {
                            if selectedAllergies.contains(allergy.name) {
                                selectedAllergies.remove(allergy.name)
                            } else {
                                selectedAllergies.insert(allergy.name)
                            }
                        }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Choose Your Allergy")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Handle Cancel action
                    }) {
                        Text("Cancel")
                            .foregroundColor(.green)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Handle Done action
                        navigateToContentView = true
                    }) {
                        Text("Done")
                            .foregroundColor(.green)
                    }
                    .background(
                        NavigationLink(destination: MainView().navigationBarBackButtonHidden(true), isActive: $navigateToContentView) {
                            // EmptyView()
                        }
                    )
                }
                
            }
        }
    }
    
    @State private var selectedAllergies: Set<String> = [] // Set to store selected allergies
    
    // Filter allergies
    var allergies: [Allergy] {
        // Make allergies lowercased
        let lcAllergies = listOfAllergies.map { Allergy(symbol: $0.symbol.lowercased(), name: $0.name.lowercased()) }
        
        return searchText == "" ? lcAllergies : lcAllergies.filter { $0.name.contains(searchText.lowercased()) }
    }
}

struct Allergy: Identifiable, Hashable {
  let id = UUID() // Use UUID for unique identifiers
  var symbol: String
  var name: String
}

struct AllergyRow: View {
  let allergy: Allergy
  let isSelected: Bool

  var body: some View {
    HStack {
      Text(allergy.symbol)
        .font(.title)
      Text(allergy.name)
        Spacer()
        if isSelected {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.green)
        }
    }
    .padding(.vertical, -5) // Adjust this value to change the height of each row
  }
}

// Sample allergy data (replace with your actual data)
let allergyData = [
    Allergy(symbol: "🥜", name: "Peanut"),
    Allergy(symbol: "🥚", name: "Egg"),
    Allergy(symbol: "🥛", name: "Milk"),
    Allergy(symbol: "🫘", name: "Kidney Beans"),
    Allergy(symbol: "🐟", name: "Fish and Shelfish"),
    Allergy(symbol: "🌴", name: "Palm Oil"),
    Allergy(symbol: "🥑", name: "Avocado"),
    Allergy(symbol: "🌾", name: "Wheat"),
    Allergy(symbol: "🦀", name: "Crustaceans")
]

struct AllergyView_Previews: PreviewProvider {
    static var previews: some View {
        AllergyView()
    }
}
