# UnibsDown

## Saves Microsoft Stream videos uploaded by Universit√† degli studi di Brescia.

This project was originally based on https://github.com/sup3rgiu/PoliDown

Improvements in this fork:
 - Unibs autologin

For Unibg students: https://github.com/pacho94/UnibgDown

## PREREQS

* [**Node.js**](https://nodejs.org/it/download/): anything above v8.0 seems to work.
* [**aria2**](https://github.com/aria2/aria2/releases): this needs to be in your `$PATH` (for example, copy aria2c.exe to c:\windows). UnibsDown calls `aria2c` with a bunch of arguments in order to improve the download speed.
* [**ffmpeg**](https://www.ffmpeg.org/download.html): a recent version (year 2019 or above), in [`$PATH`](https://www.thewindowsclub.com/how-to-install-ffmpeg-on-windows-10).

## Windows Installation instructions
(On others OS is pretty much the same)\
**N.B:** ffmpeg.zeranoe.com closed since Sep 18, 2020. If you are following the video tutorial, download ffmpeg from another source available on [ffmpeg site](https://www.ffmpeg.org/download.html) (nightly build is no more required)

[![https://user-images.githubusercontent.com/7725068/76635047-21a89080-6547-11ea-8da9-31831ca7620a.png](https://user-images.githubusercontent.com/7725068/76635345-a1cef600-6547-11ea-991b-d115946ed556.png)](http://www.youtube.com/watch?v=iZgea4t5YW4 "PoliDown Windows Installation Instructions")


## USAGE

* Clone this repo
* `cd` into the cloned folder
* `npm install` to install dependencies

### COMMAND LINE USAGE

Default usage:
```
$ node unibs.js --username CODICEPERSONA --videoUrls "https://web.microsoftstream.com/video/VIDEO-1"

$ node unibs.js -u CODICEPERSONA -v "https://web.microsoftstream.com/video/VIDEO-1"
```

Show options:
```
$ node unibs.js -h

Options:
  --version              Show version number                           [boolean]
  -v, --videoUrls                                             [array] [required]
  -f, --videoUrlsFile    Path to txt file containing the URLs (one URL for each line) [string]
  -u, --username         Codice Persona Unibs               [string] [required]
  -p, --password                                                        [string]
  -o, --outputDirectory                             [string] [default: "videos"]
  -q, --quality          Video Quality [0-5]                            [number]
  -k, --noKeyring        Do not use system keyring    [boolean] [default: false]
  -h, --help             Show help                                     [boolean]
```

Multiple videos download:
```
$ node unibs.js -u CODICEPERSONA
    -v "https://web.microsoftstream.com/video/VIDEO-1"
                "https://web.microsoftstream.com/video/VIDEO-2"
                "https://web.microsoftstream.com/video/VIDEO-3"
```

Download from TXT file (one link each line):
```
$ node unibs.js -u CODICEPERSONA -f "/my/path/here/links.txt"
```

Define default video quality [0-5] (avoid manual prompt for each video):
```
$ node unibs.js -u CODICEPERSONA -v "https://web.microsoftstream.com/video/VIDEO-1" -q 4
```

Output directory (relative or absoulte path):
```
$ node unibs.js -u CODICEPERSONA -v "https://web.microsoftstream.com/video/VIDEO-1" -o "/my/path/here"
```

Replace saved password
```
$ node unibs.js -u CODICEPERSONA -p MYNEWPASSWORD -v "https://web.microsoftstream.com/video/VIDEO-1"
```

Do not use system keyring to save the password:
```
$ node unibs.js -u CODICEPERSONA -v "https://web.microsoftstream.com/video/VIDEO-1" -k
```


You can omit the password argument. UnibsDown will ask for it interactively and then save it securely in system's keychain for the next use.

### SCRIPT USAGE

Fill in the required fields in the `.sh` \ `.bat` script (according to your OS: `.sh` for MacOS/Linux, `.bat` for Windows).

Example (Windows):
```
@echo off
rem Put your settings in place of the dots
rem Remember! Assignment is space-sensitive!
 
set unibsdown_folder_path="C:\MyFolder\AnotherFolder\UnibsDown"
set codice_persona=10026431
set urls_file_path="C:\Users\supergiu\Desktop\links.txt"
set output_folder_path="C:\Users\supergiu\Desktop"
set quality_number=4

cd /D %unibsdown_folder_path%
node unibs.js -u %codice_persona% -f %urls_file_path% -o %output_folder_path% -q %quality_number%
@echo.
@echo Press any key to terminate . . .
@pause >nul
```

Then:
* for Windows, double click on the `.bat` script and enjoy
* for MacOS/Linux, `.sh` script needs to be made executable (`chmod 777` command or just set properly flag in file properties). Then, run it with Terminal

