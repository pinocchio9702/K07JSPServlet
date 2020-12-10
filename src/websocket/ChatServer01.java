package websocket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

/*
웹소켓 서버의 요청명 지정(ws://호스트:포트번호/컨텍스트루트/ChatServer01)
요쳥명은 꼭 파일명과 동일하지 않아도 된다. 경로만 다르지 않는다면 어떤걸 써도 무방하다.
 */
@ServerEndpoint("/ChatServer")
public class ChatServer01 {
	
	//클라이언트가 접속했을때 처리
	@OnOpen
	public void onOpen() {
		System.out.println("연결되었습니다...");
	}
	
	//클라이언트가 접속을 끊었을떄 처리
	@OnClose
	public void onClose() {
		System.out.println("종료되었습니다...");
	}
	
	//클라이언트로부터 메세지가 도착했을때 처리
	@OnMessage
	public String onMessage(String message) {
		/*
			클라이언트로부터 메세지가 도착하면 로그를 출력하고 
			다시 클라이언트로 Echo한다.
		*/
		System.out.println("Client메세지 : " + message);
		String echoMsg = "Server메세지 : " + message;
		return echoMsg;
	}
	
	//채팅중 에러가 발생했을떄 처리
	@OnError
	public void OnError(Throwable e) {
		e.printStackTrace();
	}
}
