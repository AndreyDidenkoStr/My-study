//
//  CoursesViewController.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 31.08.2022.
//

import UIKit

class CoursesViewController: UITableViewController {
    
    private var courses: [Course] = []
    private var courseName: String?
    private var courseURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    func fetchData() {
        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
        
        
        guard let url = URL(string: jsonUrlString) else { return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }

        }.resume()
    }
    
    private func configureCell(cell: TableViewCell, for indexPath: IndexPath) {
        
        let course = courses[indexPath.row]
        cell.nameLabel.text = course.name
        
        
        if let numberOfLessons = course.numberOfLessons {
            cell.numberLabel.text = "\(numberOfLessons)"
        }
        
        if let numberOfTests = course.numberofTests {
            cell.label.text = "\(numberOfTests)"
        }
        DispatchQueue.global().async {
            guard let imageURL = URL(string: course.imageUrl!) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                cell.courseImage.image = UIImage(data: imageData)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webViewController = segue.destination as! WebViewController
        webViewController.courseName = courseName
        webViewController.courseURL = courseURL
        

        
    }
}

extension CoursesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        configureCell(cell: cell, for: indexPath)
        return cell
    }
}

    extension CoursesViewController {
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        courseName = course.name
        courseURL = course.link
        performSegue(withIdentifier: "Identifier", sender: self)
    }
}
