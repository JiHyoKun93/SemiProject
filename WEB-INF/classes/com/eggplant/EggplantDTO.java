package com.eggplant;

public class EggplantDTO {
	
	//가지은행
	private String userId;
	private String userPassword;
	private String userName;
	private String userAddr;
	private String userPhoneNum;
	private String userEmail;
	private String userBirth;
	private String userDate;
	//은행정보
	private String account;
	private String creditPassword;
	private int property;
	private int loans;
	private int savings;
	private int points;
	private String grade;
	//계좌내역
	private int inout;
	private String whereuse;
	private String transactionsDate;

	
	
	// 추가된 부분
	private String transactionsAfter;
	private String transactionsBefore;
	
	
	
	//질문 게시판
	private String title;
	private String subject;
	private String content1;
	private String content2;
	private String content3;
	
	private String cboardContent;
	
	private String created;
	private String deadline;
	
	// 송금 테이블
	private String targetBank;
	private String targetName;
	private String targetAccount;
	private int sendSaving;
	private String sendTime;
	
	public String getTargetBank() {
		return targetBank;
	}
	public void setTargetBank(String targetBank) {
		this.targetBank = targetBank;
	}
	public String getTargetName() {
		return targetName;
	}
	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}
	public String getTargetAccount() {
		return targetAccount;
	}
	public void setTargetAccount(String targetAccount) {
		this.targetAccount = targetAccount;
	}
	public int getSendSaving() {
		return sendSaving;
	}
	public void setSendSaving(int sendSaving) {
		this.sendSaving = sendSaving;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserPhoneNum() {
		return userPhoneNum;
	}
	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getCreditPassword() {
		return creditPassword;
	}
	public void setCreditPassword(String creditPassword) {
		this.creditPassword = creditPassword;
	}
	public int getProperty() {
		return property;
	}
	public void setProperty(int property) {
		this.property = property;
	}
	public int getLoans() {
		return loans;
	}
	public void setLoans(int loans) {
		this.loans = loans;
	}
	public int getSavings() {
		return savings;
	}
	public void setSavings(int savings) {
		this.savings = savings;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getInout() {
		return inout;
	}
	public void setInout(int inout) {
		this.inout = inout;
	}
	public String getWhereuse() {
		return whereuse;
	}
	public void setWhereuse(String whereuse) {
		this.whereuse = whereuse;
	}
	public String getTransactionsDate() {
		return transactionsDate;
	}
	public void setTransactionsDate(String transactionsDate) {
		this.transactionsDate = transactionsDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getContent3() {
		return content3;
	}
	public void setContent3(String content3) {
		this.content3 = content3;
	}
	public String getCboardContent() {
		return cboardContent;
	}
	public void setCboardContent(String cboardContent) {
		this.cboardContent = cboardContent;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getTransactionsAfter() {
		return transactionsAfter;
	}
	public void setTransactionsAfter(String transactionsAfter) {
		this.transactionsAfter = transactionsAfter;
	}
	public String getTransactionsBefore() {
		return transactionsBefore;
	}
	public void setTransactionsBefore(String transactionsBefore) {
		this.transactionsBefore = transactionsBefore;
	}
	
	
	
	
}
