package com.app.gok.platform.exception;

public class SequenceException extends RuntimeException {

	private static final long serialVersionUID = -8111211522186143260L;
	
	private String errCode;
	private String errMsg;
	
	public SequenceException(String errMsg) {
		this.errMsg = errMsg;
	}
 
	
	public String getErrCode() {
		return errCode;
	}


	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}


	public String getErrMsg() {
		return errMsg;
	}


	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}




}

