function set_user_data_from_ajax() {
    call_my_ajax('get_services');
}

function get_statistics() {
    var utility_name = document.getElementById('notify_state').value,
        from_date = document.getElementsByName('fromDate')[0].value,
        toDate = document.getElementsByName('toDate')[0].value;

    $.ajax({
        type: "POST",
        url: "get_statistics",
        data: {
            submitButton : 'get_statistics',
            utility : utility_name,
            from_date : from_date,
            to_date : toDate,
            user_id : '13'
        },
        success: function (resp) {
            var amounts  = resp.split('&');
            console.log(amounts);
            print_chart(amounts, from_date.substr(0,4), toDate.substr(0,4));
        }
    });
}

function get_response(url, resp) {
    var set = resp.split('&');

        var elem = document.getElementById('notify_state');

        for (var i = 0; i < set.length - 1; i++) {
            var options = document.createElement('option');
            options.value = set[i];
            options.innerHTML = set[i];
            elem.appendChild(options);
        }
}

function call_my_ajax(url){
    $.ajax({
        type: "POST",
        url: url,
        data: {
            submitButton: url
        },
        success: function(response) {
            get_response(url, response);
        }
    });
};

function print_chart(amounts, from_date, to_date) {
    var years = [],
        minus_amount = to_date  - from_date;

    for(var i = 0; i <= amounts.length; i++){
        if (minus_amount == 0) {
            years.push(from_date);
        }
        else {
            years.push(from_date++);
        }
    }

    $(function() {
        'use strict';
        var data = {
            labels: years,
            datasets: [{
                label: '# of Votes',
                data: amounts,
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
};