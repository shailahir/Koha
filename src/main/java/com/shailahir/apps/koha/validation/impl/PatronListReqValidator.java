package com.shailahir.apps.koha.validation.impl;

import com.shailahir.apps.koha.dto.AddEditPatronListReq;
import com.shailahir.apps.koha.validation.ValidPatronListReq;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.util.StringUtils;

import java.util.HashSet;

public class PatronListReqValidator implements ConstraintValidator<ValidPatronListReq, AddEditPatronListReq> {

    private final MessageSource messageSource;
    private String mode = "create";
    private HashSet<String> allowedSharedValues;

    public PatronListReqValidator(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Override
    public void initialize(ValidPatronListReq constraintAnnotation) {
        this.mode = constraintAnnotation.mode();
        this.allowedSharedValues = new HashSet<>();

        this.allowedSharedValues.add("Y");
        this.allowedSharedValues.add("N");
        this.allowedSharedValues.add("y");
        this.allowedSharedValues.add("n");
    }

    @Override
    public boolean isValid(AddEditPatronListReq value, ConstraintValidatorContext context) {
        context.disableDefaultConstraintViolation();


        if (value == null) {
            String localizedTemplate = this.messageSource.getMessage("patronList.payload.null", null, LocaleContextHolder.getLocale());
            context.buildConstraintViolationWithTemplate(localizedTemplate).addConstraintViolation();
            return false;
        }

        final String UPDATE = "update";

        if (UPDATE.equals(mode) && value.getId() == null) {
            String localizedTemplate = this.messageSource.getMessage("patronList.id.required", null, LocaleContextHolder.getLocale());
            context.buildConstraintViolationWithTemplate(localizedTemplate)
                    .addPropertyNode("id").addConstraintViolation();
            return false;
        }

        if (!StringUtils.hasLength(value.getName())) {
            String localizedTemplate = this.messageSource.getMessage("patronList.name.required", null, LocaleContextHolder.getLocale());
            context.buildConstraintViolationWithTemplate(localizedTemplate)
                    .addPropertyNode("name").addConstraintViolation();
            return false;
        }

        final String shared = value.getShared();

        if (!(shared == null || this.allowedSharedValues.contains(shared))) {
            String localizedTemplate = this.messageSource.getMessage("patronList.shared.invalid", null, LocaleContextHolder.getLocale());
            context.buildConstraintViolationWithTemplate(localizedTemplate)
                    .addPropertyNode("shared").addConstraintViolation();
            return false;
        }
        return true;
    }
}
