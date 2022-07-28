//
//  ViewController.swift
//  JokeJSONDemo
//
//  Created by ALEKSEY SUSLOV on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var setUpJokeLabel: UILabel!
    @IBOutlet var punchLineJokeLabel: UILabel!
    
    private let jokeManager = JokeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateJoke()
    }
    
    @IBAction func nextJokeButtonPressed() {
        updateJoke()
    }
    
    private func updateJoke() {
        jokeManager.fetchJoke { joke in
            DispatchQueue.main.async {
                self.setUpJokeLabel.text = joke.setup
                self.punchLineJokeLabel.text = joke.punchline
            }
        }
    }
}

