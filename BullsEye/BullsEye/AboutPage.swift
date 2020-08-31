//
//  AboutPage.swift
//  BullsEye
//
//  Created by Nitin Yadav on 31/08/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        VStack{
            Text("🎯 Bull's Eye 🎯").fontWeight(.bold)
            Text("This is Bull's Eye").fontWeight(.semibold)
            Text("Hit the bar as close as possible to the Target").fontWeight(.semibold)
            Text("Enjoy the Game!").fontWeight(.semibold)
        }.navigationBarTitle("About Page")
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage().previewLayout(
        .fixed(width: 896, height: 414))
    }
}
