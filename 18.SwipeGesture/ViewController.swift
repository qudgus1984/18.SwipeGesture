//
//  ViewController.swift
//  18.SwipeGesture
//
//  Created by 이병현 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        /*
        배열을 UIImage형으로 만들었기 때문에 append의 인수르 UIImage형의 값을 입력함.
        스와이프하면 검은색 화살표가 빨간색이 되도록 하기 위해 처음에는 검은색 화살표의 파일명,
        그 뒤에는 빨간색 화살표의 파일명을 입력하는 식으로 입력함. 첫 번째로 추가한 이미지는
        img[0]에 저장되고, 두 번째로 추가한 이미지는 imgUp[1]에 저장됌
        */
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        // 각 배열의 첫 번째 값은 검은색 화살표를 나타내며 인자 값 [0]을 사용하여 참조 가능.
        // 두 번째 값은 빨간색 화살표를 나타내며, 인자 값 [1]을 사용하여 참조 가능.
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector
            (ViewController.respondToSwipeGesture(_:))) // UISwipeGestureRecognizer 클래스 상수 swipeUp을 선언. 액션 인수는 제스쳐를 행했을 때 실행할 메서드를 의미함.
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up // 위에서 선언한 UISwipeGestureRecognizer 클래스 상수 swipeUP의 deirction 속성 설정
        self.view.addGestureRecognizer(swipeUp) // 뷰 객체의 addGestureRecognizer 메서드를 사용하여 위쪽 방향의 스와이프 제스쳐 등록
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector
            (ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector
            (ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector
            (ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer { // 만일 제스쳐가 있다면
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            // 우선 전체 이미지 뷰를 검은색 화살표로 초기화함.
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgUp[1]
            default:
                break // switch 문을 사용해 제스처의 방향에 따라 해당 방향의 이미지를 빨간색 이미지로 변경함.
            }
        }
    }

}

