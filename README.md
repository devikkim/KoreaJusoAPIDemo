# KoreaJusoAPIDemo
Search Korea Address using Ministry of the Interior and Safety's Address Open API

(행정안전부의 주소 OpenAPI를 사용한 영문주소 검색데모 입니다.)


```SearchAddress``` Modules was made use [```VIPER```](https://github.com/devikkim/ViperSample) Architecture.

(```SearchAddress``` 모듈은 [```VIPER```](https://github.com/devikkim/ViperSample) 아키텍쳐를 사용하여 만들어졌습니다.)

## What you need

a. Get an API Key from [Ministry of the Interior and Safety's Address Open API (행정안전부)](http://www.juso.go.kr/addrlink/main.do?cPath=99MM)

(해당 사이트를 방문하여 API 키를 발급받으세요.)

b. Set your key at ```confmKey``` in ```SearchAddressService.swift```

(``` SearchAddressService.swift```에 있는 ```confmKey``` 값에 발급받은 키를 적어주세요.)

```swift
func fetchAddress(
    pageIndex: Int,
    interval: Int,
    keyword: String,
    success: @escaping (JusoResult?) -> Void,
    failure: @escaping (Error) -> Void
  ){
    let parameters = [
      "confmKey":"API-KEY",// Set your API Key
      "currentPage":"\(pageIndex)",
      "countPerPage":"\(interval)",
      "keyword":"\(keyword)",
      "resultType": "json"
    ]
    let url = "http://www.juso.go.kr/addrlink/addrEngApi.do"
    ...
}
```

## demo.gif

<img alt="Demo" src="/resources/demo.gif?raw=true" width="290">&nbsp;


## sample code

```swift
// In ViewController

  @IBAction func touchSearchButton(_ sender: UIButton) {
    SearchAddressWireframe().openViewControllerWithNavigationWithDelegate(
      delegate: self,
      source: self
    )
  }
  
extension ViewController: SearchAddressDelegate {
  func SearchAddress(viewController: SearchAddressViewController, didSelectedJuso juso: Juso) {
    
    zipcodeLabel.text = juso.zipNo
    roadAddressLabel.text = juso.roadAddr
    jibunAddressLabel.text = juso.jibunAddr
    addressTextField.text = juso.korAddr
    
    viewController.dismiss(animated: true, completion: nil)
  }
}

```

## Comment
This repository's purpose is just study. So there is no license. Please use as you like.

(이 리포지토리는 공부를 목적으로 생성하였습니다. 따로 저작권은 없습니다. 마음껏 사용하세요.)

## Author

devikkim@gmail.com
