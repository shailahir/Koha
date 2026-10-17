package com.shailahir.apps.koha.service;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.dto.PatronListResp;

public interface PatronService {
    PatronListResp addPatronList(AddEditPatronListReq patronListReq);

    PatronListResp updatePatronList(AddEditPatronListReq patronListReq);
}
