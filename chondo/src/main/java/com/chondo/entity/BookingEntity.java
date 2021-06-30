package com.chondo.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bookings")
public class BookingEntity extends BaseEntity {
	
	@Column
	private String code;
	
	@Column(name = "date_from")
	private Date dateFrom;
	
	@Column (name = "date_to")
	private Date dateTo;
	
	@Column (name = "room_count")
	private Integer roomCount;
	
	@Column(name = "adult")
	private Integer adult;
	
	@Column(name = "children")
	private Integer children;
	
	@Column
	private Integer upgraded;
	
	@Column
	private String logs;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private UserEntity user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customer_id")
	private CustomerEntity customer;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hotel_id")
	private HotelEntity hotel;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private BookingStatusEntity status;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_type_id")
    private RoomTypeEntity roomType;
	
	@OneToMany(mappedBy = "booking")
	private List<BookedRoomEntity> bookedRooms = new ArrayList<BookedRoomEntity>();
	
	@OneToMany(mappedBy = "booking")
	private List<PaymentEntity> payments = new ArrayList<PaymentEntity>();
	
	@OneToOne(mappedBy = "booking")
	private BillEntity bill;
	
	@OneToOne(mappedBy = "booking")
	private UpgradeEntity upgrade;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public Integer getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(Integer roomCount) {
		this.roomCount = roomCount;
	}

	public Integer getAdult() {
		return adult;
	}

	public void setAdult(Integer adult) {
		this.adult = adult;
	}

	public Integer getChildren() {
		return children;
	}

	public void setChildren(Integer children) {
		this.children = children;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public CustomerEntity getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerEntity customer) {
		this.customer = customer;
	}

	public HotelEntity getHotel() {
		return hotel;
	}

	public void setHotel(HotelEntity hotel) {
		this.hotel = hotel;
	}

	public BookingStatusEntity getStatus() {
		return status;
	}

	public void setStatus(BookingStatusEntity status) {
		this.status = status;
	}

	public RoomTypeEntity getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomTypeEntity roomType) {
		this.roomType = roomType;
	}

	public List<BookedRoomEntity> getBookedRooms() {
		return bookedRooms;
	}

	public void setBookedRooms(List<BookedRoomEntity> bookedRooms) {
		this.bookedRooms = bookedRooms;
	}

	public List<PaymentEntity> getPayments() {
		return payments;
	}

	public void setPayments(List<PaymentEntity> payments) {
		this.payments = payments;
	}

	public BillEntity getBill() {
		return bill;
	}

	public void setBill(BillEntity bill) {
		this.bill = bill;
	}

	public Integer getUpgraded() {
		return upgraded;
	}

	public void setUpgraded(Integer upgraded) {
		this.upgraded = upgraded;
	}

	public UpgradeEntity getUpgrade() {
		return upgrade;
	}

	public void setUpgrade(UpgradeEntity upgrade) {
		this.upgrade = upgrade;
	}

	public String getLogs() {
		return logs;
	}

	public void setLogs(String logs) {
		this.logs = logs;
	}
	
	
		
}
