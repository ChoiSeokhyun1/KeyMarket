package com.fc.controller;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fc.dto.member_TableDto;
import com.fc.dto.qqq_TableDto;
import com.fc.dto.notice_TableDto;
import com.fc.service.idCheckDuplicateService;
import com.fc.service.idFindService;
import com.fc.service.mostqService;
import com.fc.service.noticeService;
import com.fc.service.impl.idCheckDuplicateServiceImpl;
import com.fc.service.impl.idFindServiceImpl;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Controller
public class main {
	
	@Autowired
    private idCheckDuplicateService idCheckDuplicateService;
	
	@Autowired
    private noticeService noticeService;
	
	@Autowired
    private idFindService idFindService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private mostqService mostqService;
	
	
	//메인 페이지 접근
	@RequestMapping("/main")
	public String getMainPage() {

		return "main";
	}
	
	//회원가입 페이지 접근(아이디,비번 etc)
	@RequestMapping("/member_Join")
	public String getmember_Join(@RequestParam(name = "checkbox4-1-1", required = false, defaultValue = "off") String checkSMS,
	                             @RequestParam(name = "checkbox4-1-2", required = false, defaultValue = "off") String checkEMAIL,
	                             Model model) {
		// 받은 값들을 모델에 저장
	    model.addAttribute("termsSms", checkSMS);
	    model.addAttribute("termsEmail", checkEMAIL);
		
	    return "member_Join";
	}
	
	//회원가입 페이지 접근 (약관)
	@RequestMapping("/member_Join2")
	public String getmember_Join2() {
		
		return "member_Join2";
	}

	
	//아이디 중복여부 검사
	@RequestMapping("/idCheckDuplicate")
    @ResponseBody
    public String idCheckDuplicate(@RequestParam String loginId) {
        int isDuplicate = idCheckDuplicateService.checkDuplicateId(loginId);

        if (isDuplicate == 0) {
            // 중복 아이디인 경우
            return "1";
        } else {
            // 중복이 아닌 경우
            return "0";
        }
    }
	
	//회원가입 완료(DB저장)
	@PostMapping("/member_Joinn")
	public String getmember_Join_C(member_TableDto member_tabledto) {

	    idCheckDuplicateService.member_insert(member_tabledto);
	    
	    return "main";
	}
	
	//로그인 페이지()
	@RequestMapping("/member_Login")
	public String member_Login() {

            return "member_Login";
	}
	
	//아이디 찾기 페이지
	@RequestMapping("/member_idFind")
	public String member_idFind() {
		
		return "member_idFind";
	}
	
