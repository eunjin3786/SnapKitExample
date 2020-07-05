import UIKit
import SnapKit

class SnapKitViewController: UIViewController {

    weak var box: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBox()
    }
    
    private func setupBox() {
        let box = UILabel()
        box.backgroundColor = .blue
        self.box = box
        
        view.addSubview(box)
        
        box.snp.makeConstraints { maker in
            maker.top.bottom.left.right.equalToSuperview()
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SnapKitViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = SnapKitViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SnapKitViewControllerRepresentable>) -> SnapKitViewController {
        UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SnapKitViewController")
    }
    
    func updateUIViewController(_ uiViewController: SnapKitViewController, context: UIViewControllerRepresentableContext<SnapKitViewControllerRepresentable>) {

        uiViewController.box.snp.remakeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(50)
            make.bottom.equalToSuperview().offset(-50)
            make.right.equalToSuperview().offset(-50)
        }
        
        uiViewController.box.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(100)
        }
        
        uiViewController.box.snp.remakeConstraints { (make) -> Void in
            make.edges.equalToSuperview().inset(50)
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        SnapKitViewControllerRepresentable()
    }
}
#endif


