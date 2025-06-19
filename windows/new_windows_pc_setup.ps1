winget install Git.Git --silent
winget install Mozilla.Firefox --silent
winget install Zoom.Zoom --silent
winget install Discord.Discord --silent
winget install WinSCP.WinSCP --silent
winget install Bitwarden.Bitwarden --silent
winget install VIdeoLAN.VLC --silent
winget install Valve.Steam --silent
winget install 7zip.7zip --silent
winget install Microsoft.PowerToys --silent
winget install Neovim.Neovim --silent
winget install Cygwin.Cygwin --silent
winget install RustDesk.RustDesk --silent
winget install Google.GoogleDrive --silent
winget install VSCodium.VSCodium --silent
winget install WiresharkFoundation.Wireshark --silent
winget install zig.zig --silent
winget install Rustlang.Rustup --silent
winget install JanDeDobbeleer.OhMyPosh -s winget
winget install Hugo.Hugo --silent

cd ~\Downloads -and git clone git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd ~\Downloads\nerd-fonts\ -and .\install

cd ~ and mkdir Projects
cd ~\Projects -and git clone https://github.com/ofgrenudo/confs.git
