## Lab 01

- Name: Seth Lyall
- Email: lyall.5@wright.edu

## Part 1 - GitHub Profile

1. [Seth-Lyall's GitHub Profile](FIXTHISURL-https://github.com/Seth-Lyall)

## Part 2 - Research

| Windows | Linux / Mac | Action |
| ---     | ---         | ---    |
| help    | man         |Gives information about powershell, provides links to online help, and provides information about the help feature.|
| Get-Location | pwd    |Displays the current file path.|
| Get-ChildItem | ls    |Shows all files and folders in the current directory.|
| mkdir   | mkdir       |Creates a new directory with a specified name.|
| Set-Location | cd     |Sets your directory to a specified file or folder in your current directory.|
| New-Item | touch      |Creates a new file in the current directory.|
| Move-Item | mv        |Moves a specified item from the current directory to a specified directory.|
| Copy-Item | cp        |Copies a specified item from the current directory back into the current directory with a new name.|
| Remove-Item | rm      |Removes a specified item from the current directory along with any items contained within.|
| notepad.exe | vim     |Opens notepad.exe|

## Part 3 - Command Line Navigation

My OS is:
- [x] Windows
- [] Linux
- [] Mac

My Command Line Shell is: Windows Powershell

### Navigating My OS on the Command Line

1. Full / absolute path to your user's home directory: C:\Users\lyall
2. Create a directory named `DirA`: mkdir DirA
3. Create a directory named `Dir B`: mkdir "Dir B"
4. Go into `DirA`: cd DirA
5. Go into `Dir B` from `DirA`: cd .. | cd "Dir B"
6. Return to your user's home directory: cd ..
7. Create a file named `test.txt`: New-Item text.txt
8. Move the file named `test.txt` into `DirA`: mv text.txt DirA
9. Contents of `test.txt`:
```
This is a test file.
```
10. Make a copy of `test.txt` named `copy.txt` in `DirA`: cd DirA | cp text.txt copy.txt
11. View the contents of `DirA`: ls
12. Make a copy of `test.txt` in `Dir B` named `fodder.txt`: cp text.txt fodder.txt | mv fodder.txt "C:\Users\lyall\Dir B"
13. Delete / remove both `fodder.txt` AND `Dir B`: cd .. | rm "Dir B" | A

## Citations

To add citations, provide the site and a summary of what it assisted you with.  If generative AI was used, include which generative AI system was used and what prompt(s) you fed it.



