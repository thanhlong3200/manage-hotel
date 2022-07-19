package com.chondo.service.impl;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.UpgradeDTO;
import com.chondo.entity.BookedRoomEntity;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.CustomerEntity;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.UpgradeEntity;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.BookingStatusRepository;
import com.chondo.repository.CustomerRepository;
import com.chondo.repository.HotelRepository;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomStatusRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.repository.UpgradeRepository;
import com.chondo.service.IBookingService;
import com.chondo.util.CalculateUtil;
import com.chondo.util.LogUtil;

@Service
public class BookingService implements IBookingService {

	@Autowired
	private BookingRepository bookingRepository;

	@Autowired
	private BookingStatusRepository bookingStatusRepository;

	@Autowired
	private RoomTypeRepository roomTypeRepository;

	@Autowired
	private HotelRepository hotelRepository;

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private RoomRepository roomRepository;

	@Autowired
	private RoomStatusRepository roomStatusRepository;

	@Autowired
	private UpgradeRepository upgradeRepository;

	@Override
	@Transactional
	public BookingDTO save(BookingDTO booking) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = new BookingEntity();
		if (booking.getCode() != null) {
			bookingEntity = bookingRepository.findOneByCode(booking.getCode());

			changeStatus(bookingEntity, "cancel");

			List<BookedRoomEntity> bookedRoomEntities = bookingEntity.getBookedRooms();
			List<BookedRoomDTO> bookedRoomDTOs = modelMapper.map(bookedRoomEntities,
					new TypeToken<List<BookedRoomDTO>>() {
					}.getType());
			for (BookedRoomDTO bookedRoomDTO : bookedRoomDTOs) {
				changeRoomStatus(bookedRoomDTO, "available");
			}

			bookingEntity.setLogs(bookingEntity.getLogs() + LogUtil.createLog("cancel"));
		} else {
			modelMapper.getConfiguration().setAmbiguityIgnored(true);
			bookingEntity = modelMapper.map(booking, BookingEntity.class);

			CustomerEntity customerEntity = customerRepository.findOne(booking.getCustomer().getId());
			bookingEntity.setCustomer(customerEntity);

			bookingEntity.setCode(getCode() + bookingRepository.count());
			changeStatus(bookingEntity, "booked");

			bookingEntity.setRoomType(roomTypeRepository.findOne(booking.getRoomType().getId()));
			bookingEntity.setHotel(hotelRepository.findOneByLocationAndStatus(booking.getHotel().getLocation(), 1));
			bookingEntity.setUpgraded(0);

			bookingEntity.setLogs(LogUtil.createLog("booked"));

		}

