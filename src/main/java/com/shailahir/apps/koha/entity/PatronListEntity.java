package com.shailahir.apps.koha.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "patron_lists")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PatronListEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(
            name = "patronListIdGen",
            sequenceName = "patron_list_id_seq",
            allocationSize = 1
    )
    @Column(name = "patron_list_id")
    private Long id;

    private String name;
    private Integer owner;
    private int shared;

    @Version
    private Integer version;

}
