//
//  ViewController.swift
//  redPacketView
//
//  Created by Thomas on 2022/12/7.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建背景视图
        let backgroundView = UIImageView(image: UIImage(named: "background"))
        backgroundView.frame = view.bounds
        view.addSubview(backgroundView)
        redRain()
    }

    func redRain() {
        // 创建红包雨
        for i in 0..<50 {
            // 创建一个红包图片和点击按钮
            let redPacketView = createRedPacketView()
            
            // 随机设置红包的位置
            redPacketView.center.x = CGFloat.random(in: 0..<500)
            redPacketView.center.y = -CGFloat(i * 50)
            view.addSubview(redPacketView)
            
            // 创建一个动画，让红包从屏幕外飘入
            animator = UIViewPropertyAnimator(duration: 10, curve: .linear, animations: {
                redPacketView.center.y = CGFloat.random(in: 1000..<1500)
            })
            
            animator?.isUserInteractionEnabled = true
            animator?.startAnimation()
        }
        
        animator?.addCompletion { _ in
            self.redRain()
        }
        
    }
    
    func createRedPacketView() -> UIImageView {
        // 创建一个红包图片
        let redPacketView = UIImageView(image: UIImage(named: "red_packet"))
        redPacketView.frame.size = CGSize(width: 50, height: 50)
        redPacketView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleRedPacketTap))
        redPacketView.addGestureRecognizer(tapGestureRecognizer)
        return redPacketView
    }


    
    @objc func handleRedPacketTap() {
        // 在这里实现红包的点击事件
        // 例如，弹出一个提示框，显示红包的奖励信息
        let alert = UIAlertController(title: "紅包奖勵", message: "恭喜你抽中了 10 元！", preferredStyle: .alert)
        let action = UIAlertAction(title: "確定", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


