package com.shailahir.apps.koha.repository;

import com.shailahir.apps.koha.entity.PatronListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PatronListRepository extends JpaRepository<PatronListEntity, Long> {

    @Query("SELECT p FROM PatronListEntity p WHERE p.owner = :ownerId or p.shared = 1")
    List<PatronListEntity> findGatedPatronListByOwnerId(@Param("ownerId") Long ownerId);
}
