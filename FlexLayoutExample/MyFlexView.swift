//
//  MyFlexView.swift
//  FlexLayoutExample
//
//  Created by 주동석 on 1/4/24.
//

import UIKit
import FlexLayout
import PinLayout

final class MyFlexView: UIView {
    private let rootFlexContainer = UIView()
    
    let plusButton = UIButton(configuration: .filled())
    let minusButton = UIButton(configuration: .filled())
    let count = UILabel()
    private let footer = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        configurePlusButton()
        configureMinusButton()
        configureCount()
        configureFooter()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
    
    private func configurePlusButton() {
        plusButton.setTitle("+", for: .normal)
    }
    
    private func configureMinusButton() {
        minusButton.setTitle("-", for: .normal)
    }
    
    private func configureCount() {
        count.text = "0"
        count.textAlignment = .center
        count.font = UIFont.systemFont(ofSize: 60.0)
    }
    
    private func configureFooter() {
        footer.text = "this is footer ~"
    }
    
    private func setLayout() {
        rootFlexContainer.flex.width(100%).direction(.column).padding(12).define { flex in
            // 버튼
            flex.addItem().direction(.row).justifyContent(.spaceBetween).define { flex in
                flex.addItem(plusButton).grow(1)
                flex.addItem(minusButton).grow(1).marginLeft(50)
            }
            // 라벨
            flex.addItem().direction(.row).justifyContent(.center).define { flex in
                flex.addItem(count).grow(1).shrink(1)
            }
            // 푸터
            flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
            flex.addItem(footer).marginTop(12)
        }
        
        addSubview(rootFlexContainer)
    }
}

#Preview {
    return ViewController()
}
