({
    helperMethod : function() {
        
    },
    populateMetalsList : function(metalsMap) {
        var metalsList = [];
        for (var key in metalsMap) {
            var mapList = [];
            var innerMap = metalsMap[key];
            
            for (var innerKey in innerMap) {
                mapList.push({value:innerMap[innerKey], key:innerKey});
            }
            metalsList.push({value:mapList, key:key})
        }
        return metalsList;
    }
})