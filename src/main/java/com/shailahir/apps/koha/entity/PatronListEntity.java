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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "patron_list_id")
    private long id;

    private String name;

    // TODO: FKEY
    private int owner;

    private int shared;

    @Version
    private int version;

}
