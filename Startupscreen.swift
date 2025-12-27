import SwiftUI

struct BootView: View {
    @State private var isLoading = false
    @State private var logoOpacity = 0.0
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            // 背景はOSらしく真っ黒に
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // ロゴ部分（システムアイコンを使用）
                Image(systemName: "applelogo") // ここを自作アイコンに変更可能
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .opacity(logoOpacity)
                
                // プログレスバー
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.gray.opacity(0.5))
                        .frame(width: 200, height: 6)
                    
                    Capsule().fill(Color.white)
                        .frame(width: progress * 200, height: 6)
                }
            }
        }
        .onAppear {
            // 1. ロゴをフェードインさせる
            withAnimation(.easeIn(duration: 1.5)) {
                logoOpacity = 1.0
            }
            
            // 2. バーを徐々に伸ばす（3秒かけてロード）
            withAnimation(.linear(duration: 3.0)) {
                progress = 1.0
            }
        }
    }
}

