//
//  LayoutExample1.swift
//  FlexLayoutExample
//
//  Created by 주동석 on 2024/01/05.
//

import UIKit
import FlexLayout
import PinLayout

final class LayoutExample1: UIView {
    private let rootFlexContainer = UIView()
    private var width: CGFloat = 0
    private let margin: CGFloat = 4
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .lightGray
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all(pin.safeArea)
        
        let width = rootFlexContainer.bounds.width
        rootFlexContainer.flex.height(width).layout()
    }
    
    private func setLayout() {
        rootFlexContainer.flex.direction(.column).height(width).padding(5).define { flex in
            flex.addItem().direction(.row).width(100%).height(100%).define { flex in
                flex.addItem().direction(.column).grow(4).define { flex in
                    flex.addItem().direction(.column).grow(4).define { flex in
                        flex.addItem().direction(.column).grow(3).define { flex in
                            flex.addItem().grow(1).backgroundColor(.black).margin(margin)
                        }
                        flex.addItem().direction(.row).grow(2).define { flex in
                            flex.addItem().direction(.column).grow(3).define { flex in
                                flex.addItem().direction(.row).grow(1).define { flex in
                                    flex.addItem().grow(1).backgroundColor(.red).margin(margin)
                                    flex.addItem().grow(1).backgroundColor(.blue).margin(margin)
                                    flex.addItem().grow(1).backgroundColor(.beige).margin(margin)
                                }
                                flex.addItem().grow(1).backgroundColor(.blue).margin(margin)
                            }
                            flex.addItem().direction(.column).grow(1).define { flex in
                                flex.addItem().grow(1).backgroundColor(.white).margin(margin)
                                flex.addItem().grow(1).backgroundColor(.white).margin(margin)
                            }
                        }
                    }
                }
                flex.addItem().direction(.column).grow(1).define { flex in
                    flex.addItem().grow(1).backgroundColor(.beige).margin(margin)
                    flex.addItem().grow(3).backgroundColor(.white).margin(margin)
                    flex.addItem().grow(1).backgroundColor(.beige).margin(margin)
                }
            }
        }
        addSubview(rootFlexContainer)
    }
}

#Preview {
    return LayoutExample1()
}
