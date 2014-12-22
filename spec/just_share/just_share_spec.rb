require 'spec_helper'

describe JustShare do
  describe 'Links write spelled & accessible' do
    # SetUp for all tests
    before(:all) do
      # TODO REFACTOR THE COUNTER, IT IS BEING RESETED
      via = 'PageRenter'
      link = 'http://google.com'
      message = 'Partiu compartilhar!'
      hash_tags = ['partiu','partiu2']

      # Global useful vars
      @base_hash = {via:via, link:link, message:message, hash_tags:hash_tags}
      
      # Expected URLs generated:
      @facebook_expected_url = "https://www.facebook.com/sharer/sharer.php?u=#{link}"
      @twitter_expected_url = "https://twitter.com/intent/tweet?text=#{message}&url=#{link}&via=#{via}&hashtags=#{JustShare.array_to_str_params(hash_tags)}"
      @google_plus_expected_url = "https://plus.google.com/share?url=#{link}"
    end

    # SetUp for each tests
    before(:each) do
      # Dynamic get which test is running
      social_on_test_name = get_current_test_name(self, 0)
      @base_hash[:social] = social_on_test_name.downcase.strip.to_sym

      # Create it url_generated globally to be DRY on the tests
      #@url_generated = JustShare.on(@base_hash)
    end

    it "Facebook link should be okay & accessible" do
      @base_hash[:social] = :facebook
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @facebook_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "Twitter" do
      @base_hash[:social] = :twitter
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @twitter_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "GooglePlus" do
      @base_hash[:social] = 'google-plus'
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @google_plus_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "Pinterest" do
    end

    it "Tumblr" do
    end
  end
end