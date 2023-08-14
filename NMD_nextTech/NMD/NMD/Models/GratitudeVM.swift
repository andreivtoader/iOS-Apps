//
//  GratitudeMV.swift
//  NMD
//
//  Created by Andrei Toader on 12.08.2023.
//

import Foundation
import SwiftDate

class GratitudeVM : ObservableObject {
    
    private let apiService = MockAPIClient()
    
    @Published var thisWeekGratitudes = [DailyGratitude]()
    @Published var lastMonthGratitudes = [DailyGratitude]()
    
    init() {
        apiService.fetchGratitudes { result in
            switch result {
            case .success(let data):
                self.updateDailyGratitudes(data: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateDailyGratitudes(data: [GratitudeJSON]) {
        let allGratitudes = data.map {
            if let first = $0.images?.first, let url = URL(string: first) {
                return DailyGratitude(summary: $0.summary, date: $0.date, imageURL: url, tags: $0.tags)
            } else {
                return DailyGratitude(summary: $0.summary, date: $0.date, tags: $0.tags)
            }
        }
        
        // update published properties to be refreshed in UI
        DispatchQueue.main.async {
            self.thisWeekGratitudes = allGratitudes.filter { $0.date.compare(.isThisWeek) }
            self.lastMonthGratitudes = allGratitudes.filter { $0.date.compare(.isLastMonth) }
        }
    }
    
    func delete(entry: DailyGratitude) {
        thisWeekGratitudes.removeAll { $0 == entry }
        lastMonthGratitudes.removeAll { $0 == entry }
    }
    
    func add(entry: DailyGratitude) {
        let entryIsThisWeek = entry.date.compare(.isThisWeek)
        let entryIsLastMonth = entry.date.compare(.isLastMonth)
        
        if entryIsThisWeek {
            thisWeekGratitudes.append(entry)
        }
        
        if entryIsLastMonth {
            lastMonthGratitudes.append(entry)
        }
    }
}
