import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var username = ""
    @State private var password = ""
    @State private var wrongCredentials = false
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            if isLoggedIn {
                OnboardingView()
            } else {
                VStack {
                    Text("Login or Signup")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding()

                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        .frame(width: 300, height: 50, alignment: .center)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        .frame(width: 300, height: 50, alignment: .center)

                    if wrongCredentials {
                        Text("Wrong username or password")
                            .foregroundColor(.red)
                            .padding(.bottom)
                    }

                    Button("Login or Signup") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .navigationBarHidden(true)
            }
        }
    }

    func authenticateUser(username: String, password: String) {
        // Add your authentication logic here (e.g., checking with a database or server)
        // For now, we'll assume a successful login if the username and password are not empty
        if !username.isEmpty && !password.isEmpty {
            isLoggedIn = true
            wrongCredentials = false
        } else {
            wrongCredentials = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
