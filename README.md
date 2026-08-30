# CD package
A4 paper to wrap CD of 12cm diameter

![](https://shields.io/badge/dependencies-PowerShell_7-navy)
![](https://shields.io/badge/dependencies-xelatex-darkgreen)
![](https://shields.io/badge/languages-zh--CN,_en-pink)

## Install

Run the following commands in PowerShell.

```powershell
.\install_fonts.ps1
```

## Usage

Prepare

-   File path of album cover (relative to `main.tex` or absolute, backslash → slash)
-   Album name
-   Album authors
-   List of audios in the album (separated by comma, audios after 9-th will be hidden)

Create `config.tex` in the program's root folder and write the following content.

```tex
\newcommand{\AlbumCoverPath}{}
\newcommand{\AlbumName}{}
\newcommand{\AlbumAuthors}{}
\DefineTracklist{\TrackList}{
    
}
```

Fill in the album information in the second bracket of each line.

Run the following commands in PowerShell.

```powershell
xelatex main.tex
```

[Example](./example/Fantasyland.pdf)

