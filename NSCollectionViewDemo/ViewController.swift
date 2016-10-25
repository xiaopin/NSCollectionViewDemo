//
//  ViewController.swift
//  NSCollectionViewDemo
//
//  Created by nhope on 2016/10/25.
//  Copyright © 2016年 xiaopin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource {

    @IBOutlet weak var collectionView: NSCollectionView!

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    lazy var contents: [Dictionary<String, Any>] = {
        let result: [Dictionary<String, Any>] = [
            ["title" : "computer", "image" : NSImage(named: NSImageNameComputer)!],
            ["title" : "folder", "image" : NSImage(named: NSImageNameFolder)!],
            ["title" : "home", "image" : NSImage(named: NSImageNameHomeTemplate)!],
            ["title" : "list", "image" : NSImage(named: NSImageNameListViewTemplate)!],
            ["title" : "network", "image" : NSImage(named: NSImageNameNetwork)!],
            ["title" : "share", "image" : NSImage(named: NSImageNameShareTemplate)!]
        ]
        return result
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = NSCollectionViewFlowLayout()
        layout.itemSize = NSSize(width: 120.0, height: 120.0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        collectionView.collectionViewLayout = layout
        collectionView.register(CollectionViewItem.self, forItemWithIdentifier: "Cell")
        // 必须将NSCollectionView的isSelectable设置为true才能选中item，否则代理的方法将不会被调用
        collectionView.isSelectable = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - NSCollectionViewDataSource
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: "Cell", for: indexPath)
        let content = contents[indexPath.item]
        item.representedObject = content
        return item
    }
    
    // MARK: - NSCollectionViewDelegate
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print(indexPaths)
    }

}

