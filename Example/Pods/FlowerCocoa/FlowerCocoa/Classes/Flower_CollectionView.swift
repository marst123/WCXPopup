import UIKit


//MARK: - UICollectionView属性扩展

public extension Link where Base: UICollectionView {
    
    /// UICollectionViewDataSource协议代理
    @discardableResult
    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Link {
        self.base.dataSource = dataSource
        return self
    }
    
    /// UICollectionViewDelegate协议代理
    @discardableResult
    func delegate(_ delegate: UICollectionViewDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    /// 注册 cell 的NIB类
    @discardableResult
    func register<T: UICollectionViewCell>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        self.base.register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
        return self
    }
    
    /// 注册 cell 的类
    @discardableResult
    func register<T: UICollectionViewCell>(viewClass name: T.Type) -> Link {
        let identifier = String(describing: name)
        self.base.register(T.self, forCellWithReuseIdentifier: identifier)
        return self
    }
    
    /// 注册表头视图的NIB文件
    @discardableResult
    func registerHeader<T: UICollectionReusableView>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        self.base.register(UINib(nibName: identifier, bundle: bundle),
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: identifier)
        return self
    }
    
    /// 注册表头视图的类
    @discardableResult
    func registerHeader<T: UICollectionReusableView>(viewClass name: T.Type) -> Link {
        let identifier = String(describing: name)
        self.base.register(name.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: identifier)
        return self
    }
    
    /// 注册表尾视图的NIB文件
    @discardableResult
    func registerFooter<T: UICollectionReusableView>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        self.base.register(UINib(nibName: identifier, bundle: bundle),
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: identifier)
        return self
    }
    
    /// 注册表尾视图的类
    @discardableResult
    func registerFooter<T: UICollectionReusableView>(viewClass name: T.Type) -> Link {
        let identifier = String(describing: name)
        self.base.register(name.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: identifier)
        return self
    }
}


//MARK: - UICollectionViewFlowLayout属性扩展

public extension Link where Base: UICollectionViewFlowLayout {
    
    /// 滚动方向
    @discardableResult
    func scrollDirection(_ direction: UICollectionView.ScrollDirection) -> Link {
        self.base.scrollDirection = direction
        return self
    }
    
    /// Cell 的大小
    @discardableResult
    func itemSize(_ size: CGSize) -> Link {
        self.base.itemSize = size
        return self
    }
    
    /// 最小行间距和最小列间距
    @discardableResult
    func minSpacing(lineSpacing: CGFloat? = nil, itemSpacing: CGFloat? = nil) -> Link {
        if let lineSpacing = lineSpacing {
            self.base.minimumLineSpacing = lineSpacing
        }
        if let itemSpacing = itemSpacing {
            self.base.minimumInteritemSpacing = itemSpacing
        }
        return self
    }
    
    /// cell预估大小
    @discardableResult
    func estimatedItem(_ size: CGSize) -> Link {
        self.base.estimatedItemSize = size
        return self
    }
}
