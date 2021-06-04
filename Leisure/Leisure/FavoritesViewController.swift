import UIKit
import PinLayout

final class FavoritesViewController: UIViewController {
    private let output: FavoritesViewOutput
    private let tableView = UITableView()

    init(output: FavoritesViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Избранное"
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.didLoadView()
    }
    
    @objc
    private func didPullRefresh() {
        output.didPullRefresh()
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.postersViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntertaimentTableViewCell", for: indexPath) as? EntertaimentTableViewCell else {
            return .init()
            }

        cell.layer.cornerRadius=10
        
        cell.configure(with: output.postersViewModels[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTapCell(poster: output.postersViewModels[indexPath.row])
    }
}


extension FavoritesViewController: FavoritesViewInput {
    func reloadData() {
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
}



