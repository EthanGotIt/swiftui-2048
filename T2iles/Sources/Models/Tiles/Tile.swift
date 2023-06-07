import Foundation

//  定义泛型结构体IndexedTile<T: Tile>，结构体实现将方块们与它们在数组中的位置相关联，并且使用协议使得结构体更加灵活。
typealias IndexPair = (Int, Int)

protocol Tile: Identifiable, Equatable {
    
    associatedtype Value
    
    var value: Value { get set }
}

struct IdentifiedTile: Tile {
    var id: Int
    var value: Int
}

struct IndexedTile<T: Tile> {
    
    typealias Index = IndexPair
    
    let index: Index
    let tile: T
}

