import SwiftUI

struct MainView: View {
    @EnvironmentObject private var appState: AppState
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OverviewView()) {
                    HStack {
                        Text("Overview")
                            .font(.title2)
                            .bold()
                    }
                    .cornerRadius(10)
                }
            
                NavigationLink(destination: HorsesView()) {
                    HStack {
                        Image("icons8-horse-100")
                            .resizable()
                            .scaledToFit()
                        Text("Horses")
                            .font(.title2)
                            .bold()
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                }
                List {
                Section(header: Text("Applicable Sections")) {
                    ForEach(appState.applicableSections) { section in
                        NavigationLink(destination: SectionView(title: section.title)) {
                            Text(section.title)
                        }
                    }
                }
            }
            }
            .navigationTitle("Horse Manager")
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AppState())
} 
