import SwiftUI

struct MainView: View {
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
            }
            .navigationTitle("Horse Manager")
        }
    }
}

#Preview {
    MainView()
} 
