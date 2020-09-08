#!/bin/bash -


# Copy the coc settings file into the nvim config directory 
copy_coc_settings ()
{
	cp "$PWD/coc-settings.json" "$HOME/.config/nvim"
}	# ----------  end of function copy_coc_settings  ----------

copy_coc_settings