	//아이디 찾기 결과 페이지
	@RequestMapping("/member_idFindResult")
	public String member_idFindResult(member_TableDto member_tabledto, Model model) {
	    try {
	        String foundId = idFindService.idFindEmailService(member_tabledto);

	        if (foundId != null) {
	            model.addAttribute("foundId", foundId);
	            return "member_idFindResult";
	        } else {
	            model.addAttribute("error", "결과를 찾을 수 없습니다.");
	            return "member_idFind";
	        }
	    } catch (Exception e) {
	        model.addAttribute("error", "예외적인 오류가 발생했습니다. 문의 부탁드립니다."); // 예외 발생 시 오류 메시지 저장
	        return "member_idFind";
	    }
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping("/member_pwFind")
	public String member_pwFind() {
		
		return "member_pwFind";
	}
	
	//비밀번호 찾기 프로세스
	@RequestMapping("/member_pwFindResult")
    public String member_pwFindResult(member_TableDto member_tabledto) {
		Map<String, Object> foundPw = idFindService.pwFindEmailService(member_tabledto);
        
        String loginPw = (String) foundPw.get("LOGINPW"); // 회원 현재 비밀번호
        String email2 = (String) foundPw.get("EMAIL2"); // 이메일주소
        
        try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    messageHelper.setFrom("posum77667@gmail.com"); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
		    messageHelper.setTo(email2); // 받는사람 이메일
		    messageHelper.setSubject("[KEYMARKET] 회원님의 비밀번호입니다."); // 메일제목
		    messageHelper.setText("회원님의 기존 비밀번호는 " + "[ " + loginPw + " ]" + " 입니다."); // 메일 내용
 
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        return "member_Login";
        
    }

	//공지사항 페이지 접근
	@RequestMapping("/member_Notice")
	public String member_Notice(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
	    int pageSize = 10; // 한 페이지에 보여줄 게시글 수
	    List<notice_TableDto> noticeList = noticeService.getNoticeList(page);

	    model.addAttribute("noticeList", noticeList);
	    
	    // 현재 페이지와 전체 페이지 수를 모델에 추가
	    model.addAttribute("currentPage", page);
	    //model.addAttribute("totalPages", (int) Math.ceil((double) noticeList.size() / pageSize));
	    model.addAttribute("totalPages", 3);
	    
	    return "member_Notice";
	}
	
	
	//자주묻는 질문 페이지 접근
		@RequestMapping("/member_MostQ")
		public String member_MostQ(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
		    int pageSize = 5; // 한 페이지에 보여줄 게시글 수
		    List<qqq_TableDto> mostqList = mostqService.getMostqList();
		    
		    int startIdx = (page - 1) * pageSize;
		    int endIdx = Math.min(startIdx + pageSize, mostqList.size());
		    
		    List<qqq_TableDto> pageMostqList = mostqList.subList(startIdx, endIdx);
		    
		    model.addAttribute("mostqList", pageMostqList);
		    
		    // 현재 페이지와 전체 페이지 수를 모델에 추가
		    model.addAttribute("currentPage", page);
		    model.addAttribute("totalPages", (int) Math.ceil((double) mostqList.size() / pageSize));
		    
		    return "member_MostQ";
		}
	
	
	
	
	@RequestMapping("/member_LoginOK")
	public String member_Login(member_TableDto member_tabledto, RedirectAttributes redirectAttributes) {
	    int loginCheck = idCheckDuplicateService.loginCheck(member_tabledto);

	    if (loginCheck == 1) {
	        session.setAttribute("userId", member_tabledto.getLoginId()); // 사용자 ID를 세션에 저장

	        if ("admin".equals(member_tabledto.getLoginId())) {
	            // 만약 아이디가 "admin"이라면
	            session.setAttribute("admins2", 0); // 세션에 "admins2" 변수에 0 저장
	        } else {
	        	session.setAttribute("admins2", 1); // 세션에 "admins2" 변수에 0 저장
	        }
	        redirectAttributes.addFlashAttribute("message", "로그인이 완료 되었습니다.");
	        return "redirect:/main";
	        
	    } else {
	        // 로그인 실패한 경우 (아이디, 패스워드 불일치)
	        // 리다이렉트 URL을 지정하고 실패 메시지를 전달합니다.
	        redirectAttributes.addFlashAttribute("message", "아이디 또는 패스워드가 올바르지 않습니다.");
	        return "redirect:/member_Login"; // 로그인 페이지로 리다이렉트
	    }
	}
	
	 @GetMapping("/logout")
	    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
	        // 세션을 해제합니다.
	        session.invalidate();
	        
	        // 로그아웃 후의 작업을 수행하려면 추가 코드를 여기에 작성하세요.
	        redirectAttributes.addFlashAttribute("message", "로그아웃이 완료 되었습니다.");
	        
	        return "redirect:/main"; // 로그아웃 후에 홈페이지 또는 다른 페이지로 리다이렉트할 수 있습니다.
	    }
	 
		@RequestMapping("/writeBoard")
		public String writeBoard() {
			// 데이터베이스에서 notice_tableDto와 일치하는 데이터를 찾습니다.
		    
			return "writeBoard";
		}
		
		@RequestMapping("/writeBoardMostQ")
		public String writeBoardMostQ() {
			// 데이터베이스에서 notice_tableDto와 일치하는 데이터를 찾습니다.
			
			return "writeBoardMostQ";
		}

		@PostMapping("/writeProcess")
		public String writeProcess(notice_TableDto notice_tableDto) {
		        noticeService.notice_insert(notice_tableDto);
		       
		    return "redirect:/writeBoard";
		}
		
		@PostMapping("/writeProcess2")
		public String writeProcess2(qqq_TableDto qqq_tableDto) {
		        mostqService.mostq_insert(qqq_tableDto);
		       
		    return "redirect:/writeBoardMostQ";
		}
		
		@PostMapping("/notice_Update")
		public String noticeUpdate(
				notice_TableDto notice_tableDto,
			    Model model) {
			
		    // POST 요청으로 전달된 데이터를 처리합니다.
			model.addAttribute("notice_tableDto", notice_tableDto);
		    
		    return "updateBoard"; // 이동할 페이지 이름
		}
		
