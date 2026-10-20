package com.shailahir.apps.koha.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "borrowers")
public class BorrowersEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(
            name = "borrowerIdGen",
            sequenceName = "borrower_id_seq",
            allocationSize = 1
    )
    @Column(name = "borrowernumber")
    private Long borrowerNumber;

    @Column(name = "cardnumber", length = 32)
    private String cardNumber;

    @Column(name = "surname")
    private String surname;

    @Column(name = "firstname")
    private String firstName;

    @Column(name = "preferred_name")
    private String preferredName;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "title")
    private String title;

    @Column(name = "othernames")
    private String otherNames;

    @Column(name = "initials")
    private String initials;

    @Column(name = "pronouns")
    private String pronouns;

    @Column(name = "streetnumber")
    private String streetNumber;

    @Column(name = "streettype")
    private String streetType;

    @Column(name = "address")
    private String address;

    @Column(name = "address2")
    private String address2;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "zipcode")
    private String zipcode;

    @Column(name = "country")
    private String country;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "mobile")
    private String mobile;

    @Column(name = "fax")
    private String fax;

    @Column(name = "emailpro")
    private String emailPro;

    @Column(name = "phonepro")
    private String phonePro;

    @Column(name = "B_streetnumber")
    private String bStreetNumber;

    @Column(name = "B_streettype")
    private String bStreetType;

    @Column(name = "B_address")
    private String bAddress;

    @Column(name = "B_address2")
    private String bAddress2;

    @Column(name = "B_city")
    private String bCity;

    @Column(name = "B_state")
    private String bState;

    @Column(name = "B_zipcode")
    private String bZipcode;

    @Column(name = "B_country")
    private String bCountry;

    @Column(name = "B_email")
    private String bEmail;

    @Column(name = "B_phone")
    private String bPhone;

    @Column(name = "dateofbirth")
    private String dateOfBirth;

    @Column(name = "branchcode", length = 10)
    private String branchCode = "";

    @Column(name = "categorycode", length = 10)
    private String categoryCode = "";

    @Column(name = "dateenrolled")
    private LocalDateTime dateEnrolled;

    @Column(name = "dateExpiry")
    private LocalDateTime dateExpiry;

    @Column(name = "password_expiration_date")
    private LocalDateTime passwordExpirationDate;

    @Column(name = "date_renewed")
    private LocalDateTime dateRenewed;

    @Column(name = "gonenoaddress")
    private String goNenoAddress;

    @Column(name = "lost")
    private int lost;

    @Column(name = "debarred")
    private LocalDateTime debarred;

    @Column(name = "debarredcomment")
    private String debarredComment;

    @Column(name = "contactname")
    private String contactName;

    @Column(name = "contactfirstname")
    private String contactFirstName;

    @Column(name = "contacttitle")
    private String contactTitle;

    @Column(name = "borrowernotes")
    private String borrowerNotes;

    @Column(name = "relationship", length = 100)
    private String relationship;

    @Column(name = "sex", length = 1)
    private String sex;

    @Column(name = "password")
    private String password;

    @Column(name = "secret")
    private String secret;

    @Column(name = "auth_method", length = 20)
    private String authMethod = "password";

    @Column(name = "flags")
    private String flags;

    @Column(name = "userid", length = 75)
    private String userId;

    @Column(name = "opacnote")
    private String opacnote;

    @Column(name = "contactnote")
    private String contactNote;

    @Column(name = "sort1", length = 80)
    private String sort1;

    @Column(name = "sort2", length = 80)
    private String sort2;

    @Column(name = "altcontactfirstname")
    private String altContactFirstName;

    @Column(name = "altcontactsurname")
    private String altContactSurname;

    @Column(name = "altcontactaddress1")
    private String altContactAddress1;

    @Column(name = "altcontactaddress2")
    private String altContactAddress2;

    @Column(name = "altcontactaddress3")
    private String altContactAddress3;

    @Column(name = "altcontactstate")
    private String altContactState;

    @Column(name = "altcontactzipcode")
    private String altContactZipcode;

    @Column(name = "altcontactcountry")
    private String altContactCountry;

    @Column(name = "altcontactphone")
    private String altContactPhone;

    @Column(name = "smsalertnumber", length = 50)
    private String smsAlertNumber;

    @Column(name = "sms_provider_id")
    private Integer smsProviderId;

    @Column(name = "privacy")
    private Integer privacy = 1;

    @Column(name = "privacy_gurantor_fines")
    private Integer privacyGurantorFines = 0;

    @Column(name = "privacy_guarantor_checkouts")
    private Integer privacyGuarantorCheckouts = 0;

    @Column(name = "checkprevcheckout", length = 10)
    private String checkPrevCheckout = "inherit";

    @Column(name = "updated_on")
    private LocalDateTime updatedOn;

    @Column(name = "lastseen")
    private LocalDateTime lastSeen;

    @Column(name = "lang", length = 25)
    private String lang = "default";

    @Column(name = "login_attempts")
    private Integer loginAttempts = 0;

    @Column(name = "override_auth_token")
    private String overrideAuthToken;

    @Column(name = "anonymized")
    private Integer anonymized = 0;

    @Column(name = "autorenew_checkouts")
    private Integer autorenewCheckouts = 1;

    @Column(name = "primary_contact_method", length = 45)
    private String primaryContactMethod;

    @Column(name = "protected")
    private Integer protectedBorrower = 0;

    @Version
    private Integer version;
}
