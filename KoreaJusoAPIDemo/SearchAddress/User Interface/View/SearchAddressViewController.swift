//
//  AddressSearchViewController.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

protocol SearchAddressDelegate: class {
  func SearchAddress(viewController: SearchAddressViewController, didSelectedJuso juso: Juso)
}

class SearchAddressViewController: UIViewController {
  
  // MARK: Properties
  var presenter: SearchAddressModuleInterface?
  weak var delegate: SearchAddressDelegate?
  
  lazy var activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .gray)
    indicator.hidesWhenStopped = true
    return indicator
  }()
  
  private var model: JusoResult? {
    didSet{
      guard
        let juso = self.model?.juso,
        let total = self.model?.common?.totalCount,
        let totalCount = Int(total) else { return }
      
      self.totalCount = totalCount
      jusoList.append(contentsOf: juso)
      tableView.reloadData()
      
      moveToTop()
      
      noResultLabel.text = self.totalCount == 0 ? "No results were found for your search." : ""
    }
  }
  
  private var jusoList = [Juso]()
  
  private var interval = 10
  
  private var pageIndex = 1
  
  private var totalCount = 0
  
  private var isSearch = false
  
  private var searchedText = "" {
    didSet{
      presenter?.fetchAddress(
        pageIndex: pageIndex,
        interval: interval,
        keyword: searchedText
      )
    }
  }
  
  // MARK: IBOutlets
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var searchBar: UISearchBar!
  @IBOutlet private weak var noResultLabel: UILabel!
  
  // MARK: VC's Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    searchBar.becomeFirstResponder()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    title = "Search Address"
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    view.endEditing(true)
  }
  
  // MARK: IBActions
  @IBAction private func touchCloseButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  // MARK: Other Functions
  private func setup() {
    tableView.delegate = self
    tableView.dataSource = self
    searchBar.delegate = self
    
    view.addSubview(activityIndicator)
    
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func setSearchBarAppearance(){
    let font = UIFont(name: "SanFranciscoDisplay-Regular", size: 14)!
    
    let textFieldInsideUISearchBar = self.searchBar.value(forKey: "searchField") as? UITextField
    textFieldInsideUISearchBar?.font = font
    
    let textFieldInsideUISearchBarLabel = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
    
    textFieldInsideUISearchBarLabel?.font = font
  }
  
  private func clear() {
    totalCount = 0
    pageIndex = 0
    jusoList.removeAll()
  }
  
  private func moveToTop(){
    if isSearch {
      let indexPath = NSIndexPath(row: NSNotFound, section: 0)
      tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: false)
      isSearch = false
    }
  }
}

// MARK: AddressSearchViewInterface
extension SearchAddressViewController: SearchAddressViewInterface {
  func setJusoModel(with model: JusoResult?) {
    self.model = model
  }
  
  func failure(with error: Error){
    let alertController = UIAlertController(
      title: "API Error",
      message: error.localizedDescription,
      preferredStyle: .alert
    )
    
    let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(defaultAction)
    
    present(alertController, animated: true, completion: nil)

  }
  
  func startLoading() {
    // add indicator then start
  }
  
  func endLoading() {
    // add indicator then end
  }
}

extension SearchAddressViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jusoList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as! AddressTableViewCell
    
    cell.setModel(with: self.jusoList[indexPath.row])
    
    return cell
  }
}

extension SearchAddressViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //TODO : if selected, return Juso model to parent
    self.delegate?.SearchAddress(viewController: self, didSelectedJuso: jusoList[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row + 1 == jusoList.count &&
      indexPath.row + 1 < totalCount {
      pageIndex += 1
      presenter?.fetchAddress(
        pageIndex: pageIndex,
        interval: interval,
        keyword: searchedText
      )
    }
  }
}

extension SearchAddressViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    clear()
    
    guard let address = searchBar.text else {
      return
    }
    
    isSearch = true
    searchedText = address
    searchBar.resignFirstResponder()
  }
}
