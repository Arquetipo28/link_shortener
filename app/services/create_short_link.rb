class CreateShortLink
  def initialize(original_link, link_creator = StandardShortLinkCreator)
    @creator = link_creator.new(original_link)
  end

  def call
    @creator.call
  end
end
