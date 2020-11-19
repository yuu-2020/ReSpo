//
//  QRScannerController.swift
//  eZukaAR
//
//  Created by Nanako Shimizu on 2020/11/20.
//
import AVFoundation
import UIKit

class QRScannerController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // カメラやマイクの入出力を管理するオブジェクトを生成
    private let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // カメラやマイクのデバイスそのものを管理するオブジェクトを生成
        // （ここではワイドアングルカメラ・ビデオ・背面カメラを指定）
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType:.video, position: .back)
        
        // ワイドアングルカメラ・ビデオ・背面カメラに該当するデバイスを取得
        let devices = discoverySession.devices
        
        //　該当するデバイスのうち最初に取得したものを利用する
        if let backCamera = devices.first {
            do {
                // QRコードの読み取りに背面カメラの映像を利用するための設定
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                
                if self.session.canAddInput(deviceInput) {
                    self.session.addInput(deviceInput)
                    // 背面カメラの映像からQRコードを検出するための設定
                    let metadataOutput = AVCaptureMetadataOutput()
                    if self.session.canAddOutput(metadataOutput) {
                        self.session.addOutput(metadataOutput)
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        metadataOutput.metadataObjectTypes = [.qr]
                        // 背面カメラの映像を画面に表示するためのレイヤーを生成
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
                        previewLayer.frame = self.view.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.view.layer.addSublayer(previewLayer)
                        
                        // スクリーンの縦横幅
                        let screenWidth:CGFloat = self.view.frame.width
                        let screenHeight:CGFloat = self.view.frame.height
                        
                        // 読み取り範囲的なものを表示（なお，特に読み取り範囲は設定しておらず見た目だけ）
                        let flameView = UIView()
                        self.view.addSubview(flameView)
                        flameView.frame = CGRect(x:screenWidth/2-150, y:screenHeight/2-150, width:300, height:300)
                        flameView.layer.borderColor = UIColor.orange.cgColor
                        flameView.layer.borderWidth = 3
                        
                        // QRコード表示用のボタンを追加
                        let QRButton = UIButton()
                        // 位置とサイズ
                        QRButton.frame = CGRect(x:screenWidth/2-100, y:screenHeight/2+150,
                                                width: 200, height:50)
                        // タイトル
                        QRButton.setTitle("QRコード表示", for: UIControl.State.normal)
                        QRButton.setTitleColor(UIColor.orange, for: .normal)
                        QRButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                        // QRButton.backgroundColor = UIColor.white
                        // タップ時のアクション
                        QRButton.addTarget(self, action: #selector(QRScannerController.buttonTapped(_:)), for: .touchUpInside)
                        // viewに追加
                        self.view.addSubview(QRButton)
                        
                        // 読み取り開始
                        self.session.startRunning()
                    }
                }
            } catch {
                print("Error occured while creating video device input: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
            // QRコードのデータかどうかの確認
            if metadata.type != .qr { continue }
            
            // QRコードの内容が空かどうかの確認
            if metadata.stringValue == nil { continue }
            
            /*
             このあたりで取得したQRコードを使ってゴニョゴニョする
             読み取りの終了・再開のタイミングは用途によって制御が異なるので注意
             以下はQRコードに紐づくWebサイトをSafariで開く例
             */
            
            // URLかどうかの確認
            if let url = URL(string: metadata.stringValue!) {
                // 読み取り終了
                self.session.stopRunning()
                // QRコードに紐付いたURLをSafariで開く
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                break
            }
        }
    }
    
    @objc func buttonTapped(_ sender : Any) {
        //文字列をNSDataに変換し，QRコードを作成
        let str = "んごー"
        let data = str.data(using: String.Encoding.utf8)!
        
        //QRコードを生成
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = qr.outputImage!.transformed(by: sizeTransform)
        let context = CIContext()
        let cgImage = context.createCGImage(qrImage, from: qrImage.extent)
        let uiImage = UIImage(cgImage: cgImage!)
        
        //作成したQRコードを表示
        let qrImageView = UIImageView()
        qrImageView.contentMode = .scaleAspectFit
        qrImageView.frame = self.view.frame
        qrImageView.image = uiImage
        self.view.addSubview(qrImageView)
    }
}
