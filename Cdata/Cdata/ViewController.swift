
import UIKit

class ViewController: UIViewController, dataparse {
   
    var id:Int?
    var checkbool = false
    
    func data(fname: String, lname: String, number: String, email: String, get: Int, check: Bool) {
        txtFName.text = fname
        txtLName.text = lname
        txtNumber.text = number
        txtEmail.text = email
        id = get
        self.checkbool = check
    }
    
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        var dict = ["fname":txtFName.text,"lname":txtLName.text,"email":txtEmail.text,"number":txtNumber.text]
        
        if checkbool == true {
            
            let sec : SecondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            
            DataBase.sharedinstance.getData()
            
            DataBase.sharedinstance.editData(object: dict as! [String : String], i: id!)
            
            checkbool = false
            txtFName.text = ""
            txtLName.text = ""
            txtEmail.text = ""
            txtNumber.text = ""
            
        }else{
            if (txtFName.text!) == "" {
                self.alert(Title: "Enter Your First Name")
            }
            else if (txtLName.text) == "" {
                self.alert(Title: "Enter Your Last Name")
            }
            else if (txtNumber.text!) == "" {
                self.alert(Title: "Enter Your Number")
            }
            else if (txtEmail.text!) == "" {
                self.alert(Title: "Enter Your Email")
            }
            
            DataBase.sharedinstance.savedata(dict: dict as! [String : String])
            
            txtFName.text = ""
            txtLName.text = ""
            txtEmail.text = ""
            txtNumber.text = ""
        }
    }
    
    func alert(Title:String) {
        let alert = UIAlertView()
        alert.title = Title
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    @IBAction func btnShowData(_ sender: UIButton) {
        let sec : SecondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        sec.delegate = self
        self.navigationController?.pushViewController(sec, animated: true)
    }
}

