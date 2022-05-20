package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;
import com.yedam.finalPrj.announcement.service.AnnouncementVO;
import com.yedam.finalPrj.common.FileUtils;
import com.yedam.finalPrj.common.FileVO;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired
	AnnouncementMapper map;

	@Autowired
	FileUtils file;

	/*
	 * @Inject JavaMailSender mailSender;
	 */
	@Override
	public List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging) {
		return map.findAll(paging);
	}

	@Override
	public List<AnnouncementVO> getTopList() {
		return map.getTopList();
	}

	@Override
	public AnnouncementVO findOne(AnnouncementVO announcement) {
		return map.findOne(announcement);
	}

	@Override
	public int totalCnt(AnnouncementPagingCriteria cri) {
		return map.totalCnt(cri);
	}

	@Override
	public int updateView(AnnouncementVO ann) {
		return map.updateView(ann);
	}

	/*
	 * @Override public Announcement annInsert(Announcement announcement) {
	 * 
	 * return map.annInsert(announcement); }
	 */

	@Override
	public void annInsert(AnnouncementVO announcement, MultipartHttpServletRequest filerequest)

			throws IllegalStateException, IOException {

		map.annInsert(announcement);

		List<Map<String, Object>> list = file.parseInsertFileInfo(announcement, filerequest);
		int size = list.size();
		System.out.println("-----------------------size" + size);

		for (int i = 0; i < size; i++) {
			map.annInsertFile(list.get(i));

		}

	}

	@Override
	public void annInsertFile(Map<String, Object> map) {

	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> maps) throws Exception {
		return map.selectFileInfo(maps);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int annNo) throws Exception {
		return map.selectFileList(annNo);
	}

	@Override
	public void fileUpdate(Map<String, Object> maps) {

	}
//
//	@Override
//	public void annUpdate(AnnouncementVO announcement) {
//		map.annUpdate(announcement);
//	}

	@Override
	public void annUpdate(AnnouncementVO announcement, String[] files, String[] fileNames,
			MultipartHttpServletRequest filerequest) throws Exception {

		map.annUpdate(announcement);
		List<Map<String, Object>> list = FileUtils.parseUpdateFileInfo(announcement, files, fileNames, filerequest);
		Map<String, Object> tempMap = null;
		int size = list.size();

		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
//			새로운 파일이면 insert 
//			N이면 update하는 문장
			if (tempMap.get("IS_NEW").equals("Y")) {
				map.annInsertFile(tempMap);
			} else {
				map.fileUpdate(tempMap);
			}
		}
	}

	@Override
	public void fileDelete(FileVO file) {
//		TODO 너무 시간뺏겨서 메일로 잠깐 넘어감 파일 삭제 구현해야함
//		FileUtils.fileDelete(file);
	}

	/*
	 * @Override public String sendMail(EmailVO vo) { try { // 이메일 객체 MimeMessage
	 * msg = mailSender.createMimeMessage();
	 * 
	 * // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	 * msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getReceiveMail()));
	 * 
	 * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
	 * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
	 * 수신자 이메일 주소
	 * 
	 * 
	 * // 보내는 사람(이메일주소+이름) // (발신자, 보내는 사람의 이메일 주소와 이름을 담음) // 이메일 발신자
	 * msg.addFrom(new InternetAddress[] {new InternetAddress(vo.getSenderMail(),
	 * vo.getSenderName())}); msg.setSubject(vo.getSubject(), "UTF-8");
	 * msg.setText(vo.getMessage(), "UTF-8");
	 * 
	 * mailSender.send(msg); } catch (Exception e) {
	 * 
	 * e.printStackTrace();
	 * 
	 * } return "/email/write";
	 * 
	 * 
	 * }
	 */
}