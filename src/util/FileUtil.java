package util;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil {
	public static MultipartRequest upload(
			HttpServletRequest req, String saveDirectory) {
			
		MultipartRequest mr = null;
		/*
		매개변수1 : 사용자의 요청 정보가 저장된 request내장객체
		매개변수2 : 파일이 저장된 서버의 물리적 경로
		그외 업로드할 파일의 최대 용량, 인코딩방식, 파일명 중복처리를 위한 클래스를
		통해 MultipartRequest객체를 생성한다.
		객체생성이 완료되면 파일 업로드된다.
		 */
		try {
			mr = new MultipartRequest(req,
					saveDirectory,
					1024*1024,
					"UTF-8",
					new DefaultFileRenamePolicy());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return mr;
	}
}
