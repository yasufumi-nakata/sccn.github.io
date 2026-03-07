# Rewrites root-relative href/src attributes in rendered HTML to include
# the configured baseurl.  This lets Markdown authors write simple paths
# like /others/foo.html or /assets/images/bar.png without worrying about
# the project-page prefix.

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless doc.output_ext == ".html"

  baseurl = doc.site.config['baseurl'].to_s
  next if baseurl.empty? || baseurl == "/"

  safe = Regexp.escape(baseurl.sub(%r{^/}, ''))

  doc.output = doc.output.gsub(
    /((?:href|src)\s*=\s*")\/(?!\/|#{safe}[\/"])/
  ) do
    "#{$1}#{baseurl}/"
  end
end
