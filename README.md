# CD package
A4 paper to wrap CD of 12cm diameter

![](https://shields.io/badge/dependencies-PowerShell_7-navy)
![](https://shields.io/badge/dependencies-xelatex-darkgreen)

## Install

In PowerShell, let the current directory be the program's root directory.

Depending on the language of the template to use, run the following command. If target language is not mentioned, do nothing.

Run the following command in PowerShell.

```
$packages = Get-Content requirements_en.txt | Where-Object { $_.Trim() -ne "" }
tlmgr install $packages
tlmgr path add
```

---

**Chinese (simplified)**

```
.\install_fonts\zh_CN.ps1
```

---


## Usage

Prepare

-   File path of album cover (relative to the program's root directory or absolute, backslash → slash)
-   Album name
-   Album authors
-   List of audios in the album (maximum 9 tracks, overflowed will be hidden)
-   Choose a language code (refer to the language code table)

>   [!note]
>
>   The language code will determine the font for album name, authors, track list, and instruction text. 
>
>   While the pre-defined font of each language usually cover ASCII, they don't cover the whole UTF-8 set because the most number of characters a font file can define is 65536. Therefore, if the user wants to display instruction text and album information in different languages, or the album information contains more than two languages other than ASCII set, it's not possible.
>
>   Install font (follow "Install" section) before using corresponding language code.

Language code:

| Name                 | Code    | Example                              |
| -------------------- | ------- | ------------------------------------ |
| English              | `en`    | [Example](./examples/main_en.pdf)    |
| Chinese (simplified) | `zh_CN` | [Example](./examples/main_zh_CN.pdf) |

Create `config.tex` in the program's root folder and write the following content. Fill in the album information in the second bracket of each command.

```tex
\newcommand{\AlbumCoverPath}{}
\newcommand{\AlbumName}{}
\newcommand{\AlbumAuthors}{}
\DefineTracklist{\TrackList}{
    % one track name per line, separated (line ended) by ASCII comma
    
}
\newcommand{\LangCode}{}  % required
```

Run the following command in PowerShell.

```powershell
xelatex main.tex
```

