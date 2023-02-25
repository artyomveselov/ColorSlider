//
//  MainViewController.swift
//  ColorSlider
//
//  Created by temaveselov on 07.02.2023.
//

import UIKit

protocol ColorViewControllerDelegate: AnyObject {
    func setNewBackgroundColor(from color: UIColor)
}

final class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? ColorViewController else { return }
        settingVC.colorView = view.backgroundColor
        settingVC.delegate = self
    }
}

extension MainViewController: ColorViewControllerDelegate {
    func setNewBackgroundColor(from color: UIColor) {
        view.backgroundColor = color
    }
}

