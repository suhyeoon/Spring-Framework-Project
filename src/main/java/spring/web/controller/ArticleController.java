package spring.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.web.dao.ArticleDAO;
import spring.web.model.Article;
import spring.web.model.Comment;

@Controller
public class ArticleController {
	
	@Resource(name="articleDAO") 
    private ArticleDAO articleDAO;   
    
	// list 실행시 spage 구하는 메소드 (모든게시판)
		public int getSpage(HttpServletRequest req){
			int spage = 1;
	        String page = req.getParameter("page");
	        if(page != null) spage = Integer.parseInt(page);
	        return spage;
		}
		
		// 이벤트게시판 진행중 종료됨 구분할 메소드
		public String getBeforePage(HttpServletRequest req) {
			String beforePage = "list";
			String isPage = req.getParameter("beforePage");
			if (isPage != null)
				beforePage = isPage;

			return beforePage;
		}
		
		// 이벤트게시판을 제외한 게시판 행수 구하는 메소드
		public HashMap<String, Object> getRow(HttpServletRequest req, int spage){
	        int startRow = (spage - 1) * 10;
	        HashMap<String, Object> paramMap =  new HashMap<>();
		    paramMap.put("startRow", startRow);
		    paramMap.put("endRow", 10);
			return paramMap;
		}
		// 이벤트게시판을 제외한 게시판 페이지 구하는 메소드
		public void getPage(HttpServletRequest req, int spage, int listCount, List<Article> article){
			int maxPage = (int)(listCount/10.0 + 0.9);
		    int startPage = (int)(spage/5.0 + 0.8) * 5 - 4;
		    int endPage = startPage + 4;
	        if(endPage > maxPage)    endPage = maxPage;
	        
	        req.setAttribute("spage", spage);
	        req.setAttribute("maxPage", maxPage);
	        req.setAttribute("startPage", startPage);
	        req.setAttribute("endPage", endPage);
	        req.setAttribute("list", article);  
		}
		// read 실행 시 게시글번호 ,페이지번호 set (모든게시판)
		public Article setBoardNum(HttpServletRequest req){
			String num = req.getParameter("no");
			String pageNum = req.getParameter("pageNo");
			int boardNum = Integer.parseInt(num);
			Article article = new Article();
			article.setNo(boardNum);
			req.setAttribute("pageNum", pageNum);
			return article;
		}
		// read 실행시 댓글 cpage 값 가져오기 (qna,건의사항,review)
		public int getCpage(HttpServletRequest req){
			int cpage = 1;
	        String cPageNum = req.getParameter("cPageNo");
	        if(cPageNum != null)    cpage = Integer.parseInt(cPageNum);
	        return cpage;
		}
		// read 실행시 댓글 행수,페이지 구하고 set (qna,건의사항,review)
		public HashMap<String, Object> getCommentRow(HttpServletRequest req, int listCount, int cpage, int boardNum){
	        int maxPage = (int)(listCount/5.0 + 0.9);
	        if(cpage > maxPage && maxPage!=0) cpage = maxPage;
	        if(cpage <= 0) cpage = 1;
	        int startRow = (cpage - 1) * 5;
	        HashMap<String, Object> paramMap =  new HashMap<>();
		    paramMap.put("startRow", startRow);
		    paramMap.put("endRow", 5);
		    paramMap.put("bNo", boardNum);
		    
	        int startPage = (int)(cpage/5.0 + 0.8) * 5 - 4;
	        int endPage = startPage + 4;
	        if(endPage > maxPage)    endPage = maxPage;

	        req.setAttribute("spage", cpage);
	        req.setAttribute("maxPage", maxPage);
	        req.setAttribute("startPage", startPage);
	        req.setAttribute("endPage", endPage);
		    return paramMap;
		}
		// read 실행시 댓글 list set (qna,건의사항,review)
		public void setList(HttpServletRequest req, List<Comment> list){
			if(list.size() == 0)
	        	req.setAttribute("cList", "empty");
			for(int i = 0 ; i < list.size(); i++){
	        	list.get(i).setUploadDate(list.get(i).getUploadDate().substring(0,19));
		    }
	        req.setAttribute("list", list);
		}
		// 게시글 쓰기,수정 성공 여부 판단 (이미지 업로드가 없는 qna,건의사항,공지사항 )
		public void writeAndModify(HttpServletResponse res, int result, boolean moFlag){
			res.setContentType("text/html;charset=utf-8");
	        PrintWriter out;
			try {
				out = res.getWriter();
				if(result>0){
		        	if(!moFlag){
		        		out.println("0"); // 글쓰기 성공
		        	}else{
		        		out.println("2");// 글수정 성공
		        	}
		        }
		        else{
		        	if(!moFlag){
		        		out.println("1"); // 글쓰기 실패
		        	}else{
		        		out.println("3");// 글수정 실패
		        	}
		        }
		        out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 게시글 삭제 성공 여부 판단 (모든 게시판)
		public void delete(HttpServletResponse res, int result){
			res.setContentType("text/html;charset=utf-8");
		    PrintWriter out;
			try {
				out = res.getWriter();
				if(result>0){
		        	out.println("0"); // 글삭제 성공
		        }
		        else{
		        	out.println("1"); // 글삭제 실패
		        }
		        
		        out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// 댓글 삭제하기 위한 no 정보 가져와서 set (후기, qna, 건의사항 게시판)
		public void commentSetNo(HttpServletRequest req){
			int no = Integer.parseInt(req.getParameter("no"));
	        int bNo = Integer.parseInt(req.getParameter("bNo"));
	        int pNo = Integer.parseInt(req.getParameter("pNo"));
	        req.setAttribute("commentNo", no);
	        req.setAttribute("bNo", bNo);
	        req.setAttribute("pNo", pNo);
		}
		// 댓글 삭제 (후기, qna, 건의사항 게시판)
		public void commentDelete(HttpServletResponse res, int result){
			if(result>0){
	        	res.setContentType("text/html;charset=euc-kr");
	        	PrintWriter out;
				try {
					out = res.getWriter();
					out.println("1");
		        	out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
		}
		
		public List<Article> search(Map<String, Object> paramMap,String keyword,
				String searchOption, String boardName){
			paramMap.put("keyword", keyword);
			paramMap.put("search", searchOption);
			paramMap.put("board", boardName);
			if(searchOption.equals("titleContents")){
				return (List<Article>) articleDAO.searchtitleContents(searchOption, paramMap);
			}
			else{
				return (List<Article>) articleDAO.search(null, paramMap);
			}
		}
		
		public int searchCount(HashMap<String, Object> paramMap,String keyword,
				String searchOption, String boardName){
			paramMap.put("keyword", keyword);
			paramMap.put("search", searchOption);
			paramMap.put("board", boardName);
			if(searchOption.equals("titleContents")){
				return Integer.parseInt((String)articleDAO.searchCountTitleContents(searchOption, paramMap));
			}
			else{
				return Integer.parseInt((String)articleDAO.searchCount(null, paramMap));
			}
		}
	
		// 공지사항 컨트롤러
		@RequestMapping(value="/notice/list", method=RequestMethod.GET)
		public String listForm(HttpServletRequest req){        		
		    
			int spage = getSpage(req);
		    Map<String, Object> paramMap = getRow(req, spage);
		    int listCount = Integer.parseInt((String)articleDAO.noticeCountAll(null, null));
		    List<Article> article = (List<Article>)articleDAO.noticeSelectAll(null, paramMap);
		    getPage(req, spage, listCount, article);
			return "article/notice/noticeList";
		}
		
		@RequestMapping(value = "/notice/list", method = RequestMethod.POST)
		public String noticeSearchProc(HttpServletRequest req) {

			int spage = getSpage(req);
			String searchOption = req.getParameter("searchOption");
			String keyword = "%" + req.getParameter("keyword").trim() + "%";

			HashMap<String, Object> paramMap = getRow(req, spage);
			
			List<Article> article = search(paramMap,keyword,searchOption,"noticeBoard");
			int listCount = searchCount(paramMap,keyword,searchOption,"noticeBoard");
			
			getPage(req, spage, listCount, article);
			return "article/notice/noticeList";
		}
		
		@RequestMapping(value="/notice/read", method=RequestMethod.GET)
		public String readForm(HttpServletRequest req){        		

			Article article = setBoardNum(req);
			article = articleDAO.noticeSelect(null, article);
			article.setUploadDate(article.getUploadDate().substring(0,19));
			articleDAO.noticeUpdateCount(null, article);

			req.setAttribute("board", article);
			return "article/notice/noticeRead";
		}
		
		@RequestMapping(value="/notice/write", method=RequestMethod.GET)
		public String writeForm(HttpServletRequest req){        		

			String mo = req.getParameter("mo");
			if(mo==null){
				return "article/notice/noticeWrite";
			}else{
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);

				Article article = new Article();
				article.setNo(boardNum);
				article = articleDAO.noticeSelect(null, article);
			    req.setAttribute("board", article);
			}
			return "article/notice/noticeWrite";
		}
		
		@RequestMapping(value="/notice/write", method=RequestMethod.POST)
		public String writeProc(Article article, HttpServletRequest req, HttpServletResponse res){        		
			
			String mo = req.getParameter("mo");
			article.setWriter((String)req.getSession(false).getAttribute("authUser"));
			String reCont = article.getContents().replace("\n", "<br>");
			reCont = reCont.replaceAll("<", "&lt;");
			reCont = reCont.replaceAll(">", "&gt;");
			article.setContents(reCont);
			int result = 0;
			boolean moFlag=false;
			if(mo==null){
				try{
				result = (Integer)articleDAO.noticeInsert(null, article);
				}
				catch(Exception e){
				}
			}
			else{
				moFlag=true;
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);
				article.setNo(boardNum);
				try{
					result = (Integer)articleDAO.noticeUpdate(null, article);	
				}
				catch(Exception e){
				}
			}
			writeAndModify(res, result, moFlag);
	        return null;
		}
		
		@RequestMapping(value="/notice/delete", method=RequestMethod.POST)
		public String deleteProc(HttpServletRequest req, HttpServletResponse res){        		
			String pw = (String)req.getSession(false).getAttribute("authPass");
			String num = req.getParameter("no");
			int boardNum = Integer.parseInt(num);
			Article article = new Article();
			article.setNo(boardNum);
			// 삭제할 글에 있는 파일 정보를 가져온다.
			int result;
			if(pw.equals(req.getParameter("pw")))
				result = (Integer)articleDAO.noticeDelete(null, article);
			else
				result = 0;
			
			delete(res, result);
		    return null;
		}
		
		// 이벤트 컨트롤러
		
		@RequestMapping(value = "/event/list", method = RequestMethod.GET)
		public String eventListForm(HttpServletRequest req) {

			int spage = getSpage(req);
			// 목록보기 눌렀을 때, 진행중 종료됨 페이지 구분하기 위함.
			String beforePage = getBeforePage(req);
			int startRow = (spage - 1) * 9;
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("startRow", startRow);
			paramMap.put("endRow", 9);
			int listCount = Integer.parseInt((String) articleDAO.eventCountOngoing(null, null));

			// 진행중 테스트
			List<Article> articleOngoing = (List<Article>) articleDAO.eventOngoing(null, paramMap);
			System.out.println(articleOngoing.size());
			for (int i = 0; i < articleOngoing.size(); i++) {

				// 진행중만 띄우기 위한 테스트
				articleOngoing.get(i).setStartDate(articleOngoing.get(i).getStartDate().substring(0, 10));
				articleOngoing.get(i).setEndDate(articleOngoing.get(i).getEndDate().substring(0, 10));
				articleOngoing.get(i).setRecommend(i);
			}
			int maxPage = (int) (listCount / 9.0 + 0.9);
			int startPage = (int) (spage / 5.0 + 0.8) * 5 - 4;
			int endPage = startPage + 4;
			if (endPage > maxPage)
				endPage = maxPage;

			req.setAttribute("spage", spage);
			// 목록보기 눌렀을 때, 진행중 종료됨 페이지 구분하기 위함.
			req.setAttribute("beforePage", beforePage);
			req.setAttribute("maxPage", maxPage);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("list", articleOngoing);

			return "article/event/eventList";
		}

		// 종료된 이벤트
		@RequestMapping(value = "/event/endlist", method = RequestMethod.GET)
		public String eventEndListForm(HttpServletRequest req) {

			int spage = getSpage(req);
			// 목록보기 눌렀을 때, 진행중 종료됨 페이지 구분하기 위함.
			String beforePage = getBeforePage(req);
			int startRow = (spage - 1) * 9;
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("startRow", startRow);
			paramMap.put("endRow", 9);
			int listCount = Integer.parseInt((String) articleDAO.eventCountEnd(null, null));

			// 종료됨 테스트
			List<Article> articleEnd = (List<Article>) articleDAO.eventEnd(null, paramMap);

			System.out.println(articleEnd.size());
			for (int i = 0; i < articleEnd.size(); i++) {

				// 진행중만 띄우기 위한 테스트
				articleEnd.get(i).setStartDate(articleEnd.get(i).getStartDate().substring(0, 10));
				articleEnd.get(i).setEndDate(articleEnd.get(i).getEndDate().substring(0, 10));
				articleEnd.get(i).setRecommend(i);

				/*
				 * article.get(i).setStartDate(article.get(i).getStartDate().
				 * substring(0,10));
				 * article.get(i).setEndDate(article.get(i).getEndDate().substring(0
				 * ,10)); article.get(i).setRecommend(i);
				 */
			}
			int maxPage = (int) (listCount / 9.0 + 0.9);
			int startPage = (int) (spage / 5.0 + 0.8) * 5 - 4;
			int endPage = startPage + 4;
			if (endPage > maxPage)
				endPage = maxPage;

			req.setAttribute("spage", spage);
			// 목록보기 눌렀을 때, 진행중 종료됨 페이지 구분하기 위함.
			req.setAttribute("beforePage", beforePage);
			req.setAttribute("maxPage", maxPage);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("list", articleEnd);

			return "article/event/eventEndList";
		}
		
		@RequestMapping(value="/event/read", method=RequestMethod.GET)
		public String eventReadForm(HttpServletRequest req){        		

			Article article = setBoardNum(req);
			article = articleDAO.eventSelect(null, article);
			article.setStartDate(article.getStartDate().substring(0,10));
			article.setEndDate(article.getEndDate().substring(0,10));
			articleDAO.eventUpdateCount(null, article);

			req.setAttribute("board", article);
			return "article/event/eventRead";
		}
		
		@RequestMapping(value="/event/write", method=RequestMethod.GET)
		public String eventWriteForm(HttpServletRequest req){        		

			String strMo = req.getParameter("mo");
			int mo = Integer.parseInt(strMo);
			
			if(mo == 0){
				return "article/event/eventWrite";
			}else{
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);

				Article article = new Article();
				article.setNo(boardNum);
				article = articleDAO.eventSelect(null, article);
				article.setStartDate(article.getStartDate().substring(0,10));
				article.setEndDate(article.getEndDate().substring(0,10));
			    req.setAttribute("board", article);
			}
			return "article/event/eventWrite";
		}
		
		@RequestMapping(value="/event/write", method=RequestMethod.POST)
		public String eventWriteProc(HttpServletResponse res, HttpServletRequest req, 
				@ModelAttribute("writeForm") Article article){
			String strMo = req.getParameter("mo");
			int mo = Integer.parseInt(strMo);
			
			article.setWriter((String)req.getSession(false).getAttribute("authUser"));
			String reCont = article.getContents().replace("\n", "<br>");
			reCont = reCont.replaceAll("<", "&lt;");
			reCont = reCont.replaceAll(">", "&gt;");
			article.setContents(reCont);
			
			boolean imgChk = article.getEventImg() != null && article.getEventImg().getSize() > 0;

			if(imgChk){
				String upDir = req.getParameter("upDir");
				MultipartFile multipartFile = article.getEventImg();
					
				String fileName = multipartFile.getOriginalFilename();
				article.setImage(fileName);
				String path = upDir + fileName;
				File file = new File(path);

				if(!file.exists())
					file.mkdirs();
				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			Map<String, Boolean> write = new HashMap<>();
			Map<String, Boolean> modify = new HashMap<>();
			Map<String, Boolean> error = new HashMap<>();
			
			req.setAttribute("write", write);
			req.setAttribute("modify", modify);
			req.setAttribute("error", error);
			
			int result = 0;
			
			if(mo==0){
				try{
				result = (Integer)articleDAO.eventInsert(null, article);
				}
				catch(Exception e){
				}
				if(result > 0)
					write.put("write", Boolean.TRUE);
				else
					error.put("error", Boolean.TRUE);
			} else {
				String no = req.getParameter("modifyNo");
				int boardNum = Integer.parseInt(no);
				article.setNo(boardNum);
				if(!imgChk){
					try{
					result = (Integer)articleDAO.eventUpdate(null, article);
					}
					catch(Exception e){
					}
					if(result > 0)
						modify.put("modify", Boolean.TRUE);
					else
						error.put("error", Boolean.TRUE);
				} else {
					try{
					result = (Integer)articleDAO.eventUpdateImage(null, article);
					}
					catch(Exception e){
					}
					if(result > 0)
						modify.put("modify", Boolean.TRUE);
					else
						error.put("error", Boolean.TRUE);
				}
			}
	        return "article/event/eventWrite";
		}
		
		@RequestMapping(value="/event/delete", method=RequestMethod.POST)
		public String eventDeleteProc(HttpServletRequest req, HttpServletResponse res){        		
			String pw = (String)req.getSession(false).getAttribute("authPass");
			String num = req.getParameter("no");
			int boardNum = Integer.parseInt(num);
			Article article = new Article();
			article.setNo(boardNum);
			// 삭제할 글에 있는 파일 정보를 가져온다.
			int result;
			if(pw.equals(req.getParameter("pw")))
				result = (Integer)articleDAO.eventDelete(null, article);
			else
				result = 0;

			delete(res, result);
		    return null;
		}
		
		// Q&A 컨트롤러
		
		@RequestMapping(value="/qna/list", method=RequestMethod.GET)
		public String qnaListForm(HttpServletRequest req){        		

			int spage = getSpage(req);
			Map<String, Object> paramMap = getRow(req, spage);
			
		    int listCount = Integer.parseInt((String)articleDAO.qnaCountAll(null, null));
		    Comment comment = new Comment();
		    int r = 0;
		    List<Article> article = (List<Article>)articleDAO.qnaSelectAll(null, paramMap);
		    for(int i = 0 ; i < article.size(); i++){
		    	article.get(i).setUploadDate(article.get(i).getUploadDate().substring(0,19));
		    	comment.setbNo(article.get(i).getNo());
		    	r = 0;
		    	r = Integer.parseInt((String)articleDAO.qnaCommentCountAll(null, comment));
		    	if(r>0){
		    		article.get(i).setAnswer(true);
		    	}
		    	else{
		    		article.get(i).setAnswer(false);
		    	}
		    }
		    
		    getPage(req, spage, listCount, article);
	        
			return "article/qna/qnaList";
		}
		
		@RequestMapping(value = "/qna/list", method = RequestMethod.POST)
		public String qnaSearchProc(HttpServletRequest req) {

			int spage = getSpage(req);
			String searchOption = req.getParameter("searchOption");
			String keyword = "%" + req.getParameter("keyword").trim() + "%";

			HashMap<String, Object> paramMap = getRow(req, spage);
			
			List<Article> article = search(paramMap,keyword,searchOption,"qandaBoard");
			int listCount = searchCount(paramMap,keyword,searchOption,"qandaBoard");
			
			getPage(req, spage, listCount, article);
			return "article/qna/qnaList";
		}
		
		@RequestMapping(value="/qna/read", method=RequestMethod.GET)
		public String qnaReadForm(HttpServletRequest req){        		
			
			Article article = setBoardNum(req);
			article = articleDAO.qnaSelect(null, article);
			article.setUploadDate(article.getUploadDate().substring(0,19));
			req.setAttribute("board", article);

			int boardNum = article.getNo();
			int cpage = getCpage(req);
	        Comment comment = new Comment();
	        comment.setbNo(boardNum);
	        int listCount = Integer.parseInt((String)articleDAO.qnaCommentCountAll(null, comment));
	        
	        Map<String, Object> paramMap = getCommentRow(req, listCount, cpage, boardNum);
	        List<Comment> list = (List<Comment>)articleDAO.qnaCommentSelectAll(null,paramMap);
	        setList(req, list);
			
			return "article/qna/qnaRead";
		}
		
		@RequestMapping(value="/qna/write", method=RequestMethod.GET)
		public String qnaWriteForm(HttpServletRequest req){        		

			String mo = req.getParameter("mo");
			if(mo==null){
				return "article/qna/qnaWrite";
			}else{
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);

				Article article = new Article();
				article.setNo(boardNum);
				article = articleDAO.qnaSelect(null, article);
				article.setUploadDate(article.getUploadDate().substring(0,19));
			    req.setAttribute("board", article);
			}
			return "article/qna/qnaWrite";
		}
		
		@RequestMapping(value="/qna/write", method=RequestMethod.POST)
		public String qnaWriteProc(HttpServletResponse res, HttpServletRequest req, Article article){        		

			String mo = req.getParameter("mo");
			String reCont = article.getContents().replace("\n", "<br>");
			reCont = reCont.replaceAll("<", "&lt;");
			reCont = reCont.replaceAll(">", "&gt;");
			article.setContents(reCont);
			article.setWriter((String)req.getSession(false).getAttribute("authUser"));
			int result = 0;
			boolean moFlag=false;
			if(mo==null){
				try{
					result = (Integer)articleDAO.qnaInsert(null, article);
				}
				catch(Exception e){
				}
			}
			else{
				moFlag=true;
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);
				article.setNo(boardNum);
				try{
				result = (Integer)articleDAO.qnaUpdate(null, article);
				}
				catch(Exception e){
				}
			}
			writeAndModify(res, result, moFlag);
	        return null;
		}
		
		@RequestMapping(value="/qna/delete", method=RequestMethod.POST)
		public String qnaDeleteProc(HttpServletRequest req, HttpServletResponse res){        		
			String pw = (String)req.getSession(false).getAttribute("authPass");
			String num = req.getParameter("no");
			int boardNum = Integer.parseInt(num);
			Article article = new Article();
			article.setNo(boardNum);
			// 삭제할 글에 있는 파일 정보를 가져온다.
			int result;
			if(pw.equals(req.getParameter("pw")))
				result = (Integer)articleDAO.qnaDelete(null, article);
			else
				result = 0;
			
			delete(res, result);
		    return null;
		}
		
		@RequestMapping(value="/qna/commentWrite", method=RequestMethod.POST)
		public String qnaCommentWriteProc(HttpServletRequest req){        		
			String no = req.getParameter("no");
			int bNo = Integer.parseInt(no);
			
			Comment comment = new Comment();
			comment.setbNo(bNo);
			comment.setContents(req.getParameter("comment"));
			comment.setWriter((String) req.getSession().getAttribute("authUser"));
			// 파라미터 값을 GuestbookBean에 세팅한다.
			int result = (Integer)articleDAO.qnaCommentInsert(null, comment);
			req.setAttribute("no", bNo);
			req.setAttribute("pageNo", req.getParameter("pNo"));
			if(result>0){
				return "article/qna/qnaWriteResult";
			}
			else
			{
				return "article/qna/qnaWriteResult";
			}
		}
		
		@RequestMapping(value="/qna/commentDelete", method=RequestMethod.GET)
		public String qnaCommentDeleteForm(HttpServletRequest req){        		
			commentSetNo(req);
	        return "article/qna/qnaDeleteComment";
		}
		
		@RequestMapping(value="/qna/commentDelete", method=RequestMethod.POST)
		public String qnaCommentDeleteProc(HttpServletRequest req, HttpServletResponse res){        
			
	        Comment comment = new Comment();
			comment.setNo(Integer.parseInt(req.getParameter("no")));
	        int result = (Integer)articleDAO.qnaCommentDelete(null,comment);
	        commentDelete(res, result);
	        return null;    
		}
		
		// 건의사항 컨트롤러
		
		@RequestMapping(value="/suggest/list", method=RequestMethod.GET)
		public String suggestListForm(HttpServletRequest req){        		

			int spage = getSpage(req);
			Map<String, Object> paramMap = getRow(req, spage);
		    int listCount = Integer.parseInt((String)articleDAO.suggestCountAll(null, null));
		    List<Article> article = (List<Article>)articleDAO.suggestSelectAll(null, paramMap);
		    for(int i = 0 ; i < article.size(); i++){
		    	article.get(i).setUploadDate(article.get(i).getUploadDate().substring(0,19));
		    }
		    
		    getPage(req, spage, listCount, article);
			return "article/suggest/suggestList";
		}
		
		@RequestMapping(value = "/suggest/list", method = RequestMethod.POST)
		public String suggestSearchProc(HttpServletRequest req) {

			int spage = getSpage(req);
			String searchOption = req.getParameter("searchOption");
			String keyword = "%" + req.getParameter("keyword").trim() + "%";

			HashMap<String, Object> paramMap = getRow(req, spage);
			
			List<Article> article = search(paramMap,keyword,searchOption,"suggestBoard");
			int listCount = searchCount(paramMap,keyword,searchOption,"suggestBoard");
			
			getPage(req, spage, listCount, article);
			return "article/suggest/suggestList";
		}
		
		@RequestMapping(value="/suggest/read", method=RequestMethod.GET)
		public String suggestReadForm(HttpServletRequest req){        		

			Article article = setBoardNum(req);
			article = articleDAO.suggestSelect(null, article);
			article.setUploadDate(article.getUploadDate().substring(0,19));

			req.setAttribute("board", article);
			int boardNum = article.getNo();
			int cpage = getCpage(req);
	        Comment comment = new Comment();
	        comment.setbNo(boardNum);
	        int listCount = Integer.parseInt((String)articleDAO.suggestCommentCountAll(null, comment));
	        
	        Map<String, Object> paramMap = getCommentRow(req, listCount, cpage, boardNum);
	        List<Comment> list = (List<Comment>)articleDAO.suggestCommentSelectAll(null,paramMap);
	        setList(req, list);
			
	        articleDAO.suggestUpdateCount(null, article);
	        
			return "article/suggest/suggestRead";
		}
		
		@RequestMapping(value="/suggest/write", method=RequestMethod.GET)
		public String suggestWriteForm(HttpServletRequest req){        		

			String mo = req.getParameter("mo");
			if(mo==null){
				return "article/suggest/suggestWrite";
			}else{
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);

				Article article = new Article();
				article.setNo(boardNum);
				article = articleDAO.suggestSelect(null, article);
				article.setUploadDate(article.getUploadDate().substring(0,19));
			    req.setAttribute("board", article);
			}
			return "article/suggest/suggestWrite";
		}
		
		@RequestMapping(value="/suggest/write", method=RequestMethod.POST)
		public String suggestWriteProc(HttpServletResponse res, HttpServletRequest req, Article article){        		

			String mo = req.getParameter("mo");
			String reCont = article.getContents().replace("\n", "<br>");
			reCont = reCont.replaceAll("<", "&lt;");
			reCont = reCont.replaceAll(">", "&gt;");
			article.setContents(reCont);
			article.setWriter((String)req.getSession(false).getAttribute("authUser"));
			int result = 0;
			boolean moFlag=false;
			if(mo==null){
				try{
				result = (Integer)articleDAO.suggestInsert(null, article);
				}
				catch(Exception e){
					
				}
			}
			else{
				moFlag=true;
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);
				article.setNo(boardNum);
				try{
				result = (Integer)articleDAO.suggestUpdate(null, article);
				}
				catch(Exception e){
					
				}
			}
			writeAndModify(res, result, moFlag);
	        return null;
		}
		
