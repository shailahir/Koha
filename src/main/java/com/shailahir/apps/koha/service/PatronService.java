package com.shailahir.apps.koha.service;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.dto.PatronListResp;

import java.util.List;

public interface PatronService {
    PatronListResp addPatronList(AddEditPatronListReq patronListReq);

    PatronListResp updatePatronList(AddEditPatronListReq patronListReq);

    List<PatronListResp> getPatronLists();
}
