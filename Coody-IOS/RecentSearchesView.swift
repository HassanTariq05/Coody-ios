import SwiftUI

struct RecentSearchesView: View {
    let buttons: [String] = ["Pav Bhaji", "Butter Chicken", "Paneer Tikka", "Samosa", "Vada Pav", "Masala Dosa", "Biryani"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Recently Search")
                    .font(.custom("Inter", size: 18))
                    .foregroundStyle(.black)
                    .fontWeight(.medium)
                Spacer()
                Text("Clear")
                    .font(.custom("Inter", size: 14))
                    .foregroundStyle(.red)
                    .fontWeight(.medium)
            }
            .padding(.all, 10)

            WrappingHStack(buttons: buttons)
        }
    }
}

struct WrappingHStack: View {
    let buttons: [String]

    @State private var totalWidth = CGFloat.zero

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(computeWrappedLines(buttons: buttons), id: \.self) { line in
                HStack(spacing: 10) {
                    ForEach(line, id: \.self) { buttonTitle in
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.gray)
                                Text(buttonTitle)
                                    .foregroundStyle(Color.gray)
                            }
                            .frame(height: 36)
                            .padding(.horizontal, 10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }
                    }
                }
            }
        }
    }
    
    private func computeWrappedLines(buttons: [String]) -> [[String]] {
        var lines: [[String]] = [[]]
        var currentLineWidth: CGFloat = 0
        let maxWidth: CGFloat = UIScreen.main.bounds.width - 40
        
        for button in buttons {
            let buttonWidth = buttonSize(for: button).width + 40
            
            if currentLineWidth + buttonWidth > maxWidth {
                lines.append([button])
                currentLineWidth = buttonWidth
            } else {
                lines[lines.count - 1].append(button)
                currentLineWidth += buttonWidth
            }
        }
        return lines
    }

    private func buttonSize(for text: String) -> CGSize {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        return label.intrinsicContentSize
    }
}

#Preview {
    RecentSearchesView()
}
