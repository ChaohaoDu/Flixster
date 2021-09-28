//
//  MovieDetailsViewController.swift
//  Flixster
//
//  Created by Chaohao Du on 9/22/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

	@IBOutlet weak var backdropView: UIImageView!
	@IBOutlet weak var postView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var synopsisLabel: UILabel!

	var movie: [String:Any]!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		titleLabel.text = movie["title"] as? String
		titleLabel.sizeToFit()

		synopsisLabel.text = movie["overview"] as? String
		synopsisLabel.sizeToFit()


		let baseUrl = "https://image.tmdb.org/t/p/w"

		let posterWidth = "185"
		let posterPath = movie["poster_path"] as! String
		let posterUrl = URL(string: baseUrl + posterWidth + posterPath)!
		postView.af.setImage(withURL: posterUrl)

		let backdropWidth = "780"
		let backdropPath = movie["backdrop_path"] as! String
		let backdropURL = URL(string: baseUrl + backdropWidth + backdropPath)!
		backdropView.af.setImage(withURL: backdropURL)
	}



	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		// Pass the selected object to the new view controller.
		let webViewController = segue.destination as! WebViewController
		webViewController.movie = self.movie
	}
}
