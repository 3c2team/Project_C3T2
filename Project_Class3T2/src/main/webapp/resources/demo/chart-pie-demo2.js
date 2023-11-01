// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var selectOut = null;
$.ajax({
	type: "POST",
	url: "PayPro",
	data: {},
	success: function() {
		location.href="redirect:/PayPro"
	}
});

var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["교환/환불/반품 불만","개인정보 누출 우려","상품의 다양성/품질 불만","상품 가격 불만","배송 불만",],
    datasets: [{
      data: [selectOut.reson1 , selectOut.reson2, selectOut.reson2, selectOut.reson2, selectOut.reson2,selectOut.reson2,selectOut.reson2],
      backgroundColor: ['#0d6efd', '#ffc107', '#198754', '#6c757d','#6610f2','#212529'],
    }],
  },
});

	