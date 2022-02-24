function LoginadminNumbervalidate()
{
    var value = 0;
    var getNumber = document.getElementById("adminNumber").value;
    var empCode = getNumber.charAt(0)+getNumber.charAt(1)+getNumber.charAt(2);
    var idCode = getNumber.charAt(3)+getNumber.charAt(4)+getNumber.charAt(5)+getNumber.charAt(6);
    var numOnlyRegex = /^[0-9]+$/;
    if(getNumber.length == 7)
    {
        if(empCode == "ASD")
        {
            value = 1;
            {
                if(idCode.match(numOnlyRegex))
                {
                    value = 1;
                }
                else
                {
                    value = 2;
                }
            }
        }
        else if(empCode != "ASD")
        {
            value = 2;
        }  
    }
    else if(getNumber.length == 0)
    {
        value =0;
    }
    else if(getNumber.length != 7)
    {
        value = 2;
    }
    if(value == 0)
    {
        document.getElementById("adminempty").style="display:block";
        document.getElementById("errorHighlight").style="display:none";
        document.getElementById("adminNumber").style="border-color:red";
        return false;
    }
    else if(value == 1)
    {
        document.getElementById("errorHighlight").style="display:none";
        document.getElementById("adminempty").style="display:none";
        document.getElementById("adminNumber").style="border-color:limegreen";
        return true;
    }
    else if(value== 2)
    {
        document.getElementById("errorHighlight").style="display:block";
        document.getElementById("adminempty").style="display:none";
        document.getElementById("adminNumber").style="border-color:red";
        return false;
    }
    
}