		@GetMapping("/notice_Update")
		public String noticeUpdate() {
			
		    return "updateBoard"; // 이동할 페이지 이름
		}
		
		@PostMapping("/updateProcess")
		public String updateProcess(notice_TableDto notice_tableDto) {

		    noticeService.notice_update(notice_tableDto);

		    return "updateBoard";
		}
		
		
		@PostMapping("/mostq_Update")
		public String mostqUpdate(qqq_TableDto qqq_tableDto, Model model) {
			
		    // POST 요청으로 전달된 데이터를 처리합니다.
			model.addAttribute("qqq_tableDto", qqq_tableDto);
		    
		    return "updateBoardMostQ"; // 이동할 페이지 이름
		}
		
		@GetMapping("/mostq_Update")
		public String mostqUpdate() {
			
		    return "updateBoardMostQ"; // 이동할 페이지 이름
		}
		
		@PostMapping("/updateProcessMostQ")
		public String updateProcessMostQ(qqq_TableDto qqq_tableDto) {

		    mostqService.mostq_update(qqq_tableDto);

		    return "updateBoardMostQ";
		}
		
		
		@PostMapping("/notice_Delete")
		public String deleteProcess(notice_TableDto notice_tableDto) {
			
			noticeService.notice_delete(notice_tableDto);
			
			return "redirect:/member_Notice";
		}
		
		@PostMapping("/mostq_Delete")
		public String deleteProcessMostQ(qqq_TableDto qqq_tableDto) {
			
			mostqService.mostq_delete(qqq_tableDto);
			
			return "redirect:/member_MostQ";
		}
			
		@RequestMapping("/viewBoard/{noticeboardNo}")
		public String handleNoticeClick(@PathVariable("noticeboardNo") int noticeboardNo, 
				notice_TableDto notice_tableDto, Model model) {
		    // POST 요청으로 전달된 데이터를 처리합니다.
		    
		    notice_TableDto foundNotice = noticeService.foundNoticeService(notice_tableDto);
		    
	        if (foundNotice != null) {
	            // 검색된 게시글을 모델에 추가
	            model.addAttribute("foundNotice", foundNotice);
	        } else {
	            // 게시글을 찾지 못한 경우에 대한 처리
	        }
		    
	        return "viewBoard";
		}
		
		@RequestMapping("/viewBoard2")
		public String handleNoticeClick2(@RequestParam("noticeboardNo") int noticeboardNo, Model model) {
		    // POST 요청으로 전달된 데이터를 처리합니다.
		    
		    notice_TableDto foundNotice = noticeService.foundNoticeService2(noticeboardNo);
		    
		    if (foundNotice != null) {
		        // 검색된 게시글을 모델에 추가
		        model.addAttribute("foundNotice", foundNotice);
		    } else {
		        // 게시글을 찾지 못한 경우에 대한 처리
		    }
		    
		    return "viewBoard"; // 이동할 페이지 이름
		}
		
		@RequestMapping("/viewBoardMostQ")
		public String viewBoardMostQ(qqq_TableDto qqq_tableDto, Model model) {
		    // POST 요청으로 전달된 데이터를 처리합니다.

		    qqq_TableDto foundMostQ = mostqService.foundMostQService(qqq_tableDto);

		    if (foundMostQ != null) {
		        // 검색된 게시글을 모델에 추가
		        model.addAttribute("foundMostQ", foundMostQ);
		    } else {
		        // 게시글을 찾지 못한 경우에 대한 처리
		    }

		    return "viewBoardMostQ"; // 이동할 페이지 이름
		}
		
		@RequestMapping("/viewBoardMostQ2")
		public String viewBoardMostQ2(@RequestParam("mostqboardNo") int mostqboardNo, Model model) {
		    // POST 요청으로 전달된 데이터를 처리합니다.

		    qqq_TableDto foundMostQ = mostqService.foundMostQService(mostqboardNo);

		    if (foundMostQ != null) {
		        // 검색된 게시글을 모델에 추가
		        model.addAttribute("foundMostQ", foundMostQ);
		    } else {
		        // 게시글을 찾지 못한 경우에 대한 처리
		    }

		    return "viewBoardMostQ"; // 이동할 페이지 이름
		}
		
		
		
		
		@RequestMapping("/idFind_Result")
		public String idFind_Result(member_TableDto member_tableDto, Model model) {
			
			idFindService.idFindEmailService(member_tableDto);
			
			return "idFind_Result"; // 이동할 페이지 이름
		}

		


}