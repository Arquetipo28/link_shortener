require 'rails_helper'

RSpec.describe ShortLinks::Repository do
  describe '.update_count' do
    context 'with existent short_link' do
      let(:short_link) { create(:short_link, shorted_link: 'http://localhost:3000/test') }

      it 'should update visited_count' do
        described_class.update_count(short_link.shorted_link)
        short_link.reload
        expect(short_link.visited_count).to eq 1
      end
    end
  end

  describe '.top_links' do
    context 'with existent top links' do
      before :each do
        create(:short_link, visited_count: 1)
      end

      it 'should return one short link' do
        top_links = described_class.top_links
        expect(top_links.size).to eq 1
      end
    end
  end
end
