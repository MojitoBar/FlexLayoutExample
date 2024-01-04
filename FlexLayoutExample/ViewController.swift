//
//  ViewController.swift
//  FlexLayoutExample
//
//  Created by 주동석 on 1/4/24.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    private let myFlexView = MyFlexView()
    private let viewModel = ViewModel()
    private var cancellable: Set<AnyCancellable> = []
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPlusButton()
        setMinusButton()
        setBinding()
    }
    
    override func loadView() {
        view = myFlexView
        
        myFlexView.count.text = "\(count)"
    }
    
    private func setBinding () {
        viewModel.$count.sink { [weak self] count in
            self?.myFlexView.count.text = "\(count)"
        }.store(in: &cancellable)
    }
    
    private func setPlusButton() {
        myFlexView.plusButton.addAction(UIAction(handler: { [weak self] _ in
            self?.viewModel.addCount(value: 1)
        }), for: .touchUpInside)
    }
    
    private func setMinusButton() {
        myFlexView.minusButton.addAction(UIAction(handler: { [weak self] _ in
            self?.viewModel.addCount(value: -1)
        }), for: .touchUpInside)
    }
}


#Preview {
    return ViewController()
}
