<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	var ws;
	var target = 'ws://localhost:8090/websocket-chat/echo';
	
	function subOpen() {
		if ('WebSocket' in window) {
            ws = new WebSocket(target);
        } else if ('MozWebSocket' in window) {
            ws = new MozWebSocket(target);
        } else {
            alert('WebSocket is not supported by this browser.');
            return;
        }

        ws.onmessage = function(event) {
			var dv = document.getElementById('dv');
			dv.innerHTML += event.data;
        }
	}

	function subSend() {
		var msg = document.getElementById('msg').value;
		ws.send(msg);

		document.getElementById('msg').value = '';
	}
</script>
</head>
<body>
  
  <button onclick="subOpen()">open</button>
  <input id="msg">
  <button onclick="subSend()">send</button>
  <div id="dv"></div>
</body>
</html>