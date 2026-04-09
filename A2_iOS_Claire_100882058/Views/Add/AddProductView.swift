import SwiftUI
import CoreData

struct AddProductView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var productID: String = ""
    @State private var name: String = ""
    @State private var productDesc: String = ""
    @State private var price: String = ""
    @State private var provider: String = ""
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    let themeColor = Color(red: 0.55, green: 0.44, blue: 0.28)
    let bgColor = Color(red: 0.98, green: 0.96, blue: 0.93)
    let cardColor = Color(red: 1.0, green: 0.98, blue: 0.95)
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                Text("Add New Product")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(themeColor)
                
                // Form Card
                VStack(spacing: 16) {
                    
                    inputField(title: "Product ID", text: $productID)
                    inputField(title: "Name", text: $name)
                    inputField(title: "Description", text: $productDesc)
                    inputField(title: "Price", text: $price)
                    inputField(title: "Provider", text: $provider)
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(red: 1.0, green: 0.98, blue: 0.95))
                        .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
                )

                Button(action: saveProduct) {
                    Text("Save Product")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
                .tint(themeColor)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Create")
        .alert("Message", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    
    private func inputField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            TextField("Enter \(title)", text: text)
                .padding(10)
                .background(Color.white)
                .cornerRadius(8)
        }
    }
    
    private func saveProduct() {
        guard let id = Int64(productID),
              let priceValue = Double(price),
              !name.isEmpty,
              !productDesc.isEmpty,
              !provider.isEmpty else {
            
            alertMessage = "Please fill all fields correctly."
            showAlert = true
            return
        }
        
        let newProduct = Product(context: viewContext)
        newProduct.productID = id
        newProduct.name = name
        newProduct.productDesc = productDesc
        newProduct.price = priceValue
        newProduct.provider = provider
        
        do {
            try viewContext.save()
            alertMessage = "Product added successfully!"
            showAlert = true
            clearForm()
        } catch {
            alertMessage = "Failed to save product."
            showAlert = true
        }
    }
    
    private func clearForm() {
        productID = ""
        name = ""
        productDesc = ""
        price = ""
        provider = ""
    }
}
