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

const data = {
    labels: labels,
    datasets: [{
            label: 'Event',
            fill: events,
            backgroundColor: CHART_COLORS.blue,
            borderColor: CHART_COLORS.blue,
            data: events,
        },
        {
            label: 'Calendar',
            backgroundColor: CHART_COLORS.red,
            borderColor: CHART_COLORS.red,
            data: calendars,
            fill: true,
        }
    ]
};


const config = {
    type: 'line',
    data: data,
    options: {
        responsive: true,
        plugins: {
            title: {
                display: true,
                text: 'Calendar'
            },
        },
        interaction: {
            mode: 'index',
            intersect: false
        },
        scales: {
            x: {
                display: true,
                title: {
                    display: true,
                    text: 'Month'
                }
            },
            y: {
                display: true,
                title: {
                    display: true,
                    text: 'Value'
                }
            }
        }
    },
};


const myChart = new Chart(document.getElementById('mainChart'), config);


var colors = Object.values(CHART_COLORS);
listCategoryColor = listCategoryLabel.map((item, index) => {
    return colors[index%colors.length];
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

const dataUser = {
  labels: labels,
  datasets: [
    {
      label: 'Dataset 1',
      data: users,
      borderColor: CHART_COLORS.red,
      backgroundColor: CHART_COLORS.red,
    },
  ]
};

const configUser = {
  type: 'bar',
  data: dataUser,
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: 'User'
      }
    }
  }
};


const userChart = new Chart(document.getElementById('userChart'), configUser);
