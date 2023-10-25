// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["교환/환불/반품 불만","아이디 변경을 위해 탈퇴 후 재가입","장기간 부재(군입대, 유학 등)","개인정보 누출 우려","상품의 다양성/품질 불만","상품 가격 불만","배송 불만",],
    datasets: [{
      data: [15, 15.58, 11.25, 8.32, 10,12,10],
      backgroundColor: ['#0d6efd', '#ffc107', '#198754', '#6c757d','#6610f2','#212529','#dc3545'],
    }],
  },
});
