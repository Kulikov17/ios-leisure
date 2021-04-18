import UIKit
import PinLayout

final class PosterViewController: UIViewController {
	private let output: PosterViewOutput
    private let tableView = UITableView()

    init(output: PosterViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()

        title = "Афиша"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl

        
        tableView.register(EntertaimentTableViewCell.self, forCellReuseIdentifier: "EntertaimentTableViewCell")

        view.addSubview(tableView)
        
        output.didLoadView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin.all()
    }
    
    @objc
    private func didPullRefresh() {
        output.didPullRefresh()
    }
}

extension PosterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.posterViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntertaimentTableViewCell", for: indexPath) as? EntertaimentTableViewCell else {
            return .init()
            }

        cell.layer.cornerRadius=10

        cell.configure(with: output.posterViewModels[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTapCell(at: indexPath.row)
    }
}



extension PosterViewController: PosterViewInput {
    func reloadData() {
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
}
