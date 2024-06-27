package com.ddschool.project.notice.model.dto;

import java.sql.Date;

import com.ddschool.project.member.model.dto.MemberDTO;

public class NoticeDTO {

    private int noticeNo;        // 알림장 번호
    private int dogNo;           // 반려견 번호
    private int noticeWriterCode;    // 작성자 회원 번호
    private MemberDTO noticeWriter;    // 작성자 회원 번호
    private String noticeTitle;  // 알림장 제목
    private String noticeBody;   // 알림장 내용
    private Date createdDate;    // 작성일
    private Date modifiedDate;   // 수정일
    private boolean noticeStatus;    // 알림장 상태 (활성화/비활성화 등)

    public NoticeDTO() {
        super();
    }

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	public int getNoticeWriterCode() {
		return noticeWriterCode;
	}

	public void setNoticeWriterCode(int noticeWriterCode) {
		this.noticeWriterCode = noticeWriterCode;
	}

	public MemberDTO getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(MemberDTO noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeBody() {
		return noticeBody;
	}

	public void setNoticeBody(String noticeBody) {
		this.noticeBody = noticeBody;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public boolean isNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(boolean noticeStatus) {
		this.noticeStatus = noticeStatus;
	}
	
	
	 /**
     * noticeBody에서 첫 번째 이미지의 URL 추출
     *
     * @return noticeBody에서 추출한 첫 번째 이미지의 URL, 이미지가 없을 경우 빈 문자열("")
     */
    public String getFirstImageFromNoticeBody() {
        String body = this.noticeBody;
        String imageUrl = "";

        // 만약 noticeBody에 이미지 태그가 포함되어 있다면
        if (body != null && body.contains("<img")) {
            // 첫 번째 이미지 태그 찾기
            int startIndex = body.indexOf("<img");
            int endIndex = body.indexOf(">", startIndex);
            // Java에서는 indexOf와 같은 메소드를 사용하여 문자열에서 하위 문자열이나 문자를 찾았지만 찾을 수 없으면 -1을 반환
            // startIndex와 endIndex가 모두 -1이 아닌 경우 <img 태그의 시작과 끝이 모두 body 문자열에서 발견되었음을 의미
            if (startIndex != -1 && endIndex != -1) {
                String imgTag = body.substring(startIndex, endIndex + 1);

                // src 속성값 추출
                int srcIndex = imgTag.indexOf("src=\"");
                if (srcIndex != -1) {
                    srcIndex += 5; // URL 시작 위치로 이동
                    int srcEndIndex = imgTag.indexOf("\"", srcIndex);
                    if (srcEndIndex != -1) {
                        imageUrl = imgTag.substring(srcIndex, srcEndIndex);
                    }
                }
            }
        }
        return imageUrl;
    }

	

	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", dogNo=" + dogNo + ", noticeWriterCode=" + noticeWriterCode
				+ ", noticeWriter=" + noticeWriter + ", noticeTitle=" + noticeTitle + ", noticeBody=" + noticeBody
				+ ", createdDate=" + createdDate + ", modifiedDate=" + modifiedDate + ", noticeStatus=" + noticeStatus
				+ ", getNoticeNo()=" + getNoticeNo() + ", getDogNo()=" + getDogNo() + ", getNoticeWriterCode()="
				+ getNoticeWriterCode() + ", getNoticeWriter()=" + getNoticeWriter() + ", getNoticeTitle()="
				+ getNoticeTitle() + ", getNoticeBody()=" + getNoticeBody() + ", getCreatedDate()=" + getCreatedDate()
				+ ", getModifiedDate()=" + getModifiedDate() + ", isNoticeStatus()=" + isNoticeStatus()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

    
    
    
}