		bookingEntity = bookingRepository.save(bookingEntity);
		BookingDTO bookingDTO = modelMapper.map(bookingEntity, BookingDTO.class);
		if (booking.getIds() != null) {
			bookingDTO.setIds(booking.getIds());
		}
		return bookingDTO;
	}

	public BookingDTO sign(BookingDTO booking) {
		ModelMapper mapper = new ModelMapper();
		mapper.getConfiguration().setAmbiguityIgnored(true);

		BookingEntity entity = bookingRepository.findOneByCode(booking.getCode());
		entity = mapper.map(booking, BookingEntity.class);

		entity = bookingRepository.save(entity);

		return mapper.map(entity, BookingDTO.class);
	}

	private void changeStatus(BookingEntity bookingEntity, String code) {
		bookingEntity.setStatus(bookingStatusRepository.findOneByCode(code));
	}

	private void changeRoomStatus(BookedRoomDTO bookedRoomDTO, String code) {
		RoomEntity roomEntity = roomRepository.findOne(bookedRoomDTO.getRoom().getId());
		roomEntity.setStatus(roomStatusRepository.findOneByCode(code));
		roomRepository.save(roomEntity);
	}

	private String getCode() {
		SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyy");
		Date date = new Date();
		return formatter.format(date);
	}

	@Override
	public BookingDTO findOne(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOne(id);
		return modelMapper.map(bookingEntity, BookingDTO.class);
	}

	@Override
	public BookingDTO findOneByCode(String bookingCode) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOneByCode(bookingCode);
		if (bookingEntity != null) {
			return modelMapper.map(bookingEntity, BookingDTO.class);
		} else
			return null;
	}

	@Override
	public BookingDTO findOneByBookedRoomsId(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOneByBookedRoomsId(id);
		return modelMapper.map(bookingEntity, BookingDTO.class);
	}

	@Override
	public BookingDTO changeStatus(BookingDTO booking, String code) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOne(booking.getId());

		changeStatus(bookingEntity, code);

		bookingEntity.setLogs(bookingEntity.getLogs() + LogUtil.createLog(code));
		bookingRepository.save(bookingEntity);
		return modelMapper.map(bookingEntity, BookingDTO.class);
	}

	@Override
	public List<BookingDTO> findAll(Pageable pageable) {
		List<BookingEntity> entities = bookingRepository.findAllByOrderByCreatedDateDesc(pageable);
		ModelMapper modelMapper = new ModelMapper();
		List<BookingDTO> dtos = modelMapper.map(entities, new TypeToken<List<BookingDTO>>() {
		}.getType());
		return dtos;
	}

	@Override
	public Integer count() {
		return (int) bookingRepository.count();
	}

	@Override
	public List<BookingDTO> getBookingOfRoom(Integer number) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookingEntity> entities = bookingRepository.getBookingOfRoom(number);
		List<BookingDTO> bookings = modelMapper.map(entities, new TypeToken<List<BookingDTO>>() {
		}.getType());
		return bookings;
	}

	@Override
	public void setPrice(BookingDTO booking) {
		Long countNight = CalculateUtil.countNight(booking.getDateFrom(), booking.getDateTo());

		Integer roomCount = booking.getRoomCount();

		booking.setNightCount(countNight);

		Long diffDateCheckout = CalculateUtil.countNight(new Date(), booking.getDateTo());

		ModelMapper modelMapper = new ModelMapper();

		Long priceService = 0L;
		Long priceServiceFree = 0L;
		List<BookedRoomDTO> bookedRoomDTOs = booking.getBookedRooms();
		for (BookedRoomDTO bookedRoomDTO : bookedRoomDTOs) {
			List<BookedServiceDTO> bookedServiceDTOs = bookedRoomDTO.getBookedServices();
			for (BookedServiceDTO bookedServiceDTO : bookedServiceDTOs) {
				if (bookedServiceDTO.getFree() == 0) {
					priceService += bookedServiceDTO.getService().getPrice();
				} else {
					priceServiceFree += bookedServiceDTO.getService().getPrice();
				}
			}
		}
		booking.setPriceService(priceService);
		booking.setPriceServiceFree(priceServiceFree);

		UpgradeEntity upgradeEntity = upgradeRepository.findOneByBookingId(booking.getId());
		Long originalPrice = 0L;
		Long sellPrice = 0L;
		if (upgradeEntity != null) {
			UpgradeDTO upgradeDTO = modelMapper.map(upgradeEntity, UpgradeDTO.class);
			if (upgradeDTO.getFree() == 0) {
				RoomTypeDTO roomTypeDTO = modelMapper.map(upgradeEntity.getInitRoomType(), RoomTypeDTO.class);
				booking.setOriginalPriceUpgrade(CalculateUtil.totalPrice(roomCount,
						booking.getRoomType().getOriginalPrice() - roomTypeDTO.getOriginalPrice(), countNight));
				booking.setSellPriceUpgrade(CalculateUtil.totalPrice(roomCount,
						booking.getRoomType().getSellPrice() - roomTypeDTO.getSellPrice(), countNight));
			} else {
				booking.setOriginalPriceUpgrade(0L);
				booking.setSellPriceUpgrade(0L);
			}
			originalPrice = upgradeDTO.getInitRoomType().getOriginalPrice();
			sellPrice = upgradeDTO.getInitRoomType().getSellPrice();
			booking.setOriginalPriceBooked(CalculateUtil.totalPrice(roomCount, originalPrice, countNight));
			booking.setSellPriceBooked(CalculateUtil.totalPrice(roomCount, sellPrice, countNight));
			booking.setTotalPrice(
					booking.getSellPriceBooked() + booking.getSellPriceUpgrade() + booking.getPriceService());
		} else {
			originalPrice = booking.getRoomType().getOriginalPrice();
			sellPrice = booking.getRoomType().getSellPrice();
			booking.setOriginalPriceBooked(CalculateUtil.totalPrice(roomCount, originalPrice, countNight));
			booking.setSellPriceBooked(CalculateUtil.totalPrice(roomCount, sellPrice, countNight));
			booking.setTotalPrice(booking.getSellPriceBooked() + booking.getPriceService());
		}
		if (diffDateCheckout >= 2) {
			booking.setRefund(true);
			booking.setTotalPrice(booking.getTotalPrice() / 2);
		}

	}

	@Override
	public List<BookingDTO> findByStatusCode(String statusCode, Pageable pageable) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookingEntity> entities = bookingRepository.findByStatusCode(statusCode, pageable);
		List<BookingDTO> bookings = modelMapper.map(entities, new TypeToken<List<BookingDTO>>() {
		}.getType());
		return bookings;
	}

	@Override
	public List<BookingDTO> findByCustomerId(Long id, Pageable pageable) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookingEntity> entities = bookingRepository.findByCustomerId(id, pageable);
		System.out.println("List " + entities);
		List<BookingDTO> bookings = modelMapper.map(entities, new TypeToken<List<BookingDTO>>() {
		}.getType());
		return bookings;
	}

	@Override
	public double countByStatusCode(String code) {
		return bookingRepository.countByStatusCode(code);
	}

	@Override
	public void createLog(String bookingCode, String logCode) {
		BookingEntity bookingEntity = bookingRepository.findOneByCode(bookingCode);
		bookingEntity.setLogs(bookingEntity.getLogs() + LogUtil.createLog(logCode));
		bookingRepository.save(bookingEntity);
	}

	@Override
	public List<BookingDTO> findByDateFromAndStatusCode(Date dateFilter, String status, Pageable pageable) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookingEntity> entities = bookingRepository.findByDateFromAndStatusCode(dateFilter, status, pageable);
		List<BookingDTO> bookings = modelMapper.map(entities, new TypeToken<List<BookingDTO>>() {
		}.getType());
		return bookings;
	}

	@Override
	public List<BookingDTO> findByDateToAndStatusCode(Date dateFilter, String status, Pageable pageable) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookingEntity> entities = bookingRepository.findByDateToAndStatusCode(dateFilter, status, pageable);
		List<BookingDTO> bookings = modelMapper.map(entities, new TypeToken<List<BookingDTO>>() {
		}.getType());
		return bookings;
	}

	@Override
	public double countByDateToAndStatusCode(Date dateFilter, String statusCode) {
		return bookingRepository.countByDateToAndStatusCode(dateFilter, statusCode);
	}

	@Override
	public double countByDateFromAndStatusCode(Date dateFilter, String statusCode) {
		return bookingRepository.countByDateFromAndStatusCode(dateFilter, statusCode);
	}

	@Override
	public BookingDTO extend(BookingDTO booking) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOneByCode(booking.getCode());

		bookingEntity.setDateTo(booking.getDateTo());

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		String currentTime = formatter.format(date);

		long dateExtend = CalculateUtil.countNight(bookingEntity.getDateTo(), booking.getDateTo());
		bookingEntity.setLogs(bookingEntity.getLogs() + "Extend " + dateExtend + " day, rooms: "
				+ Arrays.toString(booking.getIds()) + " " + currentTime + "</br>");

		bookingRepository.save(bookingEntity);

		return modelMapper.map(bookingEntity, BookingDTO.class);
	}

	@Override
	public List<BookingDTO> findByBookedRoomsCustomersCmnd(String cmnd) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookingEntity> entities = bookingRepository.findByBookedRoomsCustomersCmnd(cmnd);
		List<BookingDTO> bookings = modelMapper.map(entities, new TypeToken<List<BookingDTO>>() {
		}.getType());
		return bookings;
	}

}
