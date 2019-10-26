module CarouselHelper
  def carousel_for(images, captions)
    Carousel.new(self, images, captions).html
  end

  class Carousel
    def initialize(view, images, captions)
      @view, @images, @captions = view, images, captions
      @uid = SecureRandom.hex(6)
    end

    def html
      content = view.safe_join([indicators, slides, controls])
      view.content_tag(:div, content, id: uid, class: 'carousel slide')
    end

    private

    attr_accessor :view, :images, :captions, :uid
    delegate :link_to, :content_tag, :safe_join, :slide_tag, :image_tag, to: :view

    def indicators
      items = images.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active' : ''),
        data: {
          target: uid,
          slide_to: index
        }
      }
      content_tag(:li, '', options)
    end

    def slides
      slide_blocks = images.zip(captions, (0...images.length).to_a).map { |image, caption, index| slide_tag(image, caption, index.zero?) }
      content_tag(:div, safe_join(slide_blocks), class: 'carousel-inner')
    end


    def slide_tag(image, caption, is_active)
      options = {
        class: (is_active ? 'item active' : 'item')
      }
      slide_block = safe_join([image_tag(image), caption_tag(caption)])
      content_tag(:div, slide_block, options)
    end

    def caption_tag(caption)
      content_tag(:div, content_tag(:h3, caption), class: 'carousel-caption')
    end


    def controls
      safe_join([control_tag('left'), control_tag('right')])
    end

    def control_tag(direction)
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }
      icon = content_tag(:i, '', class: "glyphicon glyphicon-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end
  end
end
