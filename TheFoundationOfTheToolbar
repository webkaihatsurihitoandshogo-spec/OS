import SwiftUI

struct ToolbarView: View {
    // アイコンのリスト（SF Symbolsの名前）
    let icons = ["finder", "terminal", "safari", "gearshape", "folder"]
    @State private var hoveredIcon: String? = nil

    var body: some View {
        HStack(spacing: 15) {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon == "finder" ? "macwindow" : icon) // Finderの代用
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .padding(8)
                    // ホバー時に少し大きくする演出
                    .scaleEffect(hoveredIcon == icon ? 1.2 : 1.0)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .onHover { isHovered in
                        withAnimation(.spring()) {
                            hoveredIcon = isHovered ? icon : nil
                        }
                    }
                    .onTapGesture {
                        print("\(icon) を起動しました")
                    }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        // macOS風のガラス質感
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        // 縁取り
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.3), lineWidth: 0.5)
        )
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}
