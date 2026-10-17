package com.shailahir.apps.koha.service.impl;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.dto.PatronListResp;
import com.shailahir.apps.koha.entity.PatronListEntity;
import com.shailahir.apps.koha.exception.NoOwnerDefinedException;
import com.shailahir.apps.koha.repository.PatronListRepository;
import com.shailahir.apps.koha.service.PatronService;
import com.shailahir.apps.koha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class PatronServiceImpl implements PatronService {

    private UserService userService;
    private PatronListRepository patronListRepository;

    @Override
    public PatronListResp addPatronList(AddEditPatronListReq patronListReq) {

        String ownerId = this.userService.getCurrentLoggedInUser();

        if (!StringUtils.hasLength(ownerId)) {
            throw new NoOwnerDefinedException();
        }

        if (!StringUtils.hasLength(patronListReq.getName())) {
            throw new RuntimeException("No list name passed in!");
        }

        PatronListEntity patronListEntity = new PatronListEntity();
        patronListEntity.setName(patronListReq.getName());
        patronListEntity.setOwner(Integer.parseInt(ownerId));

        if (StringUtils.hasLength(patronListReq.getShared()) && "Y".equalsIgnoreCase(patronListReq.getShared())) {
            patronListEntity.setShared(1);
        } else {
            patronListEntity.setShared(0);
        }

        PatronListEntity savedEntity = patronListRepository.save(patronListEntity);

        PatronListResp patronListResp = new PatronListResp();
        patronListResp.setId(String.valueOf(savedEntity.getId()));
        patronListResp.setName(savedEntity.getName());
        patronListResp.setShared(savedEntity.getShared() == 1 ? "Y" : "N");
        
        return patronListResp;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
