//
//  ALManager.swift
//  LayoutDemo
//
//  Created by Toju on 1/11/23.
//

import Foundation
import UIKit


class ALManager {
    
    enum SpacerPlacement {
        case beforeView(Int)
        case afterView(Int)
    }
    
    func centerInSuperView(_ v: UIView, size: CGSize = .zero, padding: UIEdgeInsets = .zero)  {
        
        v.translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = v.superview?.centerXAnchor {
            v.centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: padding.left).isActive = true
        }
        if let superviewCenterYAnchor = v.superview?.centerYAnchor {
            v.centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        if size.width != 0 {
            v.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            v.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func fillSuperView(_ v: UIView, padding: UIEdgeInsets = .zero)  {
        
        v.translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = v.superview?.topAnchor {
            v.topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = v.superview?.bottomAnchor {
            v.bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = v.superview?.leadingAnchor {
            v.leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = v.superview?.trailingAnchor {
            v.trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func placeAtTopOfSuperView(_ v: UIView, padding: UIEdgeInsets = .zero, height: CGFloat?, useSafeArea: Bool = true)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        if let superview = v.superview {
            if useSafeArea {
                v.translatesAutoresizingMaskIntoConstraints = false
                v.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding.top).isActive = true
                v.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left).isActive = true
                v.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right).isActive = true
            } else {
                v.translatesAutoresizingMaskIntoConstraints = false
                v.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top).isActive = true
                v.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left).isActive = true
                v.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right).isActive = true
            }
        }
        if let height = height, height > .zero {
            v.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func placeAtBottomOfSuperView(_ v: UIView, padding: UIEdgeInsets = .zero, height: CGFloat?, useSafeArea: Bool = true)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        if let superview = v.superview {
            if useSafeArea {
                v.translatesAutoresizingMaskIntoConstraints = false
                v.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: padding.top).isActive = true
                v.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left).isActive = true
                v.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right).isActive = true
            } else {
                v.translatesAutoresizingMaskIntoConstraints = false
                v.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: padding.top).isActive = true
                v.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left).isActive = true
                v.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right).isActive = true
            }
        }
        if let height = height, height > .zero {
            v.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func placeAboveAnother(_ v: UIView, otherView: UIView, spacing: CGFloat = 0, height: CGFloat?)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        v.bottomAnchor.constraint(equalTo: otherView.topAnchor, constant: spacing).isActive = true
        v.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: spacing).isActive = true
        v.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -spacing).isActive = true
        if let height = height, height > .zero {
            v.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func placeBelowAnother(_ v: UIView, otherView: UIView, spacing: CGFloat = 0, height: CGFloat?)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: otherView.bottomAnchor, constant: spacing).isActive = true
        v.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: spacing).isActive = true
        v.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -spacing).isActive = true
        if let height = height, height > .zero {
            v.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerAboveAnother(_ v: UIView, otherView: UIView, spacing: CGFloat = 0, height: CGFloat?)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        v.bottomAnchor.constraint(equalTo: otherView.topAnchor, constant: spacing).isActive = true
        v.centerXAnchor.constraint(equalTo: otherView.centerXAnchor).isActive = true
        if let height = height, height > .zero {
            v.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func placeVerticalBetween(_ v: UIView, otherViews: [UIView], padding: UIEdgeInsets = .zero)  {
        guard otherViews.count == 2 else { return }
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: otherViews[0].bottomAnchor, constant: padding.top).isActive = true
        v.leadingAnchor.constraint(equalTo: otherViews[0].leadingAnchor, constant: padding.left).isActive = true
        v.trailingAnchor.constraint(equalTo: otherViews[0].trailingAnchor, constant: -padding.right).isActive = true
        v.bottomAnchor.constraint(equalTo: otherViews[1].bottomAnchor, constant: -padding.bottom).isActive = true
    }
    
    func fillVerticalSpaceBelowAnother(_ v: UIView, otherView: UIView, padding: UIEdgeInsets = .zero)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        if let superView = otherView.superview {
            v.topAnchor.constraint(equalTo: otherView.bottomAnchor, constant: padding.top).isActive = true
            v.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: padding.left).isActive = true
            v.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -padding.right).isActive = true
            v.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -padding.bottom).isActive = true
        }
    }
    
    func fillVerticalSpaceAboveAnother(_ v: UIView, otherView: UIView, padding: UIEdgeInsets = .zero)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        if let superView = otherView.superview {
            v.bottomAnchor.constraint(equalTo: otherView.topAnchor, constant: -padding.bottom).isActive = true
            v.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: padding.left).isActive = true
            v.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -padding.right).isActive = true
            v.topAnchor.constraint(equalTo: superView.topAnchor, constant: padding.bottom).isActive = true
        }
    }
    
    func centerBelowAnother(_ v: UIView, otherView: UIView, spacing: CGFloat = 0, height: CGFloat?)  {
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: otherView.bottomAnchor, constant: spacing).isActive = true
        v.centerXAnchor.constraint(equalTo: otherView.centerXAnchor).isActive = true
        if let height = height, height > .zero {
            v.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    @discardableResult
    func tileHorizontally(_ views: [UIView], padding: UIEdgeInsets = .zero, height: CGFloat?, spacing: CGFloat = 0) -> UIStackView {
        guard !views.isEmpty else { return  UIStackView()}
        guard let superView = views.first?.superview else { return  UIStackView()}
        for item in views {
            item.removeFromSuperview()
        }
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.spacing = spacing
        superView.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        placeAtTopOfSuperView(stackView, padding: padding, height: height)
        return stackView
    }
    
    @discardableResult
    func tileVertically(_ views: [UIView], padding: UIEdgeInsets = .zero, height: CGFloat?, spacing: CGFloat = 0) -> UIStackView {
        guard !views.isEmpty else { return UIStackView() }
        guard let superView = views.first?.superview else { return UIStackView()}
        for item in views {
            item.removeFromSuperview()
        }
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.spacing = spacing
        superView.addSubview(stackView)
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        placeAtTopOfSuperView(stackView, padding: padding, height: height)
        return stackView
    }
    
    func resizeView(_ v: UIView, size: CGSize) {
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        v.widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    
    @discardableResult
    func tileHorizontallyWithSpacer(_ views: [UIView], spacerPlacement: SpacerPlacement, height: CGFloat, spacing: CGFloat = 0, padding: UIEdgeInsets = .zero) -> UIView {
        var set1 = [UIView]()
        var set2 = [UIView]()
        let container = UIView()
        guard !views.isEmpty else { return container}
        guard let superView = views.first?.superview else { return container}
        container.translatesAutoresizingMaskIntoConstraints = false
        for item in views {
            item.removeFromSuperview()
        }
        switch spacerPlacement {
        case .beforeView(let x):
            if x < 1 {return container}
            if x == 1 {
                set1 = []
                set2 = views
            } else {
                set1 = Array(views[0...x-2])
                set2 = Array(views[x-1...views.count - 1])
            }
        case .afterView(let x):
            if x > views.count {return container}
            if x == views.count {
                set1 = views
                set2 = []
            } else {
                set1 = Array(views[0...x-1])
                set2 =  Array(views[x...views.count - 1])
            }
        }
        superView.addSubview(container)
        placeAtTopOfSuperView(container, padding: padding, height: height)
        for i in 0..<set1.count {
            container.addSubview(set1[i])
            set1[i].translatesAutoresizingMaskIntoConstraints = false
            if i == 0 {
                set1[i].leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            } else {
                set1[i].leadingAnchor.constraint(equalTo: set1[i-1].trailingAnchor, constant: spacing).isActive = true
            }
            set1[i].topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            set1[i].bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        }
        for i in 0..<set2.count {
            container.addSubview(set2[i])
            set2[i].translatesAutoresizingMaskIntoConstraints = false
            if i == 0 {
                set2[i].trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
            } else {
                set2[i].trailingAnchor.constraint(equalTo: set2[i-1].leadingAnchor, constant: -spacing).isActive = true
            }
            set2[i].topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            set2[i].bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        }
        return container
    }
    
    @discardableResult
    func tileVerticallyWithSpacer(_ views: [UIView], spacerPlacement: SpacerPlacement, height: CGFloat = .zero, spacing: CGFloat = 0, padding: UIEdgeInsets = .zero) -> UIView {
        var set1 = [UIView]()
        var set2 = [UIView]()
        let container = UIView()
        guard !views.isEmpty else { return container}
        guard let superView = views.first?.superview else { return container}
        container.translatesAutoresizingMaskIntoConstraints = false
        for item in views {
            item.removeFromSuperview()
        }
        switch spacerPlacement {
        case .beforeView(let x):
            if x < 1 {return container}
            if x == 1 {
                set1 = []
                set2 = views
            } else {
                set1 = Array(views[0...x-2])
                set2 = Array(views[x-1...views.count - 1])
            }
        case .afterView(let x):
            if x > views.count {return container}
            if x == views.count {
                set1 = views
                set2 = []
            } else {
                set1 = Array(views[0...x-1])
                set2 =  Array(views[x...views.count - 1])
            }
        }
        superView.addSubview(container)
        placeAtTopOfSuperView(container, padding: padding, height: height)
        for i in 0..<set1.count {
            container.addSubview(set1[i])
            set1[i].translatesAutoresizingMaskIntoConstraints = false
            if i == 0 {
                set1[i].topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            } else {
                set1[i].topAnchor.constraint(equalTo: set1[i-1].bottomAnchor, constant: spacing).isActive = true
            }
            set1[i].leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            set1[i].trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        }
        for i in 0..<set2.count {
            container.addSubview(set2[i])
            set2[i].translatesAutoresizingMaskIntoConstraints = false
            if i == 0 {
                set2[i].bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            } else {
                set2[i].bottomAnchor.constraint(equalTo: set2[i-1].topAnchor, constant: -spacing).isActive = true
            }
            set1[i].leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            set1[i].trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        }
        return container
    }
    
}
