# coding: UTF-8
import os
import stat
import platform
import shutil
import subprocess 
import glob


# this is a local path vim plugins deploy python script

# remove tree for windows versions because like '.git' files can not removed by shutil lib
# linux use shutil.rmtree for instead

def winRemoveTree(top):
    for root, dirs, files in os.walk(top, topdown=False):
        # change file mode and rm file
        for name in files:
            filename = os.path.join(root, name)
            os.chmod(filename, stat.S_IWUSR)
            os.remove(filename)

        # change sub dirs mode and rm sub dirs
        for name in dirs:
            filename = os.path.join(root, name)
            # os.chmod(filname, stat.S_IWUSR)
            os.rmdir(filename)
        
   # rm top dir 
    os.rmdir(top)

# 1. Download vim plugins to local path:
# such as (which called copy source path)
# windows: E:/vim-plugins-download/; linux: ~/vim-plugins-download/
# here is the current plugins list:
# --- Vundle.vim (this is the plugin for managing all other plugins)
# --- a.vim
# --- ctrlp.vim
# --- nerdcommenter
# --- nerdtree
# --- solarized
# --- tagbar
# --- vim-airline
# --- vim-fugitive
# --- vim-markdown
# --- vim-surround
# --- YouCompleteMe

# 2. Git all downloaded vim-plugins seperately in a new directory:
# such as (which called copy destination path)

# windows: E:/vim-plugins-resp/; linux: ~/vim-plugins-resp/

def myPopen(path, cmd):
    bak_path = os.getcwd()
    os.chdir(path)
    # res = os.popen(cmd + plugin).read().strip('\n')  
    res = subprocess.call(cmd,shell=True)
    if res != 0:
        print ('%s failed!!! return code is %d'% (cmd, res))
    else:
        print('%s sucess %s'%(cmd, path))
    os.chdir(bak_path)

def UnzipAndRemoveZipfiles(path):
# remmove exiting not zip files
    op_type = platform.system()
    for i in os.listdir(path):
        plug_path= os.path.join(path, i) 
        if plug_path not in glob.glob(os.path.join(path,'*.zip')):
            if os.path.isdir(plug_path):
                if('Windows' == op_type):
                    winRemoveTree(plug_path)
                elif('Linux' == op_type):
                    shutil.rmtree(plug_path)
                else:
                    print ('invalid op type')
            else:
                os.remove(plug_path)

# unzip zip files
    myPopen(path, "unzip '*.zip'")

# rename unzipped files
    ori_plugins = os.listdir(path)
    for i in ori_plugins:
        new_name = i.replace("-master", "")
        print('rename  %s -----> %s'%(i, new_name))
        os.rename(os.path.join(path, i), os.path.join(path,new_name))

# remove zip files
    for i in glob.glob(os.path.join(path,'*.zip')):
        os.remove(i)
        print('remove file : %s'%(i))

def doLocalPluginsInstall():
    window_resp_path = "D:\\vim-plugins-resp\\"
    window_download_path = "D:\\vim-plugins-download\\"
    window_rtp_path = "vimfiles\\bundle\\Vundle.vim"
    window_vundle_path = "vimfiles\\bundle\\"
    window_vimrc_path = "_vimrc"

    op_type = platform.system()
    home_path = os.getcwd(); 
    
    print ('********** begin copy plugins from download path to resp path AND make git responsity**********')
    
    print ('op_type type is: ' + op_type)
    print ('op_home_path is: ' + home_path)

# set path
    if('Windows' == op_type):
        resp_path = window_resp_path
        download_path = window_download_path 
        # rtp_path = window_rtp_path 
        # vundle_path = window_vundle_path 
        # vimrc_path = window_vimrc_path 
        rtp_path = os.path.join(home_path, window_rtp_path)
        vundle_path = os.path.join(home_path,window_vundle_path)
        vimrc_path = os.path.join(home_path,window_vimrc_path)
    elif('Linux' == op_type):
        resp_path = os.path.join(home_path, 'vim-plugins-resp')
        download_path = os.path.join(home_path, 'vim-plugins-download')
        rtp_path = os.path.join(home_path, '.vim/bundle/Vundle.vim')
        vundle_path = os.path.join(home_path, '.vim/bundle')
        vimrc_path = os.path.join(home_path, '.vimrc')
    else:
        print ('wrong op_type type')

        
    print('resp_path is : ' + resp_path)
    print('download_path is : ' + download_path)
    print('rtp_path in .vimrc file is: ' + rtp_path)
    print('vundle_path in .vimrc file is: ' + vundle_path)
    print('vim config file of .vimrc path is: ' + vimrc_path)

