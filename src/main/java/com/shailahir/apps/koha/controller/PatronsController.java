package com.shailahir.apps.koha.controller;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.dto.PatronListResp;
import com.shailahir.apps.koha.service.PatronService;
import com.shailahir.apps.koha.validation.ValidPatronListReq;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/patrons")
public class PatronsController {

    private PatronService patronService;

    // TODO: Add access rules in advice/spring security
    @GetMapping("/list")
    public ResponseEntity<List<PatronListResp>> getPatronLists() {

        List<PatronListResp> respList = this.patronService.getPatronLists();
        return ResponseEntity.ok(respList);
    }

    @PostMapping("/list")
    public ResponseEntity<PatronListResp> addPatronList(
            @RequestBody
            @Valid
            @ValidPatronListReq(mode = "create")
            AddEditPatronListReq patronListReq) {

        PatronListResp resp = this.patronService.addPatronList(patronListReq);
        return ResponseEntity.ok(resp);
    }

    @PutMapping("/list")
    public ResponseEntity<PatronListResp> updatePatronList(
            @RequestBody
            @Valid
            @ValidPatronListReq(mode = "update")
            AddEditPatronListReq patronListReq) {

        PatronListResp resp = this.patronService.updatePatronList(patronListReq);
        return ResponseEntity.ok(resp);
    }

    @Autowired
    public void setPatronService(PatronService patronService) {
        this.patronService = patronService;
    }
}
