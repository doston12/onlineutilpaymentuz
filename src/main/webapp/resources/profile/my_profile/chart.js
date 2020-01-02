$(function() {

  'use strict';
  var data = {
    labels: ["2013", "2014", "2014", "2015", "2016", "2017", "2018", "2019"],
    datasets: [{
      label: '# of Votes',
      data: [10, 19, 3, 5, 2, 3, 10, 3],
      backgroundColor: ['rgba(255, 99, 132, 0.2)'],
      borderColor: ['rgba(255,99,132,1)'],
      borderWidth: 1
    }]
  };
  var options = {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    },
    legend: {
      display: false
    },
    elements: {
      point: {
        radius: 0
      }
    }

  };
  // Get context with jQuery - using jQuery's .get() method.
  if ($("#lineChart").length) {
    var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
    var lineChart = new Chart(lineChartCanvas, {
      type: 'line',
      data: data,
      options: options
    });
  }

});