package com.eggplant;

import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.util.DBConn;

@WebListener
public class ScheduledReservation implements ServletContextListener {

	ScheduledExecutorService service = Executors.newScheduledThreadPool(5);

	Connection conn = DBConn.getConnection();
	ReservationDAO dao = new ReservationDAO(conn);

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("스케쥴러 시작");
		run();
	}

	public void run() {
		// 스케쥴러 등록
		Runnable runnable = new Runnable() {
			List<EggplantDTO> lists = new ArrayList<EggplantDTO>();

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

			@Override
			public void run() {
				try {
					LocalDateTime currentTime = LocalDateTime.now();
					// System.out.println(currentTime);
					String cTime = currentTime.format(formatter);
//					System.out.println(cTime);
					// DB에서 현재시간보다 이전시간들 list에 담아옴

					lists = dao.getReservationLists(cTime);
					
					if (lists != null || !lists.isEmpty()) {
						Iterator<EggplantDTO> it = lists.iterator();
						// System.out.println("스케쥴러 시작");

						// list를 가져올때 현재 시간보다 작은, 처리해야할 시간만 가져오기.
						while (it.hasNext()) {

							EggplantDTO dto = it.next();

							int senderSaving = dao.getReadAccountSavings(dto.getAccount());
							int targetSaving = dao.getReadAccountSavings(dto.getTargetAccount());

							// 입금 처리
							LocalDateTime sendTime = LocalDateTime.parse(dto.getSendTime(), formatter);
							if (sendTime.isBefore(currentTime)) {
								// 입금 전 target 데이터 가져오기
								// String account, String targetName, String sendTime, int saving, int
								// sendSaving

								// System.out.println("입금 실행");
								// 입금 실행
								dao.updateReservation(dto.getAccount(), dto.getTargetAccount(), dto.getSendSaving());
								// 계좌 내역 추가 보내는이
								dao.insertTransactions(dto.getAccount(), dto.getTargetName(), dto.getSendTime(),
										senderSaving, dto.getSendSaving());
								// 계좌 내역 추가 받는이
								dao.insertTransactionsTarget(dto.getTargetAccount(), dto.getUserName(),
										dto.getSendTime(), targetSaving, dto.getSendSaving());
								// System.out.println("입금 끝");
								// 스케쥴 돌아가는 DB에서 제거
								dao.deleteReservation(dto.getAccount(), dto.getSendTime());

							}
						}
					}

				} catch (Exception e) {
					System.out.println(e.toString());
				}
			}
		};

		service.scheduleWithFixedDelay(runnable, 0, 1, TimeUnit.SECONDS);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		service.shutdown();
		System.out.println("스케쥴러 종료");
	}

}
