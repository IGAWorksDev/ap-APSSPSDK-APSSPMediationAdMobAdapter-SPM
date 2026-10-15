//
//  AdMobInterstitialVideoAdapter.swift
//  SSP_TestApp
//
//  Created by Odin.송황호 on 4/29/24.
//

import UIKit

import APSSPSDK


final public class AdMobInterstitialVideoAdapter: APSSPInterstitialVideoAdapterProtocol {
   
    private var adMobMediationInterstitialVideoAd: AdMobMediationInterstitialVideoAd?
    
    public weak var delegate: APSSPInterstitialVideoAdapterDelegate?
    
    public weak var rootViewController: UIViewController?
    
    deinit {
        APLogger.debug("AdMobInterstitialVideoAdapter deinit")
    }

    public init(placementDic: [String: String], rootViewController: UIViewController?, info: [String : Any?]) {
        let placementId = placementDic[APSSPPlacementKey.adUnitID.rawValue] ?? ""
        adMobMediationInterstitialVideoAd = AdMobMediationInterstitialVideoAd(placementId: placementId)
        self.adMobMediationInterstitialVideoAd?.delegate = self
    }
    
    public func present(from: UIViewController, completion: @escaping () -> Void) {
        adMobMediationInterstitialVideoAd?.present(from: from) { completion() }
    }
    
    public func connectDelegate(delegate: APSSPInterstitialVideoAdapterDelegate) {
        self.delegate = delegate
        self.adMobMediationInterstitialVideoAd?.load()
    }

    public func disconnectDelegate() {
        adMobMediationInterstitialVideoAd?.delegate = nil
        delegate = nil
    }
}


extension AdMobInterstitialVideoAdapter: APSSPInterstitialVideoAdapterDelegate {
    
    public func interstitialVideoLoadSuccess() {
        delegate?.interstitialVideoLoadSuccess()
    }
    
    public func interstitialVideoLoadFail(error: APSSPNetworkError, errorMessage: String?) {
        delegate?.interstitialVideoLoadFail(error: error, errorMessage: errorMessage)
    }
    
    public func interstitialVideoShowSuccess(message: String) {
        delegate?.interstitialVideoShowSuccess(message: message)
    }
    
    public func interstitialVideoShowFail(message: String) {
        delegate?.interstitialVideoShowFail(message: message)
    }
    
    public func interstitialVideoClicked(message: String) {
        delegate?.interstitialVideoClicked(message: message)
    }
    
    public func interstitialVideoClosed(message: String) {
        delegate?.interstitialVideoClosed(message: message)
    }
}