		@RequestMapping(value="/suggest/delete", method=RequestMethod.POST)
		public String suggestDeleteProc(HttpServletRequest req, HttpServletResponse res){        		
			String pw = (String)req.getSession(false).getAttribute("authPass");
			String num = req.getParameter("no");
			int boardNum = Integer.parseInt(num);
			Article article = new Article();
			article.setNo(boardNum);
			// 삭제할 글에 있는 파일 정보를 가져온다.
			int result;
			if(pw.equals(req.getParameter("pw"))){
				result = (Integer)articleDAO.suggestDelete(null, article);
			}
			else{
				result = 0;
			}
			delete(res, result);
		    return null;
		}
		
		@RequestMapping(value="/suggest/commentWrite", method=RequestMethod.POST)
		public String suggestCommentWriteProc(HttpServletRequest req){        		
			String no = req.getParameter("no");
			int bNo = Integer.parseInt(no);
			
			Comment comment = new Comment();
			comment.setbNo(bNo);
			comment.setContents(req.getParameter("comment"));
			comment.setWriter((String) req.getSession().getAttribute("authUser"));
			// 파라미터 값을 GuestbookBean에 세팅한다.
			int result = (Integer)articleDAO.suggestCommentInsert(null, comment);
			req.setAttribute("no", bNo);
			req.setAttribute("pageNo", req.getParameter("pNo"));
			if(result>0)
				return "article/suggest/suggestWriteResult";
			else
				return "article/suggest/suggestWriteResult";
		}
		
