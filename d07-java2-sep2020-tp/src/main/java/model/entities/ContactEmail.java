/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entities;

/**
 *
 * @author abrossea
 */
public class ContactEmail {

    private String fullName;
    private String email;
    private String phoneNumber;
    private String contactMethod;
    private String contactTime;
    private Boolean isComment;
    private String message;

    public ContactEmail() {
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setContactMethod(String contactMethod) {
        this.contactMethod = contactMethod;
    }

    public void setContactTime(String contactTime) {
        this.contactTime = contactTime;
    }

    public void setIsComment(Boolean isComment) {
        this.isComment = isComment;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getContactMethod() {
        return contactMethod;
    }

    public String getContactTime() {
        return contactTime;
    }

    public Boolean getIsComment() {
        return isComment;
    }

    public String getMessage() {
        return message;
    }

    @Override
    public String toString() {  
       return "<p>" + this.fullName + "</br>" + this.email + "</br>" + this.phoneNumber + "</br>" + "Contact method: "+
       this.contactMethod + "</br>" +"</br>"+ this.message + "</br>" + "</br>" +"Contact time:"+ this.contactTime + 
       "</br>" + "</p>";
 
    }
}
