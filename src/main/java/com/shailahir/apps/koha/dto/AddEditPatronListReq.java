package com.shailahir.apps.koha.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
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

    @NotBlank
    private String name;

    @Size(min = 0, max = 1)
    private String shared;
}
