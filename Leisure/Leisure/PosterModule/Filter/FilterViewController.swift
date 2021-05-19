import Foundation

import UIKit
import PinLayout

final class FilterViewController: UIViewController {
    private let presenter: PosterViewOutput
    private let filterView: FilterView

    init(presenter: PosterViewOutput) {
        self.presenter = presenter
        self.filterView = FilterView(presenter: presenter)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(filterView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
