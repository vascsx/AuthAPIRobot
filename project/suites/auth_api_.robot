*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Library    JSONLibrary
Resource   ../testcases/register_tests.robot

*** Test Cases ***

Test Register User Successfully
    Register User Successfully

Test Register User with Empty Fullname
    Register User with Empty Fullname

Test Register User with Empty Email
    Register User with Empty Email

Test Register User with Empty Password
    Register User with Empty Password

Test Register User with Invalid FullName
    Register User with Invalid FullName

Test Register User with Invalid Email
    Register User with Invalid Email

Test Register User with Invalid Password
    Register User with Invalid Password

Test Register User Already Registered
    Register User Already Registered