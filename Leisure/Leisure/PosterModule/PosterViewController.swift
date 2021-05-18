import UIKit
import PinLayout

final class PosterViewController: UIViewController {
    private let output: PosterViewOutput
    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false}
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

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
        searchController.searchResultsUpdater = self
        // взаимодействие с отфильтрованным
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        //отпустить строку поиска при переходе на другой экран
        definesPresentationContext = true
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
//                                                            target: self,
//                                                            action: #selector(didTapFilter))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "slider.horizontal.3"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapFilter))

        
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
    
    @objc
    private func didTapFilter() {
        output.didTapFilter()
    }
}

extension PosterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return output.filteredPostersViewModels.count
        }
        return output.postersViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntertaimentTableViewCell", for: indexPath) as? EntertaimentTableViewCell else {
            return .init()
            }

        cell.layer.cornerRadius=10
        
        if isFiltering {
            cell.configure(with: output.filteredPostersViewModels[indexPath.row])
        } else {
            cell.configure(with: output.postersViewModels[indexPath.row])
        }
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


extension PosterViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearch(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearch(_ searchText: String) {
        output.filteredPostersViewModels = output.postersViewModels.filter({ (poster: PosterViewModel) -> Bool in
            poster.short_title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
