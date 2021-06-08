package com.chondo.dto;

import javax.persistence.Column;

public class RefundDTO extends AbstractDTO<RefundDTO>{
	private Integer preDayCheckIn;
	
	private Integer percent;

	public Integer getPreDayCheckIn() {
		return preDayCheckIn;
	}

	public void setPreDayCheckIn(Integer preDayCheckIn) {
		this.preDayCheckIn = preDayCheckIn;
	}

	public Integer getPercent() {
		return percent;
	}

	public void setPercent(Integer percent) {
		this.percent = percent;
	}
	
	
}
