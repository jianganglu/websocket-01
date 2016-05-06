package com.jgl.socket;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/echo")
public class EchoSocket {
	
	public EchoSocket() {
		System.out.println("EchoSocket.EchoSocket()");
	}
	
	@OnOpen
	public void open(Session session) {
		// 一个session 代表一个通信会话
		System.out.println("sessionId:" + session.getId());
	}
	
	@OnClose
	public void close(Session session) {
		System.out.println("session:" + session.getId() + "关闭了。。。");
	}
	
	@OnMessage
	public void message(Session session, String msg) {
		System.out.println("客户端：" + msg);
		
		try {
			session.getBasicRemote().sendText("服务器：ni hao too");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
