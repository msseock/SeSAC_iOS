//
//  SettingTableViewController.swift
//  TableViewPractice
//
//  Created by 석민솔 on 1/8/26.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let sections: [SettingSection] = [
        .init(header: "전체 설정", cellList: ["공지사항", "실험실", "버전 정보"]),
        .init(header: "개인 설정", cellList: ["개인/보안", "알림", "채팅", "멀티프로필"]),
        .init(header: "기타", cellList: ["고객센터/도움말"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    /// 색션 개수 설정
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    /// 섹션별 row 개수 설정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].cellList.count
    }
    
    /// 섹션 Header 설정
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }
    
    /// 개별 cell 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        
        cell.textLabel?.text = sections[indexPath.section].cellList[indexPath.row]
        
        return cell
    }
    
    /// row height 설정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

struct SettingSection {
    let header: String
    let cellList: [String]
}