		@RequestMapping(value="/suggest/commentDelete", method=RequestMethod.GET)
		public String suggestCommentDeleteForm(HttpServletRequest req){        		
			commentSetNo(req);
	        return "article/suggest/suggestDeleteComment";
		}
		
		@RequestMapping(value="/suggest/commentDelete", method=RequestMethod.POST)
		public String suggestCommentDeleteProc(HttpServletRequest req, HttpServletResponse res){        
			
	        Comment comment = new Comment();
			comment.setNo(Integer.parseInt(req.getParameter("no")));
	        int result = (Integer)articleDAO.suggestCommentDelete(null,comment);
	        commentDelete(res, result);
	        return null;    
		}

		// 후기 컨트롤러
		
		@RequestMapping(value="/review/list", method=RequestMethod.GET)
		public String reviewListForm(HttpServletRequest req){        		

			int spage = getSpage(req);
			Map<String, Object> paramMap = getRow(req, spage);
		    int listCount = Integer.parseInt((String)articleDAO.reviewCountAll(null, null));
		    List<Article> article = (List<Article>)articleDAO.reviewSelectAll(null, paramMap);

		    getPage(req, spage, listCount, article);
			return "article/review/reviewList";
		}
		
		@RequestMapping(value = "/review/list", method = RequestMethod.POST)
		public String reviewSearchProc(HttpServletRequest req) {

			int spage = getSpage(req);
			String searchOption = req.getParameter("searchOption");
			String keyword = "%" + req.getParameter("keyword").trim() + "%";

			HashMap<String, Object> paramMap = getRow(req, spage);
			
			List<Article> article = search(paramMap,keyword,searchOption,"reviewBoard");
			int listCount = searchCount(paramMap,keyword,searchOption,"reviewBoard");
			
			getPage(req, spage, listCount, article);
			return "article/review/reviewList";
		}
		
