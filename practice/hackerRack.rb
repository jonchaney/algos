def verifyItems(origItems, origPrices, items, prices)
    count = 0
    origItemsHash = {}
    itemsHash = {}

    # create hash for origItems
    origItems.each_with_index do |item, idx| 
        origItemsHash[item] = origPrices[idx]
    end 

    # count number of item prices that are different
    items.each_with_index do |item, idx|
        if origItemsHash[item] != prices[idx] 
            count += 1
        end 
    end 
    count
end


p verifyItems(["rice", "sugar", "wheat", "cheese"],[5,6,7,8],["rice","wheat"],[10,11])