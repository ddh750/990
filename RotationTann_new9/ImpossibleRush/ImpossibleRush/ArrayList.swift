//
//  ArrayList.swift
//  ImpossibleRush
//
//  Created by Nguyen Dac Phuoc on 9/17/15.
//  Copyright (c) 2015 Game Developer. All rights reserved.
//

import Foundation
//sort(stk.item){ $0 > $1}
struct  ArrayList<T>{
    var item=[T]()
    mutating func add(_ item_:T){
        item.append(item_)
    }
    mutating func removeLast(){
        item.removeLast()
    }
    mutating func size()->Int{
        return  item.count
    }
    mutating func removeAll(){
        item.removeAll()
    }
    mutating func removeAtIndex(_ index:Int){
        if item.count>index{
            item.remove(at: index)
        }
    }
    mutating func get(_ index:Int)->T{
        
        return item[index]
    }
    mutating func insert(_ newElement: T, atIndex: Int){
        item.insert(newElement,at:atIndex)
    }
    
    
}
extension ArrayList{
    func descption()->String{
        return "\(self.item)"
    }
}
