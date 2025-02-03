import SwiftUI

struct ContentView: View {
    @State private var horses: [Horse] = testHorses
    @State private var isShowingAddHorse = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(horses) { horse in
                        NavigationLink(destination: HorseDetailView(horse: horse)) {
                            HStack {
                                Image(horse.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(horse.breed)
                                        .font(.headline)
                                    Text("Age: \(horse.time) years")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .onDelete(perform: deleteHorse)
                }
                
                Text("You have a total of \(horses.count) horses")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("Horses")
            .navigationBarItems(trailing:
                Button(action: {
                    isShowingAddHorse = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                }
            )
            .sheet(isPresented: $isShowingAddHorse) {
                AddHorseView(horses: $horses)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func deleteHorse(at offsets: IndexSet) {
        horses.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
