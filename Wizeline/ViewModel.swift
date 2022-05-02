//
//  ViewModel.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 5/1/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var mockBookService: MockBookService
    
    init(mockBookService: MockBookService) {
        self.mockBookService = mockBookService
    }
}

protocol BookService {
    // Book list
    func bookList() -> [BookModel]
    // Book detail
    func bookDetails(bookId: Int) -> BookDetail
    func numberOfCartItems() -> Int
    func addToCart(bookId: Int)
    // Cart
    func cartItems() -> Cart
    func checkout()
}

class MockBookService: BookService {
    // MARK: Mock data
    var books: [BookModel] = [
        BookModel(id: 1, bookName: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "book1"),
        BookModel(id: 2, bookName: "The Two Towers", author: "J. R. R. Tolkien", price: 11.99, imageName: "book2"),
        BookModel(id: 3, bookName: "Homo Deus: A Brief History of Tomorrow", author: "Yuval Noah Harari", price: 19.99, imageName: "book3"),
        BookModel(id: 4, bookName: "The 4-Hour Workweek", author: "Timothy Ferriss", price: 16.15, imageName: "book4"),
        BookModel(id: 5, bookName: "Man's Search for Meaning", author: "Viktor E. Frankl", price: 12.25, imageName: "book5"),
        BookModel(id: 6, bookName: "The Odyssey", author: "Homer", price: 10.99, imageName: "book6"),
        BookModel(id: 7, bookName: "Artificial Intelligence: A Modern Approach", author: "Stuart J. Rossell", price: 22.99, imageName: "book7"),
        BookModel(id: 8, bookName: "Creativity, Inc.", author: "Ed Catmull", price: 17.85, imageName: "book8"),
        BookModel(id: 9, bookName: "Harry Potter", author: "J.K. Rowlings", price: 20.50, imageName: "book9")
    ]
    
    var booksDetail: [BookDetail] = [
        BookDetail(id: "0", bookId: 1, author: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 18.85, genre: [Genre.fantasy, Genre.action], kind: "Novel", description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "book1", isAvailable: false),
        BookDetail(id: "2", bookId: 2, author: "J. R. R. Tolkien", title: "The Two Towers", price: 11.99, genre: [Genre.fantasy, Genre.action], kind: "Novel", description: "The Fellowship was scattered. Some were bracing hopelessly for war against the ancient evil of Sauron. Some were contending with the treachery of the wizard Saruman. Only Frodo and Sam were left to take the accursed Ring of Power to be destroyed in Mordor–the dark Kingdom where Sauron was supreme. Their guide was Gollum, deceitful and lust-filled, slave to the corruption of the Ring.", imageName: "book2", isAvailable: false),
        BookDetail(id: "1", bookId: 3, author: "Yuval Noah Harari", title: "Homo Deus: A Brief History of Tomorrow", price: 19.99, genre: [Genre.history], kind: "Discussion",description: "Yuval Noah Harari envisions a near future in which we face a new set of challenges. Homo Deus explores the projects, dreams and nightmares that will shape the twenty-first century and beyond – from overcoming death to creating artificial life.", imageName: "book3", isAvailable: false),
        BookDetail(id: "1", bookId: 4, author: "Timothy Ferriss", title: "The 4-Hour Workweek", price: 16.15, genre: [Genre.present], kind: "Lifestyle",description: "Forget the old concept of retirement and the rest of the deferred-life plan - there is no need to wait and every reason not to, especially in unpredictable economic times. Whether your dream is escaping the rat race, experiencing high-end world travel, earning a monthly five-figure income with zero management, or just living more and working less, this book is the blueprint.", imageName: "book4", isAvailable: false),
        BookDetail(id: "1", bookId: 5, author: "Viktor E. Frankl", title: "Man's Search for Meaning", price: 12.25, genre: [Genre.history, Genre.drama], kind: "Psychology",description: "Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Between 1942 and 1945 Frankl labored in four different camps, including Auschwitz, while his parents, brother, and pregnant wife perished.", imageName: "book5", isAvailable: false),
        BookDetail(id: "1", bookId: 6, author: "Homer", title: "The Odyssey", price: 10.99, genre: [Genre.fantasy, Genre.history], kind: "Novel",description: "After enduring the Trojan War, Odysseus begins the treacherous journey home to Ithaca. On the way, he faces ravenous monsters and vengeful gods. But the real battle awaits, as his kingdom is under siege by unruly suitors vying for his wife’s hand—and his son’s head. To reclaim his throne and save his family, Odysseus must rely on his wits…and help from the unpredictable gods.", imageName: "book6", isAvailable: false),
        BookDetail(id: "1", bookId: 7, author: "Stuart J. Rossell", title: "Artificial Intelligence: A Modern Approach", price: 22.99, genre: [Genre.scienceFiction, Genre.present], kind: "AI", description: "The long-anticipated revision of this best-selling text offers the most comprehensive, up-to-date introduction to the theory and practice of artificial intelligence.", imageName: "book7", isAvailable: false),
        BookDetail(id: "1", bookId: 8, author: "Ed Catmull", title: "Creativity, Inc.", price: 17.85, genre: [Genre.business, Genre.economics], kind: "Print",description: "This is the story behind the company that changed animation forever. Here, the founder of Pixar reveals the ideas and techniques that have made Pixar one of the most widely admired creative businesses, and one of the most profitable.", imageName: "book8", isAvailable: false),
        BookDetail(id: "1", bookId: 9, author: "J.K. Rowlings", title: "Harry Potter", price: 20.50, genre: [Genre.business, Genre.economics], kind: "Print",description: "This is the story behind the company that changed animation forever. Here, the founder of Pixar reveals the ideas and techniques that have made Pixar one of the most widely admired creative businesses, and one of the most profitable.", imageName: "book9", isAvailable: false)
    ]
    
    var cart = Cart(items: [], numberOfItems: 0, total: 0)
    
    func bookList() -> [BookModel] {
        return books
    }
    
    func bookDetails(bookId: Int) -> BookDetail {
        let details = booksDetail.first{ $0.bookId == bookId }
        return details!
    }
    
    func numberOfCartItems() -> Int {
        return cart.numberOfItems
    }
    
    func addToCart(bookId: Int) {
        guard let book = (books.first{ $0.id == bookId }) else { return }
        // Update cart
        cart.numberOfItems += 1
        cart.total += book.price
        updateItemCart(book: book)
    }
    
    func cartItems() -> Cart {
        return cart
    }
    
    func checkout() {
        // Checkout = empty cart item
        for item in cart.items {
            bookAvailable(id: item.item.id)
        }
        cart = Cart(items: [], numberOfItems: 0, total: 0)
    }
}

// MARK: - Private methods
private extension MockBookService {
    func bookAvailable(id: Int) {
        if let row = booksDetail.firstIndex(where: {$0.bookId == id}),
           var book = booksDetail.first(where: {$0.bookId == id}) {
            book.isAvailable = true
            booksDetail[row] = book
        }
    }
    
    func updateItemCart(book: BookModel) {
        if let index = (cart.items.firstIndex{ $0.item.id == book.id }) {
            cart.items[index].unit += 1
        } else {
            cart.items.append(CartItems(id: UUID().uuidString, item: book, unit: 1))
        }
    }
}
