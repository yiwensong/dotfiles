 # Configure path to z (autojump)
set -gx _Z_DATA $XDG_CACHE_HOME/z_datafile

######### MIGRATION ################
set old_z $XDG_CONFIG_HOME/z
if test -d $old_z
    printf 'Removing old z directory: %s' $old_z
    rm -rf $old_z
end

set datafile $XDG_CACHE_HOME/z_datafile
if test -e ~/.z
    printf 'Migrating z data file from ~/.z to %s' $datafile
    cp ~/.z ~/.z.bak
    mv ~/.z $datafile
end

# Bug fix in z so that we don't need to set Z_SCRIPT_PATH
omf update z
set -e Z_SCRIPT_PATH

set z_submodule $OMF_PATH/pkg/z/
git -C $z_submodule submodule update
