<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">
					메인
				</div>
				<a class="nav-link" href="AdminSalesYear">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 매출정보
				</a>
				<a class="nav-link" href="AdminEventList">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 이벤트관리
				</a>
				<a class="nav-link" href="AdminNoticeBoard">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 공지관리
				</a>
				<div class="sb-sidenav-menu-heading">
					상품
				</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapsePages" aria-expanded="false"
					aria-controls="collapsePages">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book-open"></i>
					</div> 상품
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down">	</i>
					</div>
				</a>
				<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#pagesCollapseAuth" aria-expanded="false"
							aria-controls="pagesCollapseAuth"> 상품관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="AdminProductList">
									상품목록
								</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#pagesCollapseError" aria-expanded="false"
							aria-controls="pagesCollapseError"> 리뷰관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="AdminReviewDelete">리뷰삭제</a>
								<a class="nav-link" href="AdminQnaBoard">문의사항</a>
							</nav>
						</div>
					</nav>
				</div>
				<div class="sb-sidenav-menu-heading">회원</div>
				<a class="nav-link" href="AdminMember">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> 회원관리
				</a> 
				<a class="nav-link" href="AdminReservationList">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> 예약관리
				</a>
				<a class="nav-link" href="./">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> 홈페이지
				</a>
			</div>
		</div>
		<div class="sb-sidenav-footer">
			<div class="small">
				현재 접속한 관리자 : <br>${sessionScope.sName }님 환영합니다
			</div>
		</div>
	</nav>
</div>



