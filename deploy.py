
# coding: UTF-8
import os
import platform
import shutil
import subprocess 


# this is a local path vim plugins deploy python script

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
def init_rep_from_download_plugins():
    window_resp_path = "E:/vim-plugins-resp/"
    window_download_path = "E:/vim-plugins-download/"
    window_rtp_path = "vimfiles/bundle/Vundle.vim"
    window_vundle_path = "vimfiles/bundle/"
    window_vimrc_path = "_vimrc"

    op_type = platform.system()
    home_path = os.getcwd(); 
    
    print ('********** begin copy plugins from download path to resp path AND make git responsity**********')
    
    print ('op_type type is: ' + op_type)
    print ('op_home_path is: ' + home_path)
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

    if not(os.path.exists(resp_path)):
        os.makedirs(resp_path)

    plugins = os.listdir(download_path)
    print (download_path + 'has the following plugins: ')

    for index, plugin in enumerate(plugins):
        print (str(index) + ' : ' +  plugin)
        download_plugin_path = os.path.join(download_path, plugin)
        resp_plugin_path = os.path.join(resp_path, plugin)
        print('download_plugin_path: ' + download_plugin_path)
        print('resp_plugin_path: ' + resp_plugin_path)

        # dst dir of copytree must not be existed!!!
        # if(os.path.exists(vundle_path)):
         #    shutil.rmtree(vundle_path)

        if(os.path.exists(resp_plugin_path)):
            shutil.rmtree(resp_plugin_path)
        
        if 'Vundle' in plugin:
            vundle_plugin_path =  os.path.join(vundle_path, plugin)
            shutil.copytree(download_plugin_path, vundle_plugin_path)
            print ('********** copy %s ----------------->  %s  **********'%(download_plugin_path,vundle_plugin_path))

        shutil.copytree(download_plugin_path, resp_plugin_path)
        print ('********** copy %s ----------------->  %s  **********'%(download_plugin_path, resp_plugin_path))
        os.chdir(resp_plugin_path)

        # git_init_res = os.popen('git init').read().strip('\n')  
        git_init_res = subprocess.Popen('git init', shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        git_init_res.wait() 
        if git_init_res.returncode != 0:
            print ('git_init_error!!! ' ) 
        print('git init sucess %s'%(resp_plugin_path))

        # git_add_res = os.popen('git add .' + plugin).read().strip('\n')  
        git_add_res = subprocess.Popen('git add .', shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        git_add_res.wait() 
        if git_add_res.returncode != 0:
            print ('git_add_error!!! ' ) 
        print('git add sucess %s'%(resp_plugin_path))
            
        # git_commit_res = os.popen("git commit -m'add  " + plugin + " '").read().strip('\n')  
        git_commit_res = subprocess.Popen("git commit -m'add  " + plugin + " '", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        git_commit_res .wait() 
        if git_commit_res.returncode != 0:
            print ('git_commit error!!! ') 
        print('git commit sucess %s'%(resp_plugin_path))

# # 3. Modify vim-plugins file path in .vimrc config files
# # incluing: set Vundle.vim path AND other vim-plugins path according to the step 2's local resp path
# 
# # Vundle file: 
# # linux: set rtp+=~/.vim/bundle/Vundle.vim
# # windows: set rtp+=$VIM/vimfiles/bundle/Vundle.vim
# # other vim-plugins file:///~/vim-plugins-resp/
# 

    print ('********** begin write local file path of plugins to .vimrc file **********')

    if('Windows' == op_type):
        fr = open(vimrc_path, 'r')
        lines = fr.readlines()
        file_line_num = len(lines)-1
        print('%s file line number is %d'%(vimrc_path, file_line_num))
        for i in range(file_line_num):
            if 'set rtp' in lines[i]:
                print ('line ' + str(i) + ': ' + lines[i])
                lines[i] = lines[i].replace('~/.vim/bundle/Vundle.vim', rtp_path)
        fr.close()

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
                    local_plugin_path = os.path.join(resp_path, plugin)
                    local_plugin_path = "Plugin 'file://" + local_plugin_path +"'"
                    lines[i+index] = lines[i+index].replace("\" LOCAL_PLUGINS_PUT_HERE", local_plugin_path)
                    print ('local plugin file path : ' + local_plugin_path) 
                break

        fr.close()

        fw = open(vimrc_path,'w')
        fw.writelines(lines)
        fw.close()

        print ('********** end to write plugins local path to .vimrc file **********')

    except Exception as e:
        print (e)
 # 4. Run PluginClean AND PluginInstall
# window_vimrc_path = "$HOME/.vimrc"
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
     init_rep_from_download_plugins()
