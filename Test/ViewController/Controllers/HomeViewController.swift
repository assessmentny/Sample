//
//  ViewController.swift
//  Test
//
//  Created by Hussain.Chhatriwala on 10/18/18.
//  Copyright © 2018 Hussain.Chhatriwala. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var mostpopularNews: News?
    var tableData: [Result]?
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        webserviceCallingGetAllData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
    }

    func setupSearchController() {
        if searchController.searchBar.showsCancelButton == false {
            definesPresentationContext = true
            searchController.dimsBackgroundDuringPresentation = false
            searchController.searchResultsUpdater = self
            searchController.searchBar.barTintColor = UIColor(white: 0.9, alpha: 0.9)
            searchController.searchBar.placeholder = "Search most popular news.."
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.searchBar.delegate = self
            searchController.searchBar.showsCancelButton = true
            tableView.tableHeaderView = searchController.searchBar
        }
       
    }

    @IBAction func searchButtonAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.setupSearchController()
            self.searchController.searchBar.becomeFirstResponder()
        }
    }
}

// MARK: - HomeViewController (WebserviceCalling)
extension HomeViewController {
    func webserviceCallingGetAllData() {
        let url = APIBaseURLs.baseURL + MostViewedService.allSection + "?api-key=\(apiKey)"
        let loaderView = displaySpinner()
        NetworkManager.sendRequest(requestUrl: url, success_handler: { data in
            let decoder = JSONDecoder()
            do {
                let news = try decoder.decode(News.self, from: data)
                self.mostpopularNews = news
                self.tableData = self.mostpopularNews?.results
                DispatchQueue.main.async {
                    self.removeSpinner(spinner: loaderView)
                    self.tableView.reloadData()
                }
            }
            catch {
                debugPrint(error)
            }
        }) { _ in
        }
    }
}

//MARK:- UISearchResultsUpdating/UISearchBarDelegate

extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let term = searchController.searchBar.text {
            if term.count > 0 {
                filterRowsForSearchedText(term)
            }
            else {
                tableData = mostpopularNews?.results
            }
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        tableView.tableHeaderView = UIView()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func filterRowsForSearchedText(_ searchText: String) {
        tableData = mostpopularNews?.results?.filter({ (newsItem: Result) -> Bool in
            if let title = newsItem.title, let abstract = newsItem.abstractField {
                return (title.lowercased().contains(searchText.lowercased()) || abstract.lowercased().contains(searchText.lowercased()))
            }
            return true
        })
        tableView.reloadData()
    }
}

//MARK:- UITableViewDataSource/UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let newsItems = self.tableData else { return 0 }
        return newsItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsItems = self.tableData else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.loadCellForNews(news: newsItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        guard let newsItems = self.tableData else { return }
        if let newsDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController {
            newsDetailViewController.newsHTMLurl = newsItems[indexPath.row].url
            navigationController?.pushViewController(newsDetailViewController, animated: true)
        }
    }
}
