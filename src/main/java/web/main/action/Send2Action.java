package web.main.action;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

public class Send2Action implements Action{
        @Override
        public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
            //이메일을 보내기 전에 이메일이 중복되는지 확인
            //이메일이 중복되면 이메일을 보내지 않고, return을 돌려서 경고창 띄움
            String email = request.getParameter("email");
            String result = null;
            //이메일 인증을 위한 코드를 생성

            String possibleCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder code = new StringBuilder();
            for (int i = 0; i < 6; i++) {
                int randomIndex = (int) (Math.random() * possibleCharacters.length());
                code.append(possibleCharacters.charAt(randomIndex));
            }

            System.out.println("code : " + code);

            //보낸 이메일의 인증번호와 code를 비교하기 위해 session에 저장
            request.getSession().setAttribute("code", code);
            //현재 시간도 같이 보냄
            request.getSession().setAttribute("codeTime", System.currentTimeMillis());

            //이메일을 보내기 위한 smtp 설정
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");			// 구글 메일로 보냄 (보내는 메일은 구글메일만 가능)
            props.put("mail.smtp.port", "587");					// 구글 메일로 보내는 포트 번호
            props.put("mail.smtp.auth", "true");					// 인증된 메일
            props.put("mail.smtp.starttls.enable","true");      // 보안 설정
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");	// 보안 설정
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");		// 보안 설정


            //구글 서버와 ssl 통신이 되지 않을 경우 추가

            //이메일을 보내기 위한 세션 생성
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("dlflqhfl@gmail.com", "yewwbuxuzdvuksya");
                }
            });

            try {
                //이메일을 보내기 위한 메시지 생성
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress("dlflqhfl@gmail.com", "(주)OMAKASE", "UTF-8"));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject("오마카세 시네마 인증 요청 메일입니다");
                message.setContent("인증번호는 <strong>" + code + "</strong>입니다.", "text/html; charset=UTF-8");

                //이메일을 보내기
                Transport.send(message);
            } catch (AddressException e) {
                throw new RuntimeException(e);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

            return null;
        }
}
