import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    func createTipsCalculationNC() -> UINavigationController {
        let tipsCalculationNC = TipsCalculationVC()
        tipsCalculationNC.title?.removeAll()
        tipsCalculationNC.tabBarItem = UITabBarItem(title: "Calculation", image:UIImage(systemName: "entry.lever.keypad"), tag: 0)
        return UINavigationController(rootViewController: tipsCalculationNC)
    }
    
    func createTipsInfoNC() -> UINavigationController {
        let tipsInfoNC = CountryListVC()
        tipsInfoNC.title?.removeAll()
        tipsInfoNC.tabBarItem = UITabBarItem(title: "Tips culture", image: UIImage(systemName: "info.circle"), tag: 1)
        return UINavigationController(rootViewController:tipsInfoNC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9176470588, blue: 1, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.9215686275, green: 0.9176470588, blue: 1, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.2392156863, green: 0.231372549, blue: 0.9529411765, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 1, green: 0.1607843137, blue: 0.1607843137, alpha: 1)
        tabBar.viewControllers = [createTipsCalculationNC(),createTipsInfoNC()]
        return tabBar
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

