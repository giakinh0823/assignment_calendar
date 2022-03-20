CHART_COLORS = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    blue: 'rgb(54, 162, 235)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(201, 203, 207)'
};

const labels = [
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12',
];



var options = {
    series: [{
            name: 'Calendar',
            type: 'column',
            data: calendars
        }, {
            name: 'Events',
            type: 'area',
            data: eventCalendars
        }],
    chart: {
        height: 850,
        type: 'line',
        stacked: false,
    },
    stroke: {
        width: [0, 2, 5],
        curve: 'smooth'
    },
    plotOptions: {
        bar: {
            columnWidth: '50%'
        }
    },

    fill: {
        opacity: [0.85, 0.25, 1],
        gradient: {
            inverseColors: false,
            shade: 'light',
            type: "vertical",
            opacityFrom: 0.85,
            opacityTo: 0.55,
            stops: [0, 100, 100, 100]
        }
    },
    labels: labels,
    markers: {
        size: 0
    },
    xaxis: {
        type: 'string'
    },
    yaxis: {
        title: {
            text: 'Points',
        },
        min: 0
    },
    tooltip: {
        shared: true,
        intersect: false,
        y: {
            formatter: function (y) {
                if (typeof y !== "undefined") {
                    return y.toFixed(0) + " points";
                }
                return y;

            }
        }
    }
};

var chart = new ApexCharts(document.querySelector("#chart"), options);
chart.render();


var optionsUser = {
    series: [{
            name: "User",
            data: users
        }],
    chart: {
        type: 'area',
        height: 550,
        zoom: {
            enabled: false
        }
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        curve: 'straight'
    },

    title: {
        text: 'User',
        align: 'left'
    },
    subtitle: {
        text: 'Register user',
        align: 'left'
    },
    labels: labels,
    xaxis: {
        type: 'string',
    },
    yaxis: {
        opposite: true
    },
    legend: {
        horizontalAlign: 'left'
    }
};



var chartUser = new ApexCharts(document.querySelector("#chartUser"), optionsUser);
chartUser.render();

var optionsCategory = {
    series: listCategoryQuantity,
    chart: {
        width: 380,
        type: 'pie',
    },
    labels: listCategoryLabel,
    responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
};

var chartCategory = new ApexCharts(document.querySelector("#chartCategory"), optionsCategory);
chartCategory.render();


var colors = Object.values(CHART_COLORS);



var colors = Object.values(CHART_COLORS);
listCategoryColor = listCategoryLabel.map((item, index) => {
    return colors[index % colors.length];
})

const dataCategory = {
    labels: listCategoryLabel,
    datasets: [
        {
            label: 'Category',
            data: listCategoryQuantity,
            backgroundColor: listCategoryColor,
        }
    ]
};

const configCategory = {
    type: 'polarArea',
    data: dataCategory,
    options: {
        responsive: true,
        scales: {
            r: {
                pointLabels: {
                    display: true,
                    centerPointLabels: true,
                    font: {
                        size: 18
                    }
                }
            }
        },
        plugins: {
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: 'Category'
            }
        }
    },
};


const categoryChart = new Chart(document.getElementById('categoryChart'), configCategory);
categoryChart.canvas.parentNode.style.height = '728px';
categoryChart.canvas.parentNode.style.width = '70%';