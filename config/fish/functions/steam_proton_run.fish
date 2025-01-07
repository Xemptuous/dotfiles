function steam_proton_run
    set compat_dir "$HOME/.local/share/Steam/steamapps/compatdata/$argv[1]/"
    set proton_dir "$HOME/.local/share/Steam/steamapps/common/Proton - Experimental/proton"
    cd $compat_dir/pfx
    STEAM_COMPAT_DATA_PATH="$compat_dir" STEAM_COMPAT_CLIENT_INSTALL_PATH="$compat_dir" WINEPREFIX=$PWD "$proton_dir" run $argv[2]
end
