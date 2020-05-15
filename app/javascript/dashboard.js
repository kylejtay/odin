import onmount from "onmount";
import Chart from 'chart.js';

onmount('.billed-hourly-chart', function() {
  var ctx = document.querySelector('.billed-hourly-chart');
  var mixedChart = new Chart(ctx, {
      type: 'line',
      data: {
          datasets: [{
              label: 'Billed Hours',
              data: [10, 20, 30, 40],
              fill: 'origin',
              backgroundColor: 'rgba(42, 157, 143,0.8)'
          }, {
              label: 'Goal Hours',
              data: [50, 50, 50, 50],
              fill: false,
              borderColor: 'rgba(38, 70, 83, 1)'
          },
          {
              label: 'Forecast Hours',
              data: [25, 50, 25, 50],
              fill: false,
              borderColor: 'rgba(233, 196, 106, 1)'
          }],
          labels: ['January', 'February', 'March', 'April']
      }
  });
});
