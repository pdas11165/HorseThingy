import Foundation

class HorseData: ObservableObject {
    @Published var horses: [Horse] = []

    init() {
        
        self.horses = testHorses
    }
    
    func addHorse(name: String, breed: String, time: Int) {
        let newHorse = Horse(name: name, breed: breed, time: time)
        horses.append(newHorse)
    }
    
    func deleteHorse(at offsets: IndexSet) {
        horses.remove(atOffsets: offsets)
    }
}
