package com.shailahir.apps.koha.exception.handler;

import com.shailahir.apps.koha.dto.ApiErrorDto;
import com.shailahir.apps.koha.exception.ItemNotFoundException;
import com.shailahir.apps.koha.exception.NoOwnerDefinedException;
import jakarta.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.HandlerMethodValidationException;
import tools.jackson.core.exc.StreamReadException;

import java.util.List;

@RestControllerAdvice
public class CustomAppExceptionHandler {

    private MessageSource messageSource;

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Object> handleException(MethodArgumentNotValidException ex) {

        ex.getBindingResult().getAllErrors().forEach(error -> {
            System.out.println(error.getDefaultMessage());
        });

        return ResponseEntity.badRequest().body(null);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<Object> handleException(ConstraintViolationException ex) {

        ex.getConstraintViolations().forEach(error -> {
            System.out.println(error.getMessage());
        });

        return ResponseEntity.badRequest().body(null);
    }

    @ExceptionHandler(HandlerMethodValidationException.class)
    public ResponseEntity<List<ApiErrorDto>> handleException(HandlerMethodValidationException ex) {

        List<ApiErrorDto> errors = ex.getAllErrors().stream().map(error ->
                new ApiErrorDto(null, error.getDefaultMessage())).toList();
        return ResponseEntity.badRequest().body(errors);
    }

    @ExceptionHandler(StreamReadException.class)
    public ResponseEntity<Object> handleException(StreamReadException ex) {
        return ResponseEntity.badRequest().body(null);
    }

    @ExceptionHandler(NoOwnerDefinedException.class)
    public ResponseEntity<ApiErrorDto> handleException(NoOwnerDefinedException ex) {

        String value = this.messageSource.getMessage("owner.not.defined", null, LocaleContextHolder.getLocale());
        ApiErrorDto apiErrorDto = new ApiErrorDto(null, value);
        return ResponseEntity.badRequest().body(apiErrorDto);
    }

    @ExceptionHandler(Throwable.class)
    public ResponseEntity<ApiErrorDto> handleException(Throwable ex) {
//        ex.printStackTrace();

        String value = this.messageSource.getMessage("generic.internal.error", null, LocaleContextHolder.getLocale());
        ApiErrorDto apiErrorDto = new ApiErrorDto(null, value);
        return ResponseEntity.internalServerError().body(apiErrorDto);
    }

    @ExceptionHandler(ItemNotFoundException.class)
    public ResponseEntity<ApiErrorDto> handleException(ItemNotFoundException ex) {
        String value = this.messageSource.getMessage("item.not.found", null, LocaleContextHolder.getLocale());
        ApiErrorDto apiErrorDto = new ApiErrorDto(null, value);
        return ResponseEntity.internalServerError().body(apiErrorDto);
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
}