		@RequestMapping(value="/review/read", method=RequestMethod.GET)
		public String reviewReadForm(HttpServletRequest req){        		

			Article article = setBoardNum(req);
			String id = (String) req.getSession(false).getAttribute("authUser");
			
			article = articleDAO.reviewSelect(null, article);
			article.setUploadDate(article.getUploadDate().substring(0,19));
			req.setAttribute("board", article);
			
			int boardNum = article.getNo();
			Map<String, Object> paramMap =  new HashMap<>();
		    paramMap.put("id", id);
		    paramMap.put("no", boardNum);
			
		    int result = Integer.parseInt((String)articleDAO.recommendSelect(null, paramMap));
		    if(result > 0)
		    	req.setAttribute("chk", "좋아요 취소");
		     else 
		    	req.setAttribute("chk", "좋아요");
		    
		    int cpage = getCpage(req);
	        Comment comment = new Comment();
	        comment.setbNo(boardNum);
	        int listCount = Integer.parseInt((String)articleDAO.reviewCommentCountAll(null, comment));

	        paramMap =  getCommentRow(req, listCount, cpage, boardNum);
	        List<Comment> list = (List<Comment>)articleDAO.reviewCommentSelectAll(null,paramMap);
	        setList(req, list);
	        articleDAO.reviewUpdateCount(null, article);
	        
			return "article/review/reviewRead";
		}
		
