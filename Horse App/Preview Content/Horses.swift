import Foundation

struct Horse: Identifiable {
    var id = UUID()
    var name: String
    var breed: String
    var time: Int
    var imageName: String { return name }
}

let testHorses = [
    Horse(name: "American-Saddle-Horse-150x150", breed: "American Saddle Horse",time: 3),
    Horse(name: "American-Warmblood-Dressage-150x150", breed: "American Warmblood Dressage",time: 1),
    Horse(name: "Camarillo-White-Horse-Photos-150x150", breed: "Camarillo White Horse",time: 5),
    Horse(name: "Spotted-Draft-Horse-300x278", breed: "Spotted Draft Horse", time: 2)
]
