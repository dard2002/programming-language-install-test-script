Write-Host "Language Testing Script by Dylan Armstrong (Useful for when re-installing Windows and needing to test that all languages are installed correctly)."
Write-Host "NOTE: If C/C++ do not work, run them from a VS Developer PowerShell Window!"

function testLanguage($language) {
    Write-Host "-${language} Test-"
    $output
    
    if($language -eq "Python") {
        $output = @(python src\test.py)
    }

    elseif ($language -eq "Ruby") {
        $output = @(ruby src\test.rb)
    }

    elseif ($language -eq "C") {
        cl src\test.c
        $output = @(.\test.exe)
        Remove-Item test.exe
        Remove-Item test.obj
        
    }

    elseif ($language -eq "C++") {
        cl src\test.cpp
        $output = @(.\test.exe)
        Remove-Item test.exe
        Remove-Item test.obj
    }

    elseif ($language -eq "Java") {
        $output = @(java src\test.java)
    }

    else {
        $output = "Script ERROR - Invalid Test"
    }

    Write-Host "Output:" $output

    if($output -eq "Hello World") {
        Write-Host "SUCCESS" -ForegroundColor Green
    } else {
        Write-Host "FAIL" -ForegroundColor Red  
    }
}

testLanguage("Python")
testLanguage("Ruby")
testLanguage("C")
testLanguage("C++")
testLanguage("Java")

# TODO: Kotlin, TypeScript and JavaScript