//
//  LoadMoreView.swift
//  SSSSSSSSSSSSSSSSS
//
//  Created by hbz on 2019/11/25.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
struct LoadMoreView: View {
    private let contentSize = 20
    @State var page = 1
    var body: some View {
        List {
            ForEach(0..<self.page * contentSize,id : \.self) { num in
                Text("数据" + "\(num)").frame(height: 100)
            }
            Button(action: loadMore) {
                Text(self.page == 4 ? "已经到底啦" :  "")
            }
            .onAppear {
                DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 100)) {
                    self.loadMore()
                }
            }
        }
    }
    func loadMore() {
        if self.page < 4 {
            self.page += 1
            print("Load more..." + "\(page)")
        }
    }
}

struct LoadMoreView_Previews: PreviewProvider {
    static var previews: some View {
        LoadMoreView()
    }
}
