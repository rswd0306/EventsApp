//
//  ViewController.swift
//  EventApp



import UIKit

class HomeVC: UIViewController {
    
    //MARK:- Outlet Zone
    
    @IBOutlet weak var tblEventList:UITableView!
    
    //MARK:- Variable Declration
    
    var searchBar = UISearchBar()
    let viewModel = HomeViewModel()
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSearchResult()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SetupUI()
    }
    
    //MARK:- Fetch Search result

    private func fetchSearchResult(searchKey: String = "") {
        viewModel.getSearchResult(for: searchKey) { (_,error) in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                DispatchQueue.main.async {
                    self.show(alert, sender: nil)
                }
                return
            }
            DispatchQueue.main.async {
                self.tblEventList.reloadData()
            }
        }
    }
    
    //MARK:- Setup UI
    
    func SetupUI() {
        let attributes:[NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
        
        self.searchBar = UISearchBar(frame: .zero)
        self.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0, green: 0.03137254902, blue: 0.09019607843, alpha: 1)
        self.searchBar.searchTextField.textColor = .white
        self.searchBar.searchTextField.tintColor = .white
        self.searchBar.showsCancelButton = true
        self.searchBar.searchTextField.leftView?.tintColor = .white
        self.searchBar.placeholder = "Search here"
        self.searchBar.delegate = self
        self.navigationItem.titleView = self.searchBar
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    @IBAction func btnFavAction(_ sender:UIButton) {
        guard let model = viewModel.getEventListDataSource(atIndex: sender.tag) else { return }
        if var arrId = defaults.object(forKey: kFav) as? [Int] {
            if let index = arrId.firstIndex(where: {$0 == model.id}) {
                arrId.remove(at: index)
                defaults.setValue(arrId, forKey: kFav)
            }
        }
        self.tblEventList.reloadData()
    }

}

//MARK:- UITablview delegate & datasource

extension HomeVC:UITableViewDelegate,UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.getNumberOfRows() == 0 {
            let lbl = UILabel()
            lbl.text = "No event available"
            lbl.textAlignment = NSTextAlignment.center
            lbl.textColor = UIColor.black
            lbl.center = tableView.center
            tblEventList.backgroundView = lbl
            return 0
        }
        tblEventList.backgroundView = nil
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        if viewModel.getNumberOfRows() == 0 {
            return cell
        }
        guard let model = viewModel.getEventListDataSource(atIndex: indexPath.row) else { return UITableViewCell() }
        cell.lblEventName.text = model.title
        cell.lblDescription.text = model.venue.displayLocation
        
        let df = DateFormatter()
        df.dateFormat = df1
        let finalDate = df.date(from: model.datetimeLocal) ?? Date()
        
        df.dateFormat = df2
        let strEventDate = df.string(from: finalDate)
        cell.lblDate.text = strEventDate
        
        if let arrId = defaults.object(forKey: kFav) as? [Int] {
            if arrId.firstIndex(where: {$0 == model.id}) != nil {
                cell.btnFavOutlet.isHidden = false
            } else {
                cell.btnFavOutlet.isHidden = true
            }
        } else {
            cell.btnFavOutlet.isHidden = true
        }
        cell.btnFavOutlet.tag = indexPath.row
        cell.btnFavOutlet.addTarget(self, action: #selector(btnFavAction(_:)), for: .touchUpInside)
        
        let cache = ImageLoadingWithCache()
        if model.performers.count > 0 {
            cache.getImage(url: model.performers[0].image, imageView: cell.imgEvent, defaultImage: "ic_placeholder")
        } else {
            cell.imgEvent.image = UIImage(named: "ic_placeholder")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.getNumberOfRows() == 0 {
            return
        }
        guard let arrEventList = viewModel.getEventListDataSource(atIndex: indexPath.row) else { return }
        self.navigationItem.titleView = nil
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeDetailVC") as! HomeDetailVC
        obj.dictEventDetail = arrEventList
        obj.updateHanlder = { [weak self] in
            self?.tblEventList.reloadData()
        }
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = viewModel.getNumberOfRows() - 5
        if indexPath.row == lastItem && viewModel.totalPages > viewModel.getNumberOfRows() {
            viewModel.page += 1
            fetchSearchResult(searchKey: searchBar.text ?? "")
        }
    }
    
}

//MARK:- UISearbar Delegate

extension HomeVC : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.resetDataSource()
        viewModel.page = 1
        fetchSearchResult(searchKey: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
