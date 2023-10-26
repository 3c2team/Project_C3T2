
function toggleStar(starIndex) {
    // 모든 별 버튼을 선택
    const stars = document.querySelectorAll('.star');
    
    stars.forEach((star, index) => {
    	if (index < starIndex) {
    		star.setAttribute('aria-checked', 'true');
    		star.classList.add('selected');
    	} else {
    		star.setAttribute('aria-checked', 'false');
    		star.classList.remove('selected');
    	}
    	
    });
}