({
     /*getData : function(component, callout, numRows) {
        let data = callout;
        data.setParams({rowsInput: numRows});
        data.setCallback(component, function(response) {
            var metalsMap = response.getReturnValue();
            helper.chartSetup(component, metalsMap);
        })
        
        $A.enqueueAction(data);
    },*/
    
    chartSetup : function(component, metalsMap) {
        //number of date/price pairs in each of the metal maps
        var numRows = Object.keys(metalsMap[Object.keys(metalsMap)[0]]).length;
        
        var element = component.find("chart").getElement();
        var ctx = element.getContext("2d");
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: this.populateLabels(numRows),
                datasets: this.populateDatasets(metalsMap)
            }, 
            options: {
                responsive: false
            }
        });
        component.set("v.content", "complete");
    },
    
    
    
     populateLabels : function(numberMonths) {
        var labels = [];
        var months = this.months();
        for (var i = 0; i < numberMonths; i++) {
            var currentMonth = i;
            while (currentMonth > 11) {
                currentMonth = currentMonth - 12;
            }
            labels.splice(0, 0, months[currentMonth]);
        }
        return labels;
    },
    
    populateDatasets : function(metalsMap) {
        var dataSets = [];
        var colors = this.colors();
        var currentColor = -1;
        
        for (var metal in metalsMap) {
            var prices = metalsMap[metal];
            
            var data = this.ascendingList(prices);
            var label = metal;
            currentColor += 1;
            
            dataSets.push({
                label: label,
                data: data,
                fill: false,
                tension: 0,
                backgroundColor: colors[currentColor],
                borderColor: colors[currentColor]
            });
        }
        return dataSets;
    },
    
    ascendingList : function(prices) {
            var data = [];
            for (var date in prices) {
                data.splice(0, 0, prices[date]);
            }
			return data
    },

    
    
    
	colors : function() {
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
        return colors;
    },    
    
    months : function() {
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
        return months;
    },    
   
    
    
    
    
    
    
    //deprecated
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