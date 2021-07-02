package com.chondo.dto;

public class BookedServiceDTO extends AbstractDTO<BookedServiceDTO> {

    private ServiceDTO service;
	
	private Integer free;

	public ServiceDTO getService() {
		return service;
	}

	public void setService(ServiceDTO service) {
		this.service = service;
	}


	public Integer getFree() {
		return free;
	}

	public void setFree(Integer free) {
		this.free = free;
	}
	
	
}
