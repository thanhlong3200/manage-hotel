package com.chondo.dto;

public class StaffTaskDTO extends AbstractDTO<StaffTaskDTO>{
	 private StaffDTO staff;
		
	 private TaskDTO task;
	 
	 private RoomDTO room;
	 
	 private Integer done;

	public RoomDTO getRoom() {
		return room;
	}

	public void setRoom(RoomDTO room) {
		this.room = room;
	}

	public StaffDTO getStaff() {
		return staff;
	}

	public void setStaff(StaffDTO staff) {
		this.staff = staff;
	}

	public TaskDTO getTask() {
		return task;
	}

	public void setTask(TaskDTO task) {
		this.task = task;
	}

	public Integer getDone() {
		return done;
	}

	public void setDone(Integer done) {
		this.done = done;
	}
	 
	 
}
