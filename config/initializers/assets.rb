Rails.application.config.assets.precompile += %w( progressbar.gif )
Rails.application.config.assets.precompile += %w( loading.gif )
Rails.application.config.assets.precompile += ['*.js', '*.css', '*.css.erb']
Rails.application.config.assets.precompile += %w( application.css )
Rails.application.config.assets.precompile += ["fontawesome-webfont.ttf", "fontawesome-webfont.eot", "fontawesome-webfont.svg", "fontawesome-webfont.woff"]
Rails.application.config.assets.precompile += %w( fileicons/*.* )
