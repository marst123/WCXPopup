import UIKit


//MARK: - UITableView属性扩展

public extension Link where Base: UITableView {
    
    /// UITableViewDataSource协议代理
    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource?) -> Link {
        self.base.dataSource = dataSource
        return self
    }
    
    /// UITableViewDelegate协议代理
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    /// row高度
    @discardableResult
    func rowHeight(_ rowHeight: CGFloat) -> Link {
        self.base.rowHeight = rowHeight
        return self
    }
    
    /// 表头视图
    @discardableResult
    func headerView(_ headerView: UIView?) -> Link {
        self.base.tableHeaderView = headerView
        return self
    }
    
    /// 表尾视图
    @discardableResult
    func footerView(_ footerView: UIView?) -> Link {
        self.base.tableFooterView = footerView
        return self
    }
    
    /// 注册表头/表尾视图的NIB文件
    @discardableResult
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        self.base.register(UINib(nibName: identifier, bundle: bundle), forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    
    /// 注册表头/表尾视图的类
    @discardableResult
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ name: T.Type) -> Link {
        self.base.register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
        return self
    }
    
    /// 注册 cell 的NIB文件
    @discardableResult
    func register<T: UITableViewCell>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        self.base.register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
        return self
    }

    /// 注册 cell 的类
    @discardableResult
    func register<T: UITableViewCell>(cellWithClass name: T.Type) -> Link {
        self.base.register(T.self, forCellReuseIdentifier: String(describing: name))
        return self
    }
    
    /// 表的分隔线风格
    @discardableResult
    func separator(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Link {
        self.base.separatorStyle = separatorStyle
        return self
    }
    
    /// cell 预估高度
    @discardableResult
    func estimatedRowHeight(_ height: CGFloat) -> Link {
        self.base.estimatedRowHeight = height
        return self
    }
    
    /// 表头预估高度
    @discardableResult
    func estimatedSectionHeaderHeight(_ height: CGFloat) -> Link {
        self.base.estimatedSectionHeaderHeight = height
        return self
    }
    
    /// 表尾预估高度
    @discardableResult
    func estimatedSectionFooterHeight(_ height: CGFloat) -> Link {
        self.base.estimatedSectionFooterHeight = height
        return self
    }

}
