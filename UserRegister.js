function employeeIdvalidate()
{
    var value = 0;
    var getNumber = document.getElementById("employeeId").value;
    var bankCode = getNumber.charAt(0)+getNumber.charAt(1)+getNumber.charAt(2);
    var accountCode = getNumber.charAt(3)+getNumber.charAt(4)+getNumber.charAt(5)+getNumber.charAt(6)+getNumber.charAt(7)+getNumber.charAt(8);
    var numOnlyRegex = /^[0-9]+$/;
    if(getNumber.length == 9)
    {
        if(bankCode == "ASP")
        {
            value = 1;
            {
                if(accountCode.match(numOnlyRegex))
                {
                    value = 1;
                }
                else
                {
                    value = 2;
                }
            }
        }
        else if(bankCode != "ASP")
        {
            value = 2;
        }  
    }
    else if(getNumber.length == 0)
    {
        value =0;
    }
    else if(getNumber.length != 9)
    {
        value = 2;
    }
    if(value == 0)
    {
        document.getElementById("employeeIdempty").style="display:block";
        document.getElementById("employeeIdError").style="display:none";
        document.getElementById("employeeId").style="border-color:red";
        return false;
    }
    else if(value == 1)
    {
        document.getElementById("employeeIdError").style="display:none";
        document.getElementById("employeeIdempty").style="display:none";
        document.getElementById("employeeId").style="border-color:limegreen";
        return true;
    }
    else if(value== 2)
    {
        document.getElementById("employeeIdError").style="display:block";
        document.getElementById("employeeIdempty").style="display:none";
        document.getElementById("employeeId").style="border-color:red";
        return false;
    }
}


function userNameValidation()
{
    // /^[a-zA-Z]+ [a-zA-Z]+$/
    var firstNameRegex = /^[a-zA-Z]+$/;
    var firstNameInput = document.getElementById("userName").value;
    if(firstNameInput.length == 0)
    {
        document.getElementById("userName").style="border-color:red";
        document.getElementById("NameEmpty").style.display="block";
        document.getElementById("NameError").style.display="none";
        return false;


    }
    else if(firstNameInput.length <=3)
    {
        document.getElementById("userName").style="border-color:red";
        document.getElementById("NameEmpty").style.display="none";
        document.getElementById("NameLengthError").style.display="block";
        document.getElementById("NameError").style.display="none";
        return false;

    }
    else if(firstNameInput.length > 0)
    {
        if(firstNameInput.match(firstNameRegex))
        {      
            document.getElementById("userName").style="border-color:limegreen";
            document.getElementById("NameEmpty").style.display="none";
            document.getElementById("NameError").style.display="none";
            document.getElementById("NameLengthError").style.display="none";
            return true;


        }
        else
        {
            document.getElementById("userName").style="border-color:red";
            document.getElementById("NameEmpty").style.display="none";
            document.getElementById("NameError").style.display="block";
            return false;
        }
    }
}

function employeeIdConfirmation()
{
    var account1 = document.getElementById("employeeId").value;
    var account2 = document.getElementById("confirmEmployeeId").value;
    if(account2.length <=0)
    {
        document.getElementById("confirmEmployeeIdempty").style="display:block";
        document.getElementById("confirmEmployeeId").style="border-color:red";
        return false;
    }
    else if(account2.length > 0)
    {
        if(account1 == account2)
        {
            document.getElementById("confirmEmployeeIdError").style="display:none";
            document.getElementById("confirmEmployeeId").style="border-color:limegreen";
            document.getElementById("confirmEmployeeIdempty").style="display:none";
            return true;
        }
        else
        {
            document.getElementById("confirmEmployeeIdError").style="display:block";
            document.getElementById("confirmEmployeeId").style="border-color:red";
            document.getElementById("confirmEmployeeIdempty").style="display:none";
            return true;
        }
    }
}