# unzip all plugins and strip -master postfix
    UnzipAndRemoveZipfiles(download_path)

    if not(os.path.exists(resp_path)):
        os.makedirs(resp_path)

    # dst dir of copytree must not be existed!!!
    if(os.path.exists(vundle_path)):
        if('Windows' == op_type):
            winRemoveTree(vundle_path)
        elif('Linux' == op_type):
            shutil.rmtree(vundle_path)
        else:
            print('invalid op type')

    plugins = os.listdir(download_path)
    print (download_path + 'has the following plugins: ')

    for index, plugin in enumerate(plugins):
        print (str(index) + ' : ' +  plugin)
        download_plugin_path = os.path.join(download_path, plugin)
        resp_plugin_path = os.path.join(resp_path, plugin)
        print('download_plugin_path: ' + download_plugin_path)
        print('resp_plugin_path: ' + resp_plugin_path)

        if(os.path.exists(resp_plugin_path)):
            if('Windows' == op_type):
                winRemoveTree(resp_plugin_path)
            elif('Linux' == op_type):
                shutil.rmtree(resp_plugin_path)
            else:
                print ('invalid op type')

        if 'Vundle' in plugin:
            vundle_plugin_path =  os.path.join(vundle_path, plugin)
            if('Windows' == op_type):
                os.chmod(home_path, stat.S_IWRITE|stat.S_IREAD)
                if not (os.path.exists(vundle_path)): # for windows , can not create more than one dir once
                    os.makedirs(vundle_path)
                shutil.copytree(download_plugin_path, vundle_plugin_path)
            elif('Linux' == op_type):
                shutil.copytree(download_plugin_path, vundle_plugin_path)
            else:
                print ('invalid op type: %s'%(op_type))
            print ('********** copy %s ----------------->  %s  **********'%(download_plugin_path,vundle_plugin_path))

        shutil.copytree(download_plugin_path, resp_plugin_path)
        print ('********** copy %s ----------------->  %s  **********'%(download_plugin_path, resp_plugin_path))
        os.chdir(resp_plugin_path)

        myPopen(resp_plugin_path, "git init");
        myPopen(resp_plugin_path, "git add .");
        myPopen(resp_plugin_path, "git commit -m 'commits' ");

# 3. Modify vim-plugins file path in .vimrc config files
# incluing: set Vundle.vim path AND other vim-plugins path according to the step 2's local resp path

# Vundle file: 
# linux: set rtp+=~/.vim/bundle/Vundle.vim
# windows: set rtp+=$VIM/vimfiles/bundle/Vundle.vim
# other vim-plugins file:///~/vim-plugins-resp/


    print ('********** begin write local file path of plugins to .vimrc file **********')

    if('Windows' == op_type):
        fr = open(vimrc_path, 'r')
        lines = fr.readlines()
        file_line_num = len(lines)-1
        print('%s file line number is %d'%(vimrc_path, file_line_num))
        for i in range(file_line_num):
            if 'set rtp' in lines[i]:
                print ('line ' + str(i) + ': ' + lines[i])
                if('Windows' == op_type):
                    os.chmod(rtp_path, stat.S_IWRITE|stat.S_IREAD)
                    rtp_path = '$VIM/vimfiles/bundle/Vundle.vim'
                lines[i] = lines[i].replace('~/.vim/bundle/Vundle.vim', rtp_path)
        fr.close()

        if('Windows' == op_type):
            os.chmod(vimrc_path, stat.S_IWRITE|stat.S_IREAD)
        fw = open(vimrc_path,'w')
        fw.writelines(lines)
        fw.close()
    try:
        fr = open(vimrc_path, 'r')
        lines = fr.readlines()
        file_line_num = len(lines)-1
        print('%s file line number is %d'%(vimrc_path, file_line_num))
        for i in range(file_line_num):
            if 'LOCAL_PLUGINS_PUT_HERE' in lines[i]:
                print ('********** begin to write plugins local path to .vimrc file **********')
                for index, plugin in enumerate(plugins):
                    if 'Vundle' in plugin:
                        continue
                    if('Windows' == op_type):
                        list = resp_path.split('\\')
                        print ('path split is %s'%(list))
                        new_path = '/'.join(list)
                        print('new_path is %s'%(new_path))
                        local_plugin_path = new_path + plugin 
                    elif('Linux' == op_type):
                        local_plugin_path = os.path.join(resp_path, plugin)
                    else:
                        print ('invalid op type \n')
                    local_plugin_path = "Plugin 'file://" + local_plugin_path +"'"
                    lines[i+index] = lines[i+index].replace("\" LOCAL_PLUGINS_PUT_HERE", local_plugin_path)
                    print ('final local plugin file path : ' + local_plugin_path) 
                break

        fr.close()
        if('Windows' == op_type):
            os.chmod(vimrc_path, stat.S_IWRITE|stat.S_IREAD)
        fw = open(vimrc_path,'w')
        fw.writelines(lines)
        fw.close()

        print ('********** end to write plugins local path to .vimrc file **********')

    except Exception as e:
        print (e)

# 4. Run PluginClean AND PluginInstall
# window_vimrc_path = "$VIM/.vimrc"
# linux_vimrc_path = "~/.vimrc"
# vim PluginClean
# vim PluginInstall qall

    # os.chdir(home_path)
    # clean_cmd = subprocess.Popen('vim PluginClean', shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    # clean_cmd.wait() 
    # if clean_cmd.returncode != 0:
        # print ('Plugin Clean error!!! ' ) 

    # print ('********** Plugin Clean exec sucess: %s **********'%(clean_cmd))

    # install_cmd = subprocess.Popen('vim PluginInstall qall', shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    # install_cmd.wait() 
    # if install_cmd.returncode != 0:
     #    print ('Plugin Install error!!! ' ) 

    # print ('********** Plugin Install exec sucess: %s **********'%(install_cmd))

if __name__ == "__main__":
     doLocalPluginsInstall()
