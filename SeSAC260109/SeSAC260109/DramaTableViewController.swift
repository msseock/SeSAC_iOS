//
//  DramaTableViewController.swift
//  SeSAC260109
//
//  Created by 석민솔 on 1/8/26.
//

import UIKit

class DramaTableViewController: UITableViewController {
    
    var sample = ["민솔", "Jack", "Bran", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]

    @IBOutlet var dramaTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        // UIControl
        // function type
        addButton.addTarget(
            self,
            action: #selector(addButtonClicked),
            for: .touchUpInside
        )
        
        // 셀 높이 지정
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - table view 관련
    
    // 1. 셀 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return sample.count
    }
    
    // 2. 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = sample[indexPath.row]
        cell.textLabel?.textColor = .darkGray
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        cell.textLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.text = "디테일 글자"
        cell.detailTextLabel?.textColor = .gray
        cell.detailTextLabel?.font = .systemFont(ofSize: 15)
        
        return cell
    }
    
    // 3. 셀 높이
//    // 한 셀마다 n번씩 호출됨
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print(#function, indexPath)
//        return 80
//    }
    
    
    // 셀 눌리면
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        
        // 셀을 어떻게 지울지?가 아니라
        // 데이터를 제거하고 변경된 데이터를 뷰에 갱신
        sample.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    // MARK: - view logics
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        addText(dramaTextField.text)
    }
    
    @objc func addButtonClicked(_ sender: UIButton) {
        print(#function)
        
        addText(dramaTextField.text)
        view.endEditing(true)
    }
    
    private func addText(_ text: String?) {
        // 1. 텍스트필드 글자 가져오기
        guard let text = text, !text.isEmpty else {
            return
        }
        
        // 2. 샘플 배열 뒤에 append
        sample.append(text)
        
        // 3. 잘 추가되었는지 print로 확인
        print(sample)
        
        // 4. 데이터가 변한다고 해서 UI를 업데이트 해주지 않음
        // 데이터가 바뀌면 => 수동으로 UI 반영!!
        tableView.reloadData()

    }
}
