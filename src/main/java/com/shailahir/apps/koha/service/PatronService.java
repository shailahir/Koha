package com.shailahir.apps.koha.service;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.dto.PatronListResp;
import jakarta.validation.Valid;

public interface PatronService {
    PatronListResp addPatronList(@Valid AddEditPatronListReq patronListReq);
}
