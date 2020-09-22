

import UIKit

class AuteurListViewController: UIViewController {
  let auteurs = Auteur.auteursFromBundle()
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold) ]
    navigationItem.largeTitleDisplayMode = .automatic
    navigationController?.view.backgroundColor = .white
    
    // 오토레이아웃을 통한 테이블뷰 동적 설정
    tableView.rowHeight = UITableView.automaticDimension
    
    // Constraint to Margin : 여백을 기준, TableView에서 사용
    // Content Hugging Priority : Xcode에게 본래보다 커질경우 여백을 채울 공간을 알려준다.
    
    // '손쉬운 사용' 에 따라 텍스트 크기 변화
    // Text Styles: 'HeadLIne'
    // Automatically Adjusts Font = YES

  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? AuteurDetailViewController,
       let indexPath = tableView.indexPathForSelectedRow {
      destination.selectedAuteur = auteurs[indexPath.row]
    }
  }
}

extension AuteurListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return auteurs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AuteurTableViewCell
    let auteur = auteurs[indexPath.row]
    
    cell.bioLabel.text = auteur.bio
    cell.bioLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
    
    // image == nil, 2개의 테이블셀을 꾸성하여 분기 처리
    cell.auteurImageView.image = UIImage(named: auteur.image)
    cell.nameLabel.text = auteur.name
    cell.source.text = auteur.source
    
//    cell.nameLabel.textColor = .white
//    cell.bioLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
//    cell.source.textColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.0)
    cell.source.font = UIFont.italicSystemFont(ofSize: cell.source.font.pointSize)
    cell.nameLabel.textAlignment = .center
    cell.selectionStyle = .none
    
    cell.auteurImageView.layer.cornerRadius = cell.auteurImageView.frame.size.width / 2
    return cell
  }
}
