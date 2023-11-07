// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
$.ajax({
		type: "POST",
		url: "AdminSelectMonthDate",
		async: false,
		data: {
			year : 0
		},
		success: function(AdminSelectMonthDate) {
			mons = AdminSelectMonthDate.map(row => row.rnum);
			sales = AdminSelectMonthDate.map(row => row.sales);
		},
		error:function(){
			alert("실패");
		}
	});
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: mons,
    datasets: [{
      label: "Revenue",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data:sales,
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month	'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 12
        }
      }],
      yAxes: [{
        ticks: {
          min: 10000000,
          max: 50000000,
          maxTicksLimit: 12
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
