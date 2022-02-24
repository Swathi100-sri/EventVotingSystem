function UserIdvalidate()
{
    var value = 0;
    var getNumber = document.getElementById("userNumber").value;
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
        document.getElementById("userempty").style="display:block";
        document.getElementById("errorHighlight").style="display:none";
        document.getElementById("userNumber").style="border-color:red";
        return false;
    }
    else if(value == 1)
    {
        document.getElementById("errorHighlight").style="display:none";
        document.getElementById("userempty").style="display:none";
        document.getElementById("userNumber").style="border-color:limegreen";
        return true;
    }
    else if(value== 2)
    {
        document.getElementById("errorHighlight").style="display:block";
        document.getElementById("userempty").style="display:none";
        document.getElementById("userNumber").style="border-color:red";
        return false;
    }
    
}



function validatePassword()
{
    var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
    var passwordInput = document.getElementById("Password").value;
    if(passwordInput.length <= 0)
    {
        document.getElementById("PasswordEmpty").style="display:block";
        document.getElementById("Password").style="border-color:red";
        return false;
    }
    else if(passwordInput.length > 0)
    {
        if(passwordInput.match(passwordRegex))
        {
            document.getElementById("PasswordHighLight").style="display:none";
            document.getElementById("PasswordEmpty").style="display:none";
            document.getElementById("Password").style="border-color:limegreen";
            return true;
        }
        else
        {
            document.getElementById("PasswordHighLight").style="display:block";
            document.getElementById("Password").style="border-color:red";
            document.getElementById("PasswordEmpty").style="display:none";
            return false;
        }
    }
}

function UserValidate()
{
	var userId = UserIdvalidate();
	var password = validatePassword();
	if ( userId  && password )
	{
		return true;
	}
	else
	{
		return false;
	}
}
