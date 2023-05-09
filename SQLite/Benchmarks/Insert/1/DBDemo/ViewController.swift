//
//  ViewController.swift
//  DBDemo
//
//  Created by Bilal Hassan on 23/5/19.
//  Copyright © 2019 Bilal Hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var personTable: UITableView!

    let cellReuseIdentifier = "cell"

    var db:DBHelper = DBHelper()

    var persons:[Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        personTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        personTable.delegate = self
        personTable.dataSource = self

        //sleep(20)

        var currentDateTime=Date()
        var formatter=DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        var dateTimeString=formatter.string(from: currentDateTime)
        //print("Time after calling view did load and before starting insertions: " + dateTimeString)
        NSLog("Time after calling view did load and before starting insertions: " + dateTimeString);

        for i in 1...1 {
            let randomInt = Int.random(in: 1..<2)
            let n = "Bilal" + String(randomInt)
            let a = randomInt
            db.insert(id: i, name: n, age: a)
            let per = Person(id: i, name: n, age: a)
            persons.append(per)
        }

         currentDateTime=Date()
         formatter=DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
         dateTimeString=formatter.string(from: currentDateTime)
        print("Time after insertions: " + dateTimeString)
        db.delete()

        //sleep(20)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!

        cell.textLabel?.text = "Id: " + String(persons[indexPath.row].id) + ", " + "Name: " + persons[indexPath.row].name + ", " + "Age: " + String(persons[indexPath.row].age)

        return cell
    }
}
