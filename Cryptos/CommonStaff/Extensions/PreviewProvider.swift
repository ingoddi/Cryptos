//
//  PreviewProvider.swift
//  Cryptos
//
//  Created by Иван Карплюк on 14.09.2023.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(id: "tbtc", symbol: "tbtc", name: "tBTC", image: "https://assets.coingecko.com/coins/images/11224/large/0x18084fba666a33d37592fa2633fd49a74dd93a88.png?1674474504", currentPrice: 254, marketCap: 3299448843, marketCapRank: 480, fullyDilutedValuation: 3299448843, totalVolume: 51510677, high24H: 255, low24H: 250, priceChange24H: 40374, priceChangePercentage24H: 1.6111, marketCapChange24H: 50666106, marketCapChangePercentage24H: 1.55954, circulatingSupply: 1295.75376877, totalSupply: 1295.75376877, maxSupply: nil, ath: 10206266, athChangePercentage: -75.09376, athDate: "2022-05-09T17:35:11.974Z", atl: 262874, atlChangePercentage: 867.00103, atlDate: "2022-12-28T03:14:18.480Z", lastUpdated: "2023-09-14T14:11:37.068Z", sparklineIn7D: SparklineIn7D(price: [
        25596.175254571524,
        25680.62536714921,
        25674.63932023653,
        25687.03398216538,
        25733.897055542722,
        25812.44648397528,
        25783.921489611384,
        25788.849269581646,
        25838.378853429454,
        25997.024677474514,
        26194.09130315431,
        26046.28045962703,
        26216.19084551032,
        26097.43691262513,
        26069.818220083547,
        26151.047331405865,
        26207.78895205085,
        26136.344442947233,
        26116.28845676615,
        26139.436145551197,
        26118.236840459598,
        25977.15862516502,
        25756.716246351632,
        25737.848242386146,
        25781.28702815841,
        25854.18345372536,
        25759.68965323242,
        25781.85026257528,
        25701.050014584413,
        25792.534093100163,
        25751.202202181827,
        25870.20799066594,
        25906.01633710623,
        25896.039968945075,
        25888.77061790863,
        25894.900896489922,
        25863.833563564018,
        25786.177186492827,
        25791.58900396568,
        25727.17661620156,
        25865.341269189124,
        25852.37508389305,
        25850.68486471179,
        25878.486885944254,
        25885.30552840288,
        25891.19895789361,
        25862.011797523566,
        25881.898080603696,
        25886.728996760794,
        25795.985670071346,
        25835.921089656604,
        25939.75479314449,
        25911.954203177193,
        25885.559264724543,
        25876.747026352874,
        25777.162674721094,
        25787.34508424614,
        25784.32759032976,
        25763.236540590304,
        25745.127070210445,
        25699.25706200884,
        25692.28317268351,
        25748.694990861866,
        25761.20466784492,
        25663.201057875613,
        25791.75963789326,
        25852.468001009045,
        25790.605491797403,
        25742.666717048807,
        25752.274445310846,
        25709.913335516812,
        25755.156661591962,
        25738.689366005896,
        25770.877613691777,
        25702.334265705813,
        25628.08864533501,
        25669.941142826377,
        25588.06959410239,
        25651.52429143814,
        25648.056131905116,
        25762.23590740067,
        25780.626740880813,
        25739.478227893433,
        25720.216717014562,
        25601.190423385728,
        25580.474158515324,
        25622.607880865806,
        25669.17251022561,
        25765.29982762283,
        25788.71996044635,
        25782.162224979245,
        25758.211538339354,
        25685.41328774093,
        25492.3977282783,
        25549.174997626422,
        25486.358711943958,
        25631.137535232003,
        25617.44248185566,
        25100.76470689997,
        25104.196536882042,
        25101.966005025824,
        25116.745904574607,
        25129.005805149325,
        24896.508228418432,
        24985.292822005184,
        24998.416500373827,
        25039.67699904625,
        25056.64053569097,
        25077.53808638128,
        25081.846727161545,
        25127.633992480456,
        25670.06368366641,
        25707.41465739155,
        25745.790883217793,
        25695.83622376029,
        25746.62489565116,
        25658.858828821452,
        25738.7010111551,
        25992.38119792232,
        26028.314496917355,
        25976.624107875134,
        26049.316309207057,
        25940.22235222856,
        26072.989194094884,
        26037.473233034732,
        25956.462168844366,
        25952.72992916669,
        26020.53833129601,
        26025.800337243683,
        26046.98890458535,
        25975.924182971696,
        25899.546398575014,
        25962.24643138112,
        25906.01454497455,
        25863.846241882457,
        25737.016912896168,
        25784.184066486185,
        25731.41741627957,
        25857.49920652194,
        25807.474322747697,
        25927.055144131613,
        26052.951522989093,
        26027.12903060701,
        26073.51888920553,
        26079.193025336288,
        26062.72536827751,
        26203.141496634496,
        26175.334102020275,
        26207.199010874025,
        26110.776257220456,
        26085.088646978915,
        26135.61468930035,
        26153.979675582963,
        26149.002077951136,
        26185.082598233126,
        26205.186105337532,
        26380.42864698237,
        26289.288241284758,
        26297.17702836036,
        26331.50064476773,
        26171.548671757984,
        26119.602405051894,
        26215.22161485713,
        26273.67238930692,
        26210.78430800495,
        26229.413783842778,
        26232.663964925585,
        26331.9912070852
    ]), priceChangePercentage24HInCurrency: 1.6111025243701276, currentHoldings: 1.5)
}