		@RequestMapping(value="/review/recommend", method=RequestMethod.POST)
		public String recommendProc(HttpServletRequest req){        		

			String user = req.getParameter("user");
			String strNo = req.getParameter("no");
			String strCheck= req.getParameter("check");
			
			int no = Integer.parseInt(strNo);
			int check = Integer.parseInt(strCheck);
			
			Map<String, Object> paramMap =  new HashMap<>();
		    paramMap.put("id", user.trim());
		    paramMap.put("no", no);
			if (check > 0){
				articleDAO.recommendInsert(null, paramMap);
				articleDAO.reviewRecommendUp(null, paramMap);
			} else {
				articleDAO.recommendDelete(null, paramMap);
				articleDAO.reviewRecommendDown(null, paramMap);
			}
			
			Article article = new Article();
			article.setNo(no);
			article = articleDAO.reviewSelect(null, article);
			
			req.setAttribute("board", article);
			System.out.println(article.getRecommend());
			return "article/review/reviewRead";
		}
		
		@RequestMapping(value="/review/write", method=RequestMethod.GET)
		public String reviewWriteForm(HttpServletRequest req){        		

			String strMo = req.getParameter("mo");
			int mo = Integer.parseInt(strMo);
			
			if(mo == 0){
				return "article/review/reviewWrite";
			}else{
				String no = req.getParameter("no");
				int boardNum = Integer.parseInt(no);

				Article article = new Article();
				article.setNo(boardNum);
				article = articleDAO.reviewSelect(null, article);
				article.setUploadDate(article.getUploadDate().substring(0,19));
			    req.setAttribute("board", article);
			}
			return "article/review/reviewWrite";
		}
		
		@RequestMapping(value="/review/write", method=RequestMethod.POST)
		public String reviewWriteProc(@ModelAttribute("writeForm") Article article,
				HttpServletRequest req) {
			String strMo = req.getParameter("mo");
			int mo = Integer.parseInt(strMo);
			Article oldArticle = new Article();
			oldArticle.setImage1(req.getParameter("oldImg1"));
			oldArticle.setImage2(req.getParameter("oldImg2"));
			oldArticle.setImage3(req.getParameter("oldImg3"));
			
			// 이미지 삽입 유무 체크 (있으면 true 없으면 false)
			boolean imgChk = article.getImages().get(0).getSize() > 0 || article.getImages().get(1).getSize() > 0 || 
					article.getImages().get(2).getSize() > 0;
					
			Date date = new Date();
			SimpleDateFormat now = new SimpleDateFormat("YYYYMMDDHHmmss");
			String strNow = now.format(date);
			String writer = (String)req.getSession(false).getAttribute("authUser");
			
			if(imgChk){
				String upDir = req.getParameter("upDir");
				List<MultipartFile> images = article.getImages();
				int cnt = 1;
				
				for (MultipartFile multipartFile : images) {
					
					String fileName = multipartFile.getOriginalFilename();
					if(fileName != null && fileName != "")
					{
						if(cnt == 1)
							article.setImage1(strNow + writer + cnt);
						if(cnt == 2)
							article.setImage2(strNow + writer + cnt);
						if(cnt == 3)
							article.setImage3(strNow + writer + cnt);
					}
					String path = upDir + strNow + writer + cnt;
					File file = new File(path);

					if(!file.exists())
						file.mkdirs();
					
					try {
						multipartFile.transferTo(file);
						cnt++;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

			article.setWriter((String)req.getSession(false).getAttribute("authUser"));
			article.setContents(article.getContents().replace("\n", "<br>"));
			
			Map<String, Boolean> write = new HashMap<>();
			Map<String, Boolean> modify = new HashMap<>();
			Map<String, Boolean> error = new HashMap<>();
			
			req.setAttribute("write", write);
			req.setAttribute("modify", modify);
			req.setAttribute("error", error);
			
			int result = 0;
			
			if(mo == 0){
				try{
				result = (Integer)articleDAO.reviewInsert(null, article);
				}
				catch(Exception e){
					
				}
				if(result > 0)
					write.put("write", Boolean.TRUE);
				else
					error.put("error", Boolean.TRUE);
			}else{
				String no = req.getParameter("modifyNo");
				int boardNum = Integer.parseInt(no);
				article.setNo(boardNum);
				
				try{
					// 이미지를 제외한 내용과 제목 수정
					result = (Integer)articleDAO.reviewUpdate(null, article);
					//이미지를 변경 또는 추가로 수정한 경우
					if(article.getImage1()!=null && article.getImage1()!=""){
						articleDAO.reviewUpdateImage1(null, article);
					}
					else{
					// 원래 존재하던 이미지를 삭제 한 경우
						if(oldArticle.getImage1()!=null && oldArticle.getImage1()!=""){
							if(req.getParameter("chkImg1").equals("x")){
								article.setImage1("");
								articleDAO.reviewUpdateImage1(null, article);
							}
						}
					}
						
					if(article.getImage2()!=null && article.getImage2()!=""){
						articleDAO.reviewUpdateImage2(null, article);
					}
					else{
						if(oldArticle.getImage2()!=null && oldArticle.getImage2()!=""){
							if(req.getParameter("chkImg2").equals("x")){
								article.setImage2("");
								articleDAO.reviewUpdateImage2(null, article);
							}
							
						}
					}
					
					if(article.getImage3()!=null && article.getImage3()!=""){
						articleDAO.reviewUpdateImage3(null, article);
					}
					else{
						if(oldArticle.getImage3()!=null && oldArticle.getImage3()!=""){
							if(req.getParameter("chkImg3").equals("x")){
								article.setImage3("");
								articleDAO.reviewUpdateImage3(null, article);
							}
						}
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
				if(result > 0)
					modify.put("modify", Boolean.TRUE);
				else
					error.put("error", Boolean.TRUE);	
			}
	        return "article/review/reviewWrite";
		}
		
		@RequestMapping(value="/review/delete", method=RequestMethod.POST)
		public String reviewDeleteProc(HttpServletRequest req, HttpServletResponse res){        		
			String pw = (String)req.getSession(false).getAttribute("authPass");
			String num = req.getParameter("no");
			int boardNum = Integer.parseInt(num);
			Article article = new Article();
			article.setNo(boardNum);
			// 삭제할 글에 있는 파일 정보를 가져온다.
			int result;
			if(pw.equals(req.getParameter("pw")))
				result = (Integer)articleDAO.reviewDelete(null, article);
			else
				result = 0;
			
			delete(res, result);
		    return null;
		}
		
		@RequestMapping(value="/review/commentWrite", method=RequestMethod.POST)
		public String reviewCommentWriteProc(HttpServletRequest req){        		
			String no = req.getParameter("no");
			int bNo = Integer.parseInt(no);
			
			Comment comment = new Comment();
			comment.setbNo(bNo);
			comment.setContents(req.getParameter("comment"));
			comment.setWriter((String) req.getSession().getAttribute("authUser"));
			// 파라미터 값을 GuestbookBean에 세팅한다.
			int result = (Integer)articleDAO.reviewCommentInsert(null, comment);
			req.setAttribute("no", bNo);
			req.setAttribute("pageNo", req.getParameter("pNo"));
			if(result>0)
				return "article/review/reviewWriteResult";
			else
				return "article/review/reviewWriteResult";
		}
		
		@RequestMapping(value="/review/commentDelete", method=RequestMethod.GET)
		public String reviewCommentDeleteForm(HttpServletRequest req){
			commentSetNo(req);
	        return "article/review/reviewDeleteComment";
		}
		
		@RequestMapping(value="/review/commentDelete", method=RequestMethod.POST)
		public String reviewCommentDeleteProc(HttpServletRequest req, HttpServletResponse res){        
			
	        Comment comment = new Comment();
			comment.setNo(Integer.parseInt(req.getParameter("no")));
	        int result = (Integer)articleDAO.reviewCommentDelete(null,comment);
	        commentDelete(res, result);
	        return null;    
		}
		
		@RequestMapping(value="/writeTest", method=RequestMethod.POST)
		public String writeTestProc(HttpServletRequest req){        
			
			String cont = req.getParameter("transCont");
			req.setAttribute("cont", cont);
	        return "writeTest";    
		}
}
