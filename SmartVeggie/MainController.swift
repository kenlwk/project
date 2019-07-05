import UIKit

class MainController: UIPageViewController, UIPageViewControllerDataSource {
    
    public var test:Int = 103
    
    private let controllerNames = [
        "HomeViewController",
        "AnalysisViewController",
        "RecipeViewController",
        "CustomViewController"
    ]
    
    private var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        controllerNames.forEach { name in
            let ctrl = mainStoryboard.instantiateViewController(withIdentifier: name)
            controllers.append(ctrl)
        }
        
        self.dataSource = self
        
        guard let firstCtrl = controllers.first else {
            return
        }
        
        self.setViewControllers([firstCtrl], direction: .forward, animated: false, completion: .none)
    }
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: .none)
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else {
            return .none
        }
        
        if index == 0 {
            return .none
        }
        
        return controllers[index - 1]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else {
            return .none
        }
        
        if index == controllers.count - 1 {
            return .none
        }
        
        return controllers[index + 1]
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let ctrl = pageViewController.viewControllers?.first else {
            return 0
        }
        
        guard let index = controllers.firstIndex(of: ctrl) else {
            return 0
        }
        
        return index
    }
    
//    @objc public func Test(){
//        print("hello world")
//        guard let currentViewController = self.controllers else { return }
//        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
//        
//        self.setViewControllers([nextViewController], direction: .forward, animated: true, completion: .none)
//    }
}
