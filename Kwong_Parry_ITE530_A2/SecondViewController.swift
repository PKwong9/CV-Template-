import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myInfo = CVInfo() //create instance of CV information
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //segue to selected item view and pass cell items
        
        if segue.identifier == "detailSegue",
            let detailVC = segue.destination as? TableViewDetailViewController,
            let index = tableView.indexPathForSelectedRow?.row
        {
            detailVC.companyName = myInfo.text[index]
            detailVC.yearOfWork = myInfo.year[index]
            detailVC.imageString = myInfo.company[index]
            detailVC.indexPath = index
            detailVC.backgroundImagePath = myInfo.backgroundArray[index]
        }
    }
    
    //MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myInfo.company.count //sets table rows
    }
 
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{ //creates reusable cell and assigns cell items
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondViewControllerTableViewCell
        
        cell.myImage.image = UIImage(named: myInfo.company[indexPath.row])
        cell.myLabel.text = myInfo.text[indexPath.row]
        cell.yearLabel.text = myInfo.year[indexPath.row]
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
 
}

