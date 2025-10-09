import UIKit

var arrayOfStrings: [String] = ["Kirschsaft", "Pflaumenmuß", "Käse", "Brot", "Eier", "Eier", "Pflaumenmuß", "Brot"]

print("""
Itemanzahl: \(arrayOfStrings.count)
Einmalige Items: \(Set(arrayOfStrings).count)
""")
