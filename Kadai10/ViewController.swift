//
//  ViewController.swift
//  Kadai10
//
//  Created by 今村京平 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var tableview: UITableView!
    private let prefecture = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefecture.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let originalRed = UIColor(red: 255 / 255, green: 134 / 255, blue: 133 / 255, alpha: 1)
        let originalGreen = UIColor(red: 155 / 255, green: 255 / 255, blue: 153 / 255, alpha: 1)
        let originalBlue = UIColor(red: 174 / 255, green: 199 / 255, blue: 255 / 255, alpha: 1)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = prefecture[indexPath.row]
        cell.detailTextLabel?.text = "\(indexPath.row + 1)番目の都道府県です"
        cell.detailTextLabel?.textColor = UIColor.gray
        switch indexPath.row % 3 {
        case 0:
            cell.backgroundColor = originalRed
        case 1:
            cell.backgroundColor = originalGreen
        default:
            cell.backgroundColor = originalBlue
        }
        return cell
    }
    
    
}
