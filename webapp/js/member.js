/**Updated 2021.08.09 오전 10:20
 * 
 */
	function popuplogin() {
		var width = $('#memlogin').width();
		$('#memlogin').css({
			'left' : ($(window).width() - width) / 2
		});	
		document.getElementById('dimmed').style.display = "block";
		document.getElementById('memlogin').style.display = "block";
	}
	
	function closelogin() {
		document.getElementById('dimmed').style.display = "none";
		document.getElementById('memlogin').style.display = "none";
	}
	
	function popupjoin() {
		var width = $('#memjoin').width();
		$('#memjoin').css({
			'left' : ($(window).width() - width) / 2
		});	
		document.getElementById('dimmed').style.display = "block";
		document.getElementById('memjoin').style.display = "block";
	}
	
	function closejoin() {
		document.getElementById('dimmed').style.display = "none";
		document.getElementById('memjoin').style.display = "none";
	}
	
	function popupinfo() {
		var width = $('#meminfo').width();
		$('#meminfo').css({
			'left' : ($(window).width() - width) / 2
		});	
		document.getElementById('dimmed').style.display = "block";
		document.getElementById('meminfo').style.display = "block";
	}
	
	function closeinfo() {
		document.getElementById('dimmed').style.display = "none";
		document.getElementById('meminfo').style.display = "none";
	}