function birthDateValidation()
{
    var birthDateRegex =/(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$/;

    var birthDateInput = document.getElementById("dateOfBirth");
    var dateParts = document.getElementById("dateOfBirth").value;
    var parts = dateParts.split("/");
    var dobParts = new Date(parts[1]+"/"+parts[0]+"/"+parts[2]);
    var currentDate = new Date();
    presentDate = currentDate.getDate();
    var currentYear = currentDate.getFullYear();
    var currentMonth = currentDate.getMonth()+1;
    // alert(currentMonth +" "+presentDate+" "+currentYear);
    
    var birthDate = parseInt(parts[0]);
    var birthMonth = parseInt(parts[1]);
    var birthYear = parseInt(parts[2]);
    // alert(typeof(birthDate));
    // alert(typeof(presentDate));
    // alert(birthMonth+" "+birthDate+" "+birthYear);
    var check = 1;
    if(dateParts.length==0)
    {
            check = 2;
    }
    else if(dateParts.match(birthDateRegex))
    {
        // Age Condition
        if(currentYear - birthYear < 18 && (currentYear - birthYear > 0))
        {
            check = 0;
        }
        // Month Condition
        if(currentYear - birthYear > 18)
        {
            // Leap Year
            if(birthYear%4==0)
            {
                if(birthMonth == 2)
                {
                    if(birthDate == 31||birthDate == 30)
                    {
                        check=0; 
                    }  
                }
                else if(birthMonth == 4 || birthMonth == 6 || birthMonth == 9 || birthMonth == 11)
                {
                    if(birthDate == 31)
                    {
                        check=0;
                    }
                }
            }
            // Non Leap Year
            else if(birthYear%4!=0)
            {
                if(birthMonth == 2)
                {
                    if(birthDate == 29||birthDate == 30||birthDate == 31)
                    {
                        check=0; 
                    }    
                }
                else if(birthMonth == 4 || birthMonth == 6 || birthMonth == 9 || birthMonth == 11)
                {
                    if(birthDate == 31)
                    {
                        check=0;
                    }
                }
            }
        }
        // Future Date Validation
        if(birthYear > currentYear)
        {
            check = 3;
            // console.log(check);
            // alert("Greater Year");
        }
        if(birthYear == currentYear)
        {
            if(birthMonth > currentMonth)
            {
                //alert("Greater Month");
                check = 3;
            }
        }
        if(birthYear == currentYear)
        {
            if(birthMonth == currentMonth)
            {
                if(birthDate > presentDate)
                {
                   // alert("Greater Date");
                    check = 3;
                }
            }
        }
    }
    else if(!(dateParts.match(birthDateRegex)))
    {
        check = 0;
    }
    if(check == 1)
    {
        document.getElementById("FutureDateException").style.display="none";
        document.getElementById("BirthdateEmpty").style.display="none";
        document.getElementById("BirthdateException").style.display="none";
        document.getElementById("dateOfBirth").style="border-color:limegreen";
        return true;
    }
    else if(check == 0)
    {
        document.getElementById("BirthdateException").style.display="block";
        document.getElementById("BirthdateEmpty").style.display="none";
        document.getElementById("FutureDateException").style.display="none";
        document.getElementById("dateOfBirth").style="border-color:red";
        return false;

    }
    else if(check == 2)
    {
            document.getElementById("BirthdateEmpty").style.display="block";
            document.getElementById("BirthdateException").style.display="none";
            document.getElementById("dateOfBirth").style="border-color:red";
            document.getElementById("FutureDateException").style.display="none";
            return false;

    }
    else if(check == 3)
    {
        document.getElementById("FutureDateException").style.display="block";
        document.getElementById("BirthdateException").style.display="none";
        document.getElementById("dateOfBirth").style="border-color:red";
        return false;

    }
}


function emailValidation()
{
    var emailRegex =/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var emailInput = document.getElementById("emailId").value;
    if(emailInput.length <=0)
    {
        document.getElementById("emailEmpty").style.display="block";
        document.getElementById("emailError").style.display="none";
        document.getElementById("emailId").style="border-color:red";
        return false;

    }
    else if(emailInput.length > 0)
    {
        if(emailInput.match(emailRegex))
        {
            document.getElementById("emailId").style="border-color:limegreen";
            document.getElementById("emailError").style.display="none";
            document.getElementById("emailEmpty").style.display="none";
            return true;

        }
        else
        {
            document.getElementById("emailError").style.display="block";
            document.getElementById("emailId").style="border-color:red";
            document.getElementById("emailEmpty").style.display="none";
            return false;

        }
    }
}


function phoneNumberValidtaion()
{
    var phoneRegex = /^\d{10}$/;
    var phoneInput = document.getElementById("mobileNumber").value;
    // alert(phoneInput.charAt(0));
    if(phoneInput.length <=0)
    {
        document.getElementById("mobileNumber").style="border-color:red";
        document.getElementById("MobileError").style.display="none";  
        document.getElementById("mobileEmpty").style.display="block";  
        document.getElementById("FirstMobileError").style.display="none";  
        return false;
    }

    else if(phoneInput.length > 0)
    {
        if(phoneInput.match(phoneRegex))
        {
            if(phoneInput.charAt(0) > 5)
            {
                document.getElementById("mobileNumber").style="border-color:limegreen";
                document.getElementById("MobileError").style.display="none"; 
                document.getElementById("mobileEmpty").style.display="none"; 
                document.getElementById("FirstMobileError").style.display="none";  
                return true; 
            }
            else
            {
                document.getElementById("mobileNumber").style="border-color:red";
                document.getElementById("FirstMobileError").style.display="block";   
                document.getElementById("MobileError").style.display="none";   
                document.getElementById("mobileEmpty").style.display="none"; 
                return false;

            }
        }
        else
        {
            document.getElementById("mobileNumber").style="border-color:red";
            document.getElementById("MobileError").style.display="block";   
            document.getElementById("mobileEmpty").style.display="none";  
            return false;

        }
    }
    
}

function passwordValidation()
{
    var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
    var passwordInput = document.getElementById("Password").value;
    if(passwordInput.length <= 0)
    {
        document.getElementById("PassowrdEmpty").style="display:block";
        document.getElementById("Password").style="border-color:red";
        document.getElementById("PasswordError").style="display:none";
        return false;


    }
    else if(passwordInput.length > 0)
    {
        if(passwordInput.match(passwordRegex))
        {
            document.getElementById("PasswordError").style="display:none";
            document.getElementById("PassowrdEmpty").style="display:none";
            document.getElementById("Password").style="border-color:limegreen";
            return true;
        }
        else
        {
            document.getElementById("PasswordError").style="display:block";
            document.getElementById("Password").style="border-color:red";
            document.getElementById("PassowrdEmpty").style="display:none";
            return false;

        }
    }
}


function passwordConfirmation()
{
    var password1 = document.getElementById("Password").value;
    var password2 = document.getElementById("confirmPassword").value;
    if(password2.length <=0)
    {
        document.getElementById("confirmPasswordEmpty").style="display:block";
        document.getElementById("confirmPassword").style="border-color:red";
        return false;

    }
    else if(password2.length > 0)
    {
        if(password1 == password2)
        {
            document.getElementById("confirmPassword").style="border-color:limegreen";
            document.getElementById("confirmPasswordError").style="display:none";
            document.getElementById("confirmPasswordEmpty").style="display:none";
            return true;
        }
        else
        {
            document.getElementById("confirmPasswordError").style="display:block";
            document.getElementById("confirmPassword").style="border-color:red";
            document.getElementById("confirmPasswordEmpty").style="display:none";
            return false;

        }
    }
}



function userRegister()
{
	var employeeIdValidate = employeeIdvalidate();
	var userNameValidation = userNameValidation();
	var employeeIdConfirmation = employeeIdConfirmation();
	var birthDateValidation = birthDateValidation();
	var emailValidation = emailValidation();
	var phoneNumberValidtaion = phoneNumberValidtaion();
	var passwordValidation = passwordValidation();
	var passwordConfirmation = passwordConfirmation();
	console.log("Hello");
	
	if(employeeIdValidate  && userNameValidation && employeeIdConfirmation && passwordValidation && passwordConfirmation && phoneNumberValidtaion && birthDateValidation && emailValidation)
	{
		return true;
	}
	else
	{
		return false;
	}
}