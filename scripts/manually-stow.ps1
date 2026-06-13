# Run all as Windows administrator, ensure Windows Coreutils are installed first

# Manually Stow Neovim
& "C:\Program Files\coreutils\bin\ln.exe" -s C:\Users\your_user\.dotfiles\nvim\.config\nvim -t C:\Users\your_user\.config

# Manually stow wsl2
& "C:\Program Files\coreutils\bin\ln.exe" -s C:\Users\your_user\.dotfiles\wsl2\.wslconfig C:\Users\your_user\.wslconfig

# Manually stow Alacritty. Ensure alacritty folder exists first.
& "C:\Program Files\coreutils\bin\ln.exe" -s C:\Users\your_user\.dotfiles\alacritty\.config\alacritty\alacritty-personal.toml C:\Users\your_user\.config\alacritty\alacritty-personal.toml
& "C:\Program Files\coreutils\bin\ln.exe" -s C:\Users\your_user\.dotfiles\alacritty\.config\alacritty\alacritty-windows.toml C:\Users\your_user\.config\alacritty\alacritty-windows.toml

# Manually stow git
& "C:\Program Files\coreutils\bin\ln.exe" -s C:\Users\your_user\.dotfiles\git\.gitconfig-aliases C:\Users\your_user\.gitconfig-aliases
& "C:\Program Files\coreutils\bin\ln.exe" -s C:\Users\your_user\.dotfiles\git\.gitignore_global C:\Users\your_user\.gitignore_global

# Manually stow PowerShell, ensure Documents\PowerShell folder exists first. Ensure Powershell 7 is installed, location is different por PS 5.
 & "C:\Program Files\coreutils\bin\ln.exe" -s C:\Users\your_user\.dotfiles\powershell\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 C:\Users\your_user\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
