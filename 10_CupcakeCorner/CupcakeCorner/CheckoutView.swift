//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Andre Veltens on 05.11.25.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation: Bool = false
    @State private var showingError: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("Error: \(phase.error?.localizedDescription ?? "Unknown error")")
                    } else {
                        ProgressView()
                    }
                }
                .accessibilityHidden(true)
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {} message: {
            Text(confirmationMessage)
        }
        .alert("Something went wrong. ", isPresented: $showingError) {} message: {
            Text("An unexpected error occured. Please try again later.")
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://httpbin.org/post")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("reqres-free-v1", forHTTPHeaderField: "api-key")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            if let responseString = String(data: data, encoding: .utf8) {
                print("Server response: \(responseString)")
            }

            struct HTTPBinResponse: Codable {
                    let json: Order
            }

            let decoded = try JSONDecoder().decode(HTTPBinResponse.self, from: data)
            let decodedOrder = decoded.json

            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
            
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
            showingError = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
