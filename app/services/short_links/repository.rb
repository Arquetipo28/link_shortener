class ShortLinks::Repository
  class << self
    def update_count(shorted_link)
      short_link = ShortLink.find_by(shorted_link: shorted_link)
      short_link.update!(visited_count: short_link.visited_count + 1)
    end

    def top_links
      ShortLink.order(visited_count: :desc).limit(100)
    end
  end
end
