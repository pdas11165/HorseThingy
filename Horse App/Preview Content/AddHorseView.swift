import SwiftUI
struct AddHorseView: View {
    @Binding var horses: [Horse]
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var breed = ""
    @State private var time = ""
    @State private var image: UIImage?
    @State private var isShowingCamera = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Horse Details")) {
                    TextField("Name", text: $name)
                    TextField("Breed", text: $breed)
                    TextField("Time", text: $time)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Horse Photo")) {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    Button("Take Picture") {
                        isShowingCamera = true
                    }
                }
                
                Button("Add Horse") {
                    if let timeInt = Int(time), !name.isEmpty, !breed.isEmpty {
                        let newHorse = Horse(name: name, breed: breed, time: timeInt)
                        horses.append(newHorse)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
            }
            .navigationTitle("Add New Horse")
            .sheet(isPresented: $isShowingCamera) {
                ImagePicker(image: $image)
            }
        }
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
            }
            picker.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
