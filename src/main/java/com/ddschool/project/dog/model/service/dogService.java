package com.ddschool.project.dog.model.service;
import com.ddschool.project.dog.model.dao.dogDAO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.common.mybatis.Template;
import java.util.List;

public class dogService {

	private dogDAO dogDAO;
	private Template template;


    public DogService() {
        this.dogDAO = new DogDAO(); // DogDAO 인스턴스 생성 (예제에서는 단순히 생성하는 방식으로)
    }

    // 반려견 등록 메서드
    public boolean insertDog(DogDTO dogDTO) {
        return dogDAO.insertDog(dogDTO); // DogDAO에게 반려견 등록 요청 전달
    }

    // 반려견 조회 메서드
    public List<DogDTO> selectDog() {
        return dogDAO.selectAllDogs(); // 모든 반려견 리스트를 가져오는 메서드 호출
    }

    // 반려견 상세 조회 메서드
    public DogDTO getDogById(int dogId) {
        return dogDAO.getDogById(dogId); // 반려견 ID로 조회하는 메서드 호출
    }

    // 반려견 수정 메서드
    public boolean updateDog(DogDTO dogDTO) {
        return dogDAO.updateDog(dogDTO); // DogDAO에게 반려견 수정 요청 전달
    }

    // 반려견 삭제 메서드
    public boolean deleteDog(int dogId) {
        return dogDAO.deleteDog(dogId); // 반려견 삭제 요청을 DogDAO에게 전달
    }
	
	
}





}