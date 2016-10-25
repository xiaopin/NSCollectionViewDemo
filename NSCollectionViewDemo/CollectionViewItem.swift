//
//  CollectionViewItem.swift
//  NSCollectionViewDemo
//
//  Created by nhope on 2016/10/25.
//  Copyright © 2016年 xiaopin. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    @IBOutlet weak var iconImageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!

    override var representedObject: Any? {
        didSet {
            guard let data = self.representedObject as? Dictionary<String, Any> else {
                return
            }
            if let image = data["image"] as? NSImage {
                iconImageView.image = image
            }
            if let title = data["title"] as? String {
                titleLabel.stringValue = title
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.view.layer?.borderColor = NSColor.orange.cgColor
                self.view.layer?.borderWidth = 2.0
            } else {
                self.view.layer?.borderColor = NSColor.clear.cgColor
                self.view.layer?.borderWidth = 0.0
            }
        }
    }
    
    override var highlightState: NSCollectionViewItemHighlightState {
        didSet {
            if highlightState == .forSelection {
                self.view.layer?.backgroundColor = NSColor.gray.cgColor
            } else {
                self.view.layer?.backgroundColor = NSColor.clear.cgColor
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
    }
    
}
