
// -------------------- < 메인 이미지 변경 이벤트 > --------------------
//미니 이미지 마우스 이벤트 -> 메인 이미지 변경
function changeImg(imgElement) {
	document.getElementById("main_img").setAttribute("src", imgElement.src);
}

//미니 이미지 리뷰 마우스 이벤트 -> 메인 이미지에 리뷰 나타내기
function changeImgOver() {
	document.all.main_img_review.style.visibility="visible";
}
function changeImgOut() {
	document.all.main_img_review.style.visibility="hidden";
}

// ---------------------------------------------------------------------

// -------------------- < 수량 버튼 > --------------------
$(document).ready(function() {	
	const amountsInput = $('#amounts');
	const productPrice = $('#productPrice').val();

	$("#delBtn").click(function() {
	    let currentValue = parseInt(amountsInput.val());
	    if (currentValue > 1) {
	        amountsInput.val(currentValue - 1);
	        updateTotal(currentValue - 1);
		}
	});
	
	$('#addBtn').click(function() {
	    let currentValue = parseInt(amountsInput.val());
	    amountsInput.val(currentValue + 1);
	    updateTotal(currentValue + 1);
	});
	
	amountsInput.on('input', function() {
	    let currentValue = parseInt(amountsInput.val());
	    updateTotal(currentValue);
	});
	
	function updateTotal(quantity) {
	    const totalPrice = productPrice * quantity;
	    $('#my_sum').text(totalPrice.toFixed(0));
	}
});
//--------------------------------------------------------

//-------------------------------------- < 문의글 클릭 이벤트 > --------------------------------------
document.addEventListener('DOMContentLoaded', function() {
    const questionElements = document.querySelectorAll('.questionInfo:not(.secretQuestion)');

    questionElements.forEach(question => {
        question.addEventListener('click', function() {
            const answerId = this.id.replace('question_', 'answer_');
            const answerBox = document.getElementById(answerId);

            if (answerBox.style.display === 'none' || answerBox.style.display === '') {
                answerBox.style.display = 'flex';
            } else {
                answerBox.style.display = 'none';
            }
        });
    });
});
//----------------------------------------------------------------------------------------------------

