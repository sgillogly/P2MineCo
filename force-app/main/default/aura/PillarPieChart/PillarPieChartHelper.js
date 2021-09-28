({
	retrieveChartData : function(component) {
		var action = component.get("c.getChartData");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('--chartData--', response.getReturnValue());
                var chartData = response.getReturnValue();
                console.log(chartData);
                if(!$A.util.isEmpty(chartData)){
                    var chart1_Data = chartData[0];
                    var canvas1 = document.getElementById("colorCanvas")
                    var myChart1 = new Chart(canvas1, {
                        type: 'doughnut',
                        data: {
                            labels: chart1_Data.dataLabels,
                            datasets: [{
                                backgroundColor: ["#80ff00","#65c800","#438600"],
                                data: chart1_Data.dataValues,
                                hoverOffset: 200
                            }] 
                        },
                        options: {
                            maintainAspectRatio: false,
                            responsive: true,
                            legend: {
                                display: true,
                                position: "bottom",
                                labels: {
                                    fontColor: "#000000",
                                    fontSize: 12,
                                },
                            },
                            tooltips: {
                                displayColors: false,
                                bodyAlign: 'center',
                            	callbacks: {
        							beforeLabel: (toolTipItem, data) => {
                                        let beforeLabels = chart1_Data.dataText1;
            							return beforeLabels[toolTipItem.index];
       								},
        							label: (toolTipItem, data) => {
                                        let labels = chart1_Data.dataText2;
            							return labels[toolTipItem.index];
       								},
        							afterLabel: (toolTipItem, data) => {
                                        let afterLabels = chart1_Data.dataText3;
            							return afterLabels[toolTipItem.index];
       								},

                                },
                            },
                        },
                    });	
                }
            }
        });
        $A.enqueueAction(action);	
	}
})