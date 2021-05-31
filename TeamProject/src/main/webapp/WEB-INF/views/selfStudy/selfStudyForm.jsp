<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>

<style>
  #sidebar {
    width: 250px;
    position: fixed;
    top: 0;
    left: -250px;
    height: 100%;
    z-index: 999;
    background: #333;
    color: #fff;
    transition: all 0.3s;
}
#sidebar.active {
    left: 0;
}

.overlay {
    position: fixed;
    width: 100vw;
    height: 100vh;
    background: rgba(0, 0, 0, 0.7);
    z-index: 998;
    display: none;
}
</style>

<script>
	$('#sidebarCollapse').on('click', function () {
    	$('#sidebar').addClass('active');
    	$('.overlay').fadeIn();
	});

	$('.overlay').on('click', function () {
    	$('#sidebar').removeClass('active');
    	$('.overlay').fadeOut();
	});

</script>

<div id="wrap">
     <nav id="sidebar"></nav>
     <button id="sidebarCollapse">토글</button> 
     <div class="overlay"></div>
</div>
