//  ContentView.swift

import SwiftUI
import Firebase
import FirebaseStorage

class FirebaseManger: NSObject {
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManger()
    
    override init(){
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
}

struct LoginView: View {
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var loginStatusMessage = ""
    @State var shouldShowImagePicker = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    //회원가입화면
                    if !isLoginMode {
                        //프로필 이미지 설정
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                }else{
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                .stroke(Color.black, lineWidth: 3))
                        }
                    }
                    //로그인,회원가입화면
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    
                    //로그인하기 / 회원가입하기 버튼
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                    }
                    Text(self.loginStatusMessage)
                        .foregroundColor(.green)
                }//VStack
                .padding()
            }//ScrollView
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                .ignoresSafeArea())
        }//Nav
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker,
                         onDismiss:nil) {
            ImagePicker(image: $image)
        }
    }//body
    
    @State var image: UIImage?
    
    private func handleAction(){
        if isLoginMode {
            print("Log In Action")
            loginUser()
        }else{
            print("Create Account Action")
            createNewAccount()
        }
    }
    
    //한번 로그인 성공하면, 계속해서 로그인상태가 유지됨.
    //다시 로그인 하려면, 로그아웃을 하고 해야 됨.
    private func loginUser() {
        FirebaseManger.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
        }
    }
    private func createNewAccount() {
        FirebaseManger.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                return
            }
            print("Successfully create user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully create user: \(result?.user.uid ?? "")"
            
            //이미지 업로드
            self.persistImageToStorage()
            
            
        }
    }
    private func persistImageToStorage(){
        guard let _ = image else {
            self.loginStatusMessage = "Image Not choosed."
            return
        }
        //파이어베이스 스토리지에 업로드하려면, 인증된 사용자여야 됨.
        guard let uid = FirebaseManger.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManger.shared.storage.reference(withPath: uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.loginStatusMessage = "Failed to push image to Storage: \(err)"
                return
            }
            //이미지 업로드후 다운로드 URL을 전달 받는다.
            ref.downloadURL { url, err in
                if let err = err {
                    self.loginStatusMessage = "Failed to retrive downloadURL: \(err)"
                    return
                }
                self.loginStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                print(url?.absoluteString as Any)
                
                //회원정보 DB에 수록 : 인증(uid, name)
                //               : 로그인아이디, 가입일, 폰, 주소...
                guard let url = url else { return }
                self.storeUserInformation(imageProfileUrl: url)
            }
        }
        
    }
    private func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManger.shared.auth.currentUser?.uid else { return }
        //딕셔너리 : Key:Value형태의 데이타
        let userData = ["email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
        //Auth : uid
        //Firestore : users.document.uid
        FirebaseManger.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.loginStatusMessage = "Failed store data into Firestore:\(err)"
                    return
                }
                print("Successfully store data into Firestore.")
                self.loginStatusMessage += "\nSuccessfully store data into Firestore."
            }
    }
    
}//struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
//private func persistImageToStorage(){
//    guard let _ = image else {
//        self.loginStatusMessage = "Image Not Chose."
//        return
//    }
//    // 파이어베이스 스토리지에 업로드하려면, 인증된 사용자여야 됨.
//    guard let uid = FirebaseManger.shared.auth.currentUser?.uid else {
//        return }
//    let ref = FirebaseManger.shared.storage.reference(withPath: uid)
//    guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
//    ref.putData(imageData, metadata: nil) {
//        metadata, err in
//        if let err = err {
//            self.loginStatusMessage = "Failed to push image to storage: \(err)"
//            return
//        }
//        // 이미지 업로드 후 다운로드 URL을 전달 받는다.
//        ref.downloadURL { url, err in
//            if let err = err {
//                self.loginStatusMessage = "Failed to retrive downloadURL: \(err)"
//                return
//            }
//            self.loginStatusMessage = "Successfully stored image with downloadURL: \(url?.absoluteString ?? "")"
//            print(url?.absoluteString as Any)
//        }
//    }
//}
