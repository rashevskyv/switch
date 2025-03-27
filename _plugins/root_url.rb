Jekyll::Hooks.register :site, :post_write do |site|
	# Копіювання українського index.html в корінь
	FileUtils.cp(site.in_dest_dir('uk/index.html'), site.in_dest_dir('index.html'))
 end