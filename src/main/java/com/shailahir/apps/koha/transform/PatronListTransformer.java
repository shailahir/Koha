package com.shailahir.apps.koha.transform;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.dto.PatronListResp;
import com.shailahir.apps.koha.entity.PatronListEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class PatronListTransformer {

    public PatronListEntity toEntity(AddEditPatronListReq req) {

        if (req == null) {
            return null;
        }

        PatronListEntity entity = new PatronListEntity();

        if (StringUtils.hasLength(req.getId())) {
            try {
                entity.setId(Long.parseLong(req.getId()));
            } catch (NumberFormatException e) {
                entity.setId(null);
            }
        }
        entity.setName(req.getName());
        if ("Y".equals(req.getShared())) {
            entity.setShared(1);
        } else {
            entity.setShared(0);
        }


        return entity;
    }

    public PatronListResp toDto(PatronListEntity entity) {

        if (entity == null) {
            return null;
        }

        PatronListResp resp = new PatronListResp();
        if (entity.getId() != null) {
            resp.setId(entity.getId().toString());
        }
        resp.setName(entity.getName());
        resp.setShared(entity.getShared() == 1 ? "Y" : "N");

        return resp;
    }
}
