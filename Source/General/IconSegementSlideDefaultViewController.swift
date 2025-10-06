//
//  IconSegementSlideDefaultViewController.swift
//  SegementSlide
//
//  Created by Giau Huynh on 1/10/25.
//  Copyright © 2025 Jiar. All rights reserved.
//

import UIKit

open class IconSegementSlideDefaultViewController: SegementSlideViewController {

    private let defaultSwitcherView = IconSegementSlideDefaultSwitcherView()

    public override func segementSlideSwitcherView() -> SegementSlideSwitcherDelegate {
        defaultSwitcherView.delegate = self
        defaultSwitcherView.ssDataSource = self
        return defaultSwitcherView
    }

    open override func setupSwitcher() {
        super.setupSwitcher()
        defaultSwitcherView.config = switcherConfig
    }

    open var switcherConfig: SegementSlideDefaultSwitcherConfig {
        return SegementSlideDefaultSwitcherConfig.shared
    }

    open override var switcherHeight: CGFloat {
        return 44
    }

    open var titlesInSwitcher: [String] {
        return []
    }

    open var iconsInSwitcher: [UIImage] {
        return []
    }

    open var selectedIconsInSwitcher: [UIImage] {
        return []
    }

    open func showBadgeInSwitcher(at index: Int) -> BadgeType {
        return .none
    }

    /// reload badges in SwitcherView
    public func reloadBadgeInSwitcher() {
        defaultSwitcherView.reloadBadges()
    }

}

extension IconSegementSlideDefaultViewController: SegementSlideSwitcherDataSource {

    public var height: CGFloat {
        return switcherHeight
    }

    public var titles: [String] {
        return titlesInSwitcher
    }

    public var icons: [UIImage] {
        return iconsInSwitcher
    }

    public var selectedIcons: [UIImage] {
        return selectedIconsInSwitcher
    }

}

extension IconSegementSlideDefaultViewController: IconSegementSlideDefaultSwitcherViewDelegate {

    public var titlesInSegementSlideSwitcherView: [String] {
        return switcherView.ssDataSource?.titles ?? []
    }

    public var iconsInSegementSlideSwitcherView: [UIImage] {
        return switcherView.ssDataSource?.icons ?? []
    }

    public var selectedIconsInSegementSlideSwitcherView: [UIImage] {
        return switcherView.ssDataSource?.selectedIcons ?? []
    }

    public func segementSwitcherView(_ segementSlideSwitcherView: IconSegementSlideDefaultSwitcherView, didSelectAtIndex index: Int, animated: Bool) {
        if contentView.selectedIndex != index {
            contentView.selectItem(at: index, animated: animated)
        }
    }

    public func segementSwitcherView(_ segementSlideSwitcherView: IconSegementSlideDefaultSwitcherView, showBadgeAtIndex index: Int) -> BadgeType {
        return showBadgeInSwitcher(at: index)
    }

}
