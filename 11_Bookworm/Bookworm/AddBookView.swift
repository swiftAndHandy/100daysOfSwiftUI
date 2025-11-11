//
//  AddBookView.swift
//  Bookworm
//
//  Created by Andre Veltens on 09.11.25.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = "Fantasy"
    @State private var review: String = ""
    @State private var rating: Int = 0
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: title,
                            author: author,
                            genre: genre,
                            review: review,
                            rating: rating
                        )
                        
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(saveDisabled())
                }
            }
            .navigationTitle("Add book")
        }
    }
    
    func saveDisabled() -> Bool {
        return title.trimmingCharacters(in: .whitespaces).count < 3 || author.trimmingCharacters(in: .whitespaces).count < 3
    }
}

#Preview {
    AddBookView()
}
