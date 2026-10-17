package com.shailahir.apps.koha.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AddEditPatronListReq {

    private String id;
    private String name;
    private String shared;
}
