//
//  RestaurantListView.swift
//  DangoPlate
//
//  Created by Jinyoung Yoo on 10/14/23.
//

import SwiftUI

struct RestaurantListView: View {
    @ObservedObject var restaurantListViewModel: RestaurantListViewModel

    var body: some View {
        ScrollView {
            RestaurantListOptionView(searchType: restaurantListViewModel.searchType)
            Divider()
            RestaurantListGridView(viewModel: restaurantListViewModel)
        }
        .scrollIndicators(.never)
    }
}

private struct RestaurantListOptionView: View {
    fileprivate var searchType: SearchType
    
    fileprivate var body: some View {
        HStack {
            Text("평점순")
                .foregroundStyle(.gray)
            Spacer()
            
            if (searchType == .nearyBy) {
                Button(action: {} , label: {
                    Image("500m")
                })
            }
            Button(action: {}, label: {
                Image("filter_noSelected")
            })
        }
        .frame(height: 20)
        .padding()
    }
}

// TODO: - 그리드 아이템끼리 간격 양 옆 패딩 간격이랑 맞추기!!!!1

private struct RestaurantListGridView: View {
    @ObservedObject var viewModel: RestaurantListViewModel

    fileprivate var body: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 20) {
            ForEach(viewModel.restaurantList.indices, id: \.self) { idx in
                RestaurantBasicInfoView(basicInfo: viewModel.restaurantList[idx], idx: idx + 1)
            }
        }
        .padding()
    }
}

private struct RestaurantBasicInfoView: View {
    let basicInfo: RestaurantBasicInfo
    let idx: Int

    fileprivate var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.gray)
                .overlay(alignment: .topTrailing) {
                    basicInfo.isWishList ? Image("like_selected") : Image("like_noSelected")
                }
            Group {
                Text("\(idx). \(basicInfo.place_name)")
                    .font(.system(size: 15, weight: .regular))
                Text(basicInfo.shortAddress)
                    .foregroundStyle(.gray)
                    .font(.system(size: 10, weight: .light))
                HStack(spacing: 1) {
                    Image(systemName: "pencil")
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    Text("\(basicInfo.numberOfReviews)")
                }
                .foregroundStyle(.gray)
                .font(.caption)
            }
        }
    }
}

#Preview {
    RestaurantListView(restaurantListViewModel: RestaurantListViewModel(restaurantList: DummyData.createDummyList(capacity: 20), searchType: .nearyBy))
}
