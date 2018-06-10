
**This is a local path vim plugins deploy python script** 

#  files descriptions
1. deploy.py: 
	deploy local vim plugins to linux or windows os (gvim and vim version lower than 8.0)
2. deployNew.py:
	deploy local vim plugins to linux or windows os (gvim and vim version above 8.0)
3. cs.sh:
	cscope shell script to update and generate tags files for cpp files
4. vimcfg.vimrc:
	vim config file by default (will be modified after running `deploy.py` script)

#  usage decriptions
## Windows:
	1. Install gvim and create a system variable for $VIM (command `set VIM` under console windows to check out whether the variable exists or not))
	2. Install git bash (git windows console cmd can be used)
	3. Install python
	4. Copy `deployNew.py` and `vimcfg.vimrc` to $VIM path(for linux $VIM = ~(current user directory) and for windows $VIM = vim install path
    5. Rename vimcfig.vimrc(for linux rename it to `.vimrc` and for windows rename it to `_vimrc`
    6. Create a directory named `vim-plugins-download` under $VIM path and copy ALL zip files downloaded from github to this directory (`-master` suffix should be reserved)
    7. Run the following command under $VIM directory and input the git account if necessary: 
       `python deployNew.py` 
    8. Check and open the vim config file (`.vimrc` in linux or `_vimrc` in windows)
    9. Run Vundle command under $VIM directory:
        `PluginInstall` 
       install the plugins which are downloaded in the `vim-plugins-download` file
        `PluginList`
       check whether the plugins have been installed correctly or not

## Linux:
	1. Install vim if necessary (vim has been installed in linux generally by default)
	2. Install git
	3. Install python
	4. Copy `deployNew.py` and `vimcfg.vimrc` to $VIM path(for linux $VIM = ~(current user directory) and for windows $VIM = vim install path
    5. Rename `vimcfig.vimrc(for` linux rename it to `.vimrc` and for windows rename it to `_vimrc`
    6. Create a directory named `vim-plugins-download` under $VIM path and copy ALL zip files downloaded from github to this directory (`-master` suffix should be reserved)
    7. Run the following command under $VIM directory and input the git account if necessary: 
       `python deployNew.py`
    8. Check and open the vim config file (`.vimrc` in linux or `_vimrc` in windows)
    9. Run Vundle command under $VIM directory
        `PluginInstall`
        install the plugins which are downloaded in the 'vim-plugins-download' file
        `PluginList`
        check whether the plugins have been installed correctly or not
