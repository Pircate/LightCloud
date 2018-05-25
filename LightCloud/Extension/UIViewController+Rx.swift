//
//  UIViewControllerExt.swift
//  LightCloud
//
//  Created by GorXion on 2018/5/2.
//

import RxSwift
import RxCocoa
import ExtensionX

extension Reactive where Base: UIViewController {
    
    func push(to viewController: UIViewController) -> Binder<Void> {
        return Binder(base) { from, to in
            from.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    var goBack: Binder<Void> {
        return Binder(base) { vc, _ in
            vc.goBack()
        }
    }
    
    var dismiss: Binder<Void> {
        return Binder(base) { vc, _ in
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    var gotoLogin: Binder<Void> {
        return Binder(base) { vc, _ in
            let nav = UINavigationController(rootViewController: LoginViewController())
            nav.navigation.configuration.isEnabled = true
            nav.navigation.configuration.isTranslucent = true
            nav.navigation.configuration.barTintColor = UIColor(hex: "#4381E8")
            nav.navigation.configuration.titleTextAttributes = [.foregroundColor: UIColor.white]
            vc.present(nav, animated: true, completion: nil)
        }
    }
}
