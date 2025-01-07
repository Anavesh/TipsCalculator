import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        configureNavigationBar()
    }
    func createTipsCalculationNC() -> UINavigationController {
        let tipsCalculationNC = TipsCalculationVC()
        tipsCalculationNC.title?.removeAll()
        tipsCalculationNC.tabBarItem = UITabBarItem(title: "Calculation", image:UIImage(systemName: "entry.lever.keypad"), tag: 0)
        return UINavigationController(rootViewController: tipsCalculationNC)
    }
    
    func createTipsInfoNC() -> UINavigationController {
        let tipsInfoNC = TipsInfoVC()
        tipsInfoNC.title?.removeAll()
        tipsInfoNC.tabBarItem = UITabBarItem(title: "Tips culture", image: UIImage(systemName: "info.circle"), tag: 1)
        return UINavigationController(rootViewController:tipsInfoNC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.5972653031, green: 0.9011378884, blue: 1, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.4142764509, blue: 0.8548873067, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.6922743917, green: 0.692825377, blue: 0.7096441984, alpha: 1)
        tabBar.viewControllers = [createTipsCalculationNC(),createTipsInfoNC()]
        return tabBar
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

