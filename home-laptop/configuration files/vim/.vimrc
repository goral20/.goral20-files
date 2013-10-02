filetype plugin on

"Ustawienie ilości kolorów
set t_Co=256

"Ustawienie trybu rozszerzonego VIma, zamiast domyślnego, kompatybilnego z Vi
set nocompatible

"Ustawienie schemat kolorów
colorscheme mustang

"Włączenie kolorowania składni
syntax on

"Automatycznie ustawia wcięcie nowej linii
set autoindent
set smartindent

"Zawijanie kodu
"metoda
set foldmethod=marker
"znaki
"set foldmarker=[[[,]]]

"Wcięcia
"set paste
set nopaste

"Domyślna długość znaku tabulacji
set tabstop=8

"Domyślna długość wcięcia/przesunięcia
set shiftwidth=4

"Zmieniaj wcięcie wyrównując do wartości zmiennej shiftwidth
set shiftround

"Automatycznie użyj spacji zamiast znaku tabulacji
set expandtab

set cmdheight=2 "command bar is 2 high
set backspace=indent,eol,start "set backspace function
set textwidth=0 
set autoread "auto read when file is changed from outside

"Po wcisnieciu F11 włączony jest tryb wklejeania bez autoformatowania
set pastetoggle=<F11>

"Podświetlnie wyszukiwania
set hlsearch

"Wyszukuje frazę podczas wpisywania szukanego słowa
set incsearch

"Ignoruj wielkość znaków podczas wyszukiwania
set ignorecase

"Wyłącz ignorowanie jeżeli w szukanej frazie występuje wielka litera
set smartcase

"Obsługa myszki
set mouse=a

"ukrywanie wskaźnika myszy gdy się pisze
"set mousehide
"set linebreak

"Zapisuje w widoku tylko pozycję kursora
set viewoptions=cursor

"Konfiguracja informacji zapisywanych w pliku .viminfo
set viminfo='20,<1000,h,f0

"Dodaj klawisze kursora do przechodzenia pomiędzy liniami
set whichwrap+=<,>,[,]

"Pokazuje listę możliwych dopełnień na pasku statusów
set wildmenu

"Ustawienie podpowiedzi polecenia po <tab> w trybie komend
set wildmode=list:longest,full

"Pokazuj wiersz stanu
set modeline

"Zawsze pokazuj pasek statusu
set laststatus=2

"Format statusu
"set statusline=%y[%{&ff}]\ \ ASCII=\%03.3b,HEX=\%02.2B\ %=%m%r%h%w\ %1*%F%*\ %l:%v\ (%p%%)
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)\ \b\:%-04O\ \c\:%03b\ %P

"Pokazuje statystyki
set ruler

"Historia
set history=100

"Tworzy kopie zapasowe plików
set backup

"Określa katalog, w którym tworzone będą kopie zapasowe
set backupdir=/media/Dane/Backup/Vim

"Pokazuje tryb w jakim jesteśmy w lewym dolnym rogu
set showmode

"Pokazuje polecenia w prawym dolnym rogu
set showcmd

"Ustaw zawartość linii statusu
set rulerformat=%l,%c%V%=#%n\ %3p%%

"Nie przerysowuj ekranu podczas wykonywania makr, rejestrów itp
set lazyredraw

"Ustaw znaki zastępujące znak tabulatora i białe znaki na końcach linii.
"Włączane tylko dla niektórych plików, lub poprzez wywołanie komendy
set list
set listchars=tab:▸-,trail:·
"set unlist

"Włącza numerowanie wierszy
set number

"Pokazuwanie numeru linii
set nu

"Podswietla linie, w ktorej znajduje sie kursor
set cursorline

"Pokaż otwierający nawias gdy wpisze zamykający
set showmatch

"Minimalna liczba wierszy zawsze widocznych nad i pod kursorem
set ignorecase

"Pokazuj tytuł pliku w nagłówku
set title

"Nie zawija wierszy
"set nowrap

"Minimalna liczba wierszy zawsze widocznych nad i pod kursorem
set scrolloff=5

"Nie zapisuj plików backupu/writeback/swapfile
"set nobackup
"set nowb
"set noswapfile

"Domyślna długość znaku tabulacji
"set gfn=Courier\ 12

"Opcje parametryczne
"set bs=2    " backspace jest rowny przesunieciu o 2 spacje*
set wm=0    " margines po ktorym tekst jest zawijany
set tw=0    " szerokosc tekstu nieograniczona
"set ts=2    " dlugosc tabulatora w znakach*
"set st=2    " dlugosc inteligentnego tabulatora*
"set sw=2    " dlugosc przesuniecia po tab*
set so=2    " dwie linie przed i po ekranie powoduja juz przewijanie
set ss=25   " wielkosc przewiniecia poziomego przy wyjsciu poza ekran
set go=fc       " wylacza wszystkie dodatki gui
set hh=10       " wysokosc okna pomocy
"set fo=tcq " opcje formatowania kodu
set fo=tcrqn2
"set wh=25      " minimalna wysokosc aktywnego okna (dobre!)
set hh=10       " wysokosc okna z helpem
set mat=2       " dlugosc w n*0.1s pokazywania dopasowania nawiasow
set mls=10  " ilosc linii od koncow ktora jest sprawdzana na #vim ...
"* z czasem można usunąć te opcje

set ofu=syntaxcomplete#Complete
"Sprawdzanie pisowni
setglobal spell spelllang=pl_pl

"Kodowanie
" chwilo wyłączone bo sprawia to problemy przy edycji plików na serwerze
" dwie ostatnie były dobrze
set termencoding=utf-8              " kodowanie terminala
set fileencoding=utf-8              " kodowanie plików
set encoding=utf-8                  " kodowanie·
set fileencodings^=utf-8

"Zmapowane klawisze-funkcje
"Uruchom skrypt w sh F2
map <F2> :!sh %<CR>
"Uruchom skrypt w pythonie F3
map <F3> :!python -q %<CR>
"Odświeżanie F5
map <F5> :edit! %<CR>
"Zapis F6
map <F6> :w %<CR>
"Zapis wymuszony F7
map <F7> :w! %<CR>
"Zapisz i wyjdź F8
map <F8> :wq %<CR>
"Zapisz i wyjdź wymuszony F9
map <F9> :wq! %<CR>
" Wyjście
map <F10> :q <CR>
