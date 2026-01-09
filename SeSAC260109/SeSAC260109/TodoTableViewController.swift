//
//  TodoTableViewController.swift
//  SeSAC260109
//
//  Created by 석민솔 on 1/9/26.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todoData: [Todo] = [
        .init(title: "식후 아아 때리기", done: false, like: false),
        .init(title: "영화 보기", done: false, like: false),
        .init(title: "놀기", done: false, like: true),
        .init(title: "낮잠 자기", done: true, like: false),
        .init(title: "오늘과제", done: false, like: false),
        .init(title: "주말과제", done: false, like: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(#function, indexPath)
        
        // Type Casting
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        
//        // 재사용 메커니즘 구조로, 100% 모든 셀에 대한 디자인을 해야 문제가 발생하지 않는다
//        if indexPath.row == 2 {
//            cell.backgroundColor = .secondarySystemBackground
//            cell.todoLabel.textColor = .systemBlue
//        }
        
        // UI
        let currentData = todoData[indexPath.row]
        
        cell.todoLabel.text = currentData.title
        cell.todoLabel.textColor = currentData.done ? .secondaryLabel : .label
        
        // true -> fill, false -> empty
        cell.checkButton.setImage(
            currentData.done
            ? UIImage(systemName: "checkmark.circle.fill")
            : UIImage(systemName: "circle"),
            for: .normal
        )
        cell.starButton.setImage(
            currentData.like
            ? UIImage(systemName: "star.fill")
            : UIImage(systemName: "star"),
            for: .normal
        )
                
        // action
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)

        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func doneButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        
        dump(todoData[sender.tag])
        todoData[sender.tag].done.toggle()
        dump(todoData[sender.tag])

        tableView.reloadData()
    }
    
    @objc func starButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        
        dump(todoData[sender.tag])
        todoData[sender.tag].like.toggle()
        dump(todoData[sender.tag])
        
        tableView.reloadData()
    }
}
