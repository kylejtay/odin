import onmount from "onmount";
import Chart from 'chart.js';

onmount('.billed-hourly-chart', function() {
  var ctx = document.querySelector('.billed-hourly-chart');
  var mixedChart = new Chart(ctx, {
      type: 'line',
      data: {
          datasets: [{
              label: 'Billed Hours',
              data: JSON.parse(ctx.dataset.weeklyBilled),
              fill: 'origin',
              backgroundColor: 'rgba(94, 159, 75, .9)'
          }, {
              label: 'Total Hours Worked',
              data: JSON.parse(ctx.dataset.totalHoursWorked),
              fill: false,
              borderColor: 'rgba(23, 95, 195,.9)'
          }, {
              label: 'Goal Hours',
              data: JSON.parse(ctx.dataset.weeklyGoalHours),
              fill: false,
              borderColor: 'rgb(0, 255, 51, .9)'
          },
          {
              label: 'Forecast Hours',
              data: JSON.parse(ctx.dataset.totalHoursForecasted),
              fill: false,
              borderColor: 'rgba(255, 139, 30, .9)'
          }],
          labels: JSON.parse(ctx.dataset.xAxis)
      }
  });
});
