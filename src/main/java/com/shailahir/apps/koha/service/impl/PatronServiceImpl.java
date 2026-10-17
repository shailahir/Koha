package com.shailahir.apps.koha.service.impl;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.dto.PatronListResp;
import com.shailahir.apps.koha.entity.PatronListEntity;
import com.shailahir.apps.koha.exception.ItemNotFoundException;
import com.shailahir.apps.koha.exception.NoOwnerDefinedException;
import com.shailahir.apps.koha.repository.PatronListRepository;
import com.shailahir.apps.koha.service.PatronService;
import com.shailahir.apps.koha.service.UserService;
import com.shailahir.apps.koha.transform.PatronListTransformer;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
public class PatronServiceImpl implements PatronService {

    private UserService userService;
    private PatronListRepository patronListRepository;
    private PatronListTransformer patronListTransformer;

    @Override
    @Transactional
    public PatronListResp addPatronList(AddEditPatronListReq patronListReq) {

        String ownerId = this.userService.getCurrentLoggedInUser();

        if (!StringUtils.hasLength(ownerId)) {
            throw new NoOwnerDefinedException("");
        }

        PatronListEntity patronListEntity = this.patronListTransformer.toEntity(patronListReq);
        try {
            patronListEntity.setOwner(Integer.parseInt(ownerId));
        } catch (Exception e) {
            patronListEntity.setOwner(null);
        }
        PatronListEntity savedEntity = patronListRepository.save(patronListEntity);

        return this.patronListTransformer.toDto(savedEntity);
    }

    @Override
    @Transactional
    public PatronListResp updatePatronList(AddEditPatronListReq patronListReq) {
        String ownerId = this.userService.getCurrentLoggedInUser();

        long id;
        try {
            id = Long.parseLong(patronListReq.getId());
        } catch (Exception _) {
            throw new RuntimeException("invalid id");
        }

        Optional<PatronListEntity> existing = this.patronListRepository.findById(id);
        if (existing.isEmpty()) {
            throw new ItemNotFoundException("Record not found");
        }

        PatronListEntity patronListEntity = this.patronListTransformer.toEntity(patronListReq);
        try {
            patronListEntity.setOwner(Integer.parseInt(ownerId));
        } catch (Exception e) {
            patronListEntity.setOwner(null);
        }
        PatronListEntity savedEntity = patronListRepository.save(patronListEntity);

        return this.patronListTransformer.toDto(savedEntity);
    }

    @Override
    public List<PatronListResp> getPatronLists() {
        String ownerId = this.userService.getCurrentLoggedInUser();

        long id;
        try {
            id = Long.parseLong(ownerId);
        } catch (Exception _) {
            throw new RuntimeException("invalid id");
        }
        List<PatronListEntity> patronListEntities = this.patronListRepository.findGatedPatronListByOwnerId(id);
        return patronListEntities.stream().map(e -> patronListTransformer.toDto(e)).toList();
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setPatronListRepository(PatronListRepository patronListRepository) {
        this.patronListRepository = patronListRepository;
    }

    @Autowired
    public void setPatronListTransformer(PatronListTransformer patronListTransformer) {
        this.patronListTransformer = patronListTransformer;
    }
}
