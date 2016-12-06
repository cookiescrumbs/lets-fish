#Monkey patched the https://github.com/kpumuk/meta-tags/blob/367ded495135a9224058cba1454ba3661b743375/lib/meta_tags/renderer.rb
#to include amphtml link https://www.ampproject.org/docs/guides/discovery
module MetaTags
  class Renderer
    def render_links(tags)
      [ :amphtml, :canonical, :prev, :next, :author, :publisher, :image_src ].each do |tag_name|
        href = meta_tags.extract(tag_name)
        if href.present?
          @normalized_meta_tags[tag_name] = href
          tags << Tag.new(:link, rel: tag_name, href: href)
        end
      end
    end
  end
end
