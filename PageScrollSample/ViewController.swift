/*
 UIScrollViewの表示領域 = scrollView.frame
 UIScrollViewの内容領域 = scrollView.contentSize
 表示領域は内容領域が見える範囲
 内容領域はスクロールして見える領域
 */

/*
 scrollviewはstrotyboardで実装する。
 その際、paging Enabledにチェックを入れるのを忘れずに！
 show Horizontal Indicatorのチェックを外す
パーツはコードで書く
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        // スクロールビューのコンテンツサイズを指定
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 3,
                                        height: scrollView.frame.size.height)
        
        
        
        // 一枚目のみ画面を緑色にする
        let view1 = UIView()
        view1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view1.backgroundColor = UIColor.green
        self.scrollView.addSubview(view1)
        
        setLabel2()
        setLabel3()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLabel2() {
        //２ページ目にラベルを置く
        let label = UILabel()
        label.frame = CGRect(x: self.view.frame.width*1.25, y: self.view.frame.height/4, width: 200, height: 200)
        label.backgroundColor = UIColor.red
        label.text = "2"
        label.textAlignment = .center
        self.scrollView.addSubview(label)
    }
    
    func setLabel3() {
        //２ページ目にラベルを置く
        let label = UILabel()
        label.frame = CGRect(x: self.view.frame.width*2.25, y: self.view.frame.height/4, width: 200, height: 200)
        label.backgroundColor = UIColor.blue
        label.text = "3"
        label.textAlignment = .center
        self.scrollView.addSubview(label)
    }
    
}

extension ViewController: UIScrollViewDelegate {
    //スクロールした時の処理
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //pageControlと結びつける
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
 
}

