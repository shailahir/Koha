package com.shailahir.apps.koha.repository;

import com.shailahir.apps.koha.entity.PatronListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatronListRepository extends JpaRepository<PatronListEntity, Long> {
}
