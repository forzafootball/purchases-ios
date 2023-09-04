//
//  Copyright RevenueCat Inc. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  DebugViewController.swift
//
//  Created by Nacho Soto on 6/12/23.

import Foundation

#if DEBUG && os(iOS) && swift(>=5.8)
#if !(swift(>=5.9) && os(xrOS))

import SwiftUI
import UIKit

/// A view controller which allows debugging the current SDK setup.
///
/// You can present this yourself, or use `UIViewController.presentDebugRevenueCatOverlay`
/// for a default presentation using `UISheetPresentationController`.
///
/// - Seealso: `View.debugRevenueCatOverlay` for `SwiftUI`.
@available(iOS 16.0, *)
@objc(RCDebugViewController)
public final class DebugViewController: UIViewController {

    private lazy var hostingController: UIHostingController<DebugSwiftUIRootView> = {
        .init(rootView: .init())
    }()

    // swiftlint:disable:next missing_docs
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        super.loadView()

        self.addChild(self.hostingController)
        self.view.addSubview(self.hostingController.view)
        self.hostingController.didMove(toParent: self)
    }

    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        self.hostingController.view.frame = self.view.bounds
    }

}

#endif
#endif
