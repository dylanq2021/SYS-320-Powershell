# Create menus

function mainMenu {

    # Clear the screen
    clear

    # Create menu
    write-host "1) Search for a CVE Entry Name in the Name field"
    write-host "2. Search within the Description field"
    write-host "[E]xit"
    
    # Prompt the user for a selection
    $u_select = read-host -Prompt "Please select one of the options above"

    # Process the user response
    if ($u_select -eq 1) {
    
        # Call the CVE Name function
        CveName
    
    } elseif ($u_select -eq 2 ) {

        # Call the CVE Description function
        CveDesc

    } elseif ($u_select -eq "E") {

        # exit the program
        exit

    } else {
    
        write-host -backgroundcolor Red -foregroundcolor white "Invalid value"
        sleep 3
        mainMenu
    
    }

} # ends the mainMenu function


# This function will provide a prompt to the user to hit Enter when they are done reviewing the results
# and take them back to the menu they were in.
function allDone  {

    read-host -prompt "Press [Enter] when done."

}

# Process CVE Name task.
function CveName {

    # Clear the screen
    clear

    # Prompt the user
    $Nsearch = read-host -Prompt "Enter the name of the CVE entry you want to search for."

    #Import CSV
    $CVE = Get-Content "$($env:USERPROFILE)\Downloads\cve-test.csv" | Select -skip 2 | ConvertFrom-Csv
   
    # Search for entry
    $Results = $CVE | where {$_.Name -ilike "*$Nsearch*"}

    foreach($Column in $Results) {
        Write-Host 'Name:' $Column.Name `n,'Status:' $Column.Status `n,'Description' $Column.Description

    }

    #Allow user to review results
    allDone

    #Call the mainMenu function
    mainMenu

} # end CVE Name Function

# Process CVE Description task.
function CveDesc {

    # Clear the screen
    clear

    # Prompt the user
    $Word = read-host -Prompt "Enter the name of the CVE entry you want to search for."

    #Import CSV
    $CVE = Get-Content "$($env:USERPROFILE)\Downloads\cve-test.csv" | Select -skip 2 | ConvertFrom-Csv
   
    # Search for entry
    $Results = $CVE | where {$_.Description -ilike "*$Word*"}

    foreach($Column in $Results) {
        Write-Host 'Name:' $Column.Name `n,'Status:' $Column.Status `n,'Description' $Column.Description


    }

    #Allow user to review results
    allDone

    #Call the mainMenu function
    mainMenu

} # end CVE Description Function

# call the mainMenu function
mainMenu
