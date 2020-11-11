//
//  GrobalProps.swift
//  QuickDateBeta
//
//  Created by Katsuhiko Yao on 2020/11/10.
//

import Foundation
import UIKit
import EventKit

var tapCount: Int = 0

var tapcountForYear : Int = 0

var tensNumber: Int = -1

var onesNumber: Int = -1

//var firstOnesNumber: Int = -1

//var secondOnesNumber: Int = -1

var dayNumber: Int = -1



func dateFromString(string: String, format: String)-> Date{
    let formatter: DateFormatter = DateFormatter()
    formatter.timeZone = TimeZone.current
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.dateFormat = format //wakaran
    return formatter.date(from: string)!
}

var searchDayString: String = "searchDayString"
var searchMonthString: String = "searchMonthString"
var searchYearString: String = "searchYearString"

var searchDate: Date = Date()//wakaran

func getDateEText(isToday: Bool)->String {
    let dayFormatter = DateFormatter()
    dayFormatter.timeZone = TimeZone.current
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: Locale.current)
    dayFormatter.locale = Locale.init(identifier: "en_JP")
    let todayE = Calendar.current.date(byAdding: .month, value: 0, to: searchDate)!
    let EText = dayFormatter.string(from: todayE)
    print(EText)
    return EText
}


//MARK get month1.text and month2 text
func getDateMonthText(isThisMonth: Bool) -> String {
    let monthFormatter = DateFormatter()
    monthFormatter.timeZone = TimeZone.current
    monthFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "M", options: 0, locale: Locale(identifier: "en_JP"))
    //add month from serchDate by tapcount
    let addingMonth = Calendar.current.date(byAdding: .month, value: tapCount, to: searchDate)!
    if (isThisMonth){
        let month1Text = monthFormatter.string(from: addingMonth)
        searchMonthString = month1Text
        return month1Text
    }else{
        var month2 = Int(monthFormatter.string(from: addingMonth))! + 1
        if ( month2 == 13){
            month2 = 1
        }else{
        }
        let month2Text = String(month2)
        return month2Text
    }
}

//MARK get yearText
func getDateyearText(isThisYear: Bool) -> String {
    tapcountForYear = tapCount
    let yearFomatter = DateFormatter()
    yearFomatter.timeZone = TimeZone.current
    yearFomatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy", options: 0, locale: Locale(identifier: "en_JP"))
    let addingMonth = Calendar.current.date(byAdding: .month, value: tapcountForYear,to: searchDate)!//wakaran
    if(isThisYear){
        let year1Text = yearFomatter.string(from: addingMonth)
        searchYearString = yearFomatter.string(from: addingMonth)
        return year1Text
    }else{
        print(tapcountForYear)
        tapcountForYear = tapcountForYear + 1
        print(tapcountForYear)
        
        let addingYear = Calendar.current.date(byAdding: .month, value: tapcountForYear, to: searchDate)!
        var year2 = Int(yearFomatter.string(from: addingYear))!
        let year2Text = String(year2)
        return year2Text
    }
}
