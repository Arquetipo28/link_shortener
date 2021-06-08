class StandardShortLinkCreator
  HOST = 'localhost:3000/'

  def initialize(original_link)
    @original_link = original_link
  end

  def call
    new_short_link = ShortLink.create!(original_link: @original_link)
    new_short_link.tap do |short_link|
      short_link.update(shorted_link: "#{HOST}#{new_short_link.id}")
    end
  end
end
