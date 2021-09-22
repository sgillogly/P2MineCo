({
    helperMethod : function() {
        
    },
    
    populateDatasets : function(metalsMap) {
        var dataSets = [];
        var colors = ['rgb(200, 200, 00)',
                     'rgb(200, 200, 200)',
                     'rgb(50, 200, 50)',
                     'rgb(200, 100, 00)',
                     'rgb(200, 00, 200)',
                     'rgb(200, 00, 00)',
                     'rgb(00, 00, 00)',
                     'rgb(00, 200, 200)',
                     'rgb(50, 50, 200)',
                     'rgb(150, 00, 50)'
                     ];
        var currentColor = 0;
        
        for (var key in metalsMap) {
            var innerMap = metalsMap[key];
            var data = [];
            
            for (var innerKey in innerMap) {
                data.splice(0, 0, innerMap[innerKey]);
            }
            
        var label = key;
        
        dataSets.push({
                    label: label,
                    data: data,
                    fill: false,
                    tension: 0,
            		backgroundColor: colors[currentColor],
            		borderColor: colors[currentColor]
                });
        currentColor += 1;
        }
        return dataSets;
    },
    
    populateLabels : function(numberMonths) {
        var labels = [];
        var months = ['Jun',
                      'May',
                      'Apr',
                      'Mar',
                      'Feb',
                      'Jan',
                      'Dec',
                      'Nov',
                      'Oct',
                      'Sep',
                      'Aug',
                      'Jul'
                     ]
        for (var i = 0; i < numberMonths; i++) {
            var currentMonth = i;
            while (currentMonth > 11) {
                currentMonth = currentMonth - 12;
            }
        	labels.splice(0, 0, months[currentMonth]);
        }
        return labels;
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