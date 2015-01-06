require 'spec_helper'

describe JustShare do
  describe 'Links write spelled & accessible' do
    # SetUp for all tests
    before(:all) do
      @via = 'PageRenter'
      @link = 'http://google.com'
      @message = 'Partiu compartilhar!'
      @hash_tags = ['partiu','partiu2']
      @url_image = 'https://avatars3.githubusercontent.com/u/7591935'

      # Global useful vars
      @base_hash = {via:@via, link:@link, message:@message, hash_tags:@hash_tags, image_url:@url_image}
      
      # Expected URLs generated:
      @link = CGI::escape(@link)
      @facebook_expected_url = "https://www.facebook.com/sharer/sharer.php?u=#{@link}"
      @twitter_expected_url = "https://twitter.com/intent/tweet?text=#{@message}&url=#{@link}&via=#{@via}&hashtags=#{JustShare.array_to_str_params(@hash_tags)}"
      @google_plus_expected_url = "https://plus.google.com/share?url=#{@link}"
      @pinterest_expected_url = "http://pinterest.com/pin/create/bookmarklet?url=#{@link}&description=#{@message}&media=#{@url_image}"
      @tumblr_expected_url = "https://www.tumblr.com/share?u=#{@link}&t=#{@message}"
      @blogger_expected_url = "https://www.blogger.com/blog_this.pyra?u=#{@link}&n=#{@message}"
    end

    # SetUp for each tests
    before(:each) do
      # Dynamic get which test is running
      social_on_test_name = get_current_test_name(self, 0)
      @base_hash[:social] = social_on_test_name.downcase.strip.to_sym

      # Create it url_generated globally to be DRY on the tests
      #@url_generated = JustShare.on(@base_hash)
    end

    it "Global config" do
      JustShare.via=@via
      JustShare.link=CGI::unescape(@link)
      JustShare.message=@message
      JustShare.hash_tags=@hash_tags

      @url_generated = JustShare.on({social: :facebook})
      expect(@url_generated).to be_equals @facebook_expected_url
    end

    it "Facebook" do
      @base_hash[:social] = :facebook
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @facebook_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "Twitter" do
      @base_hash[:social] = :twitter
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @twitter_expected_url
      expect(@url_generated.last).to_not be_equals ','
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "GooglePlus" do
      @base_hash[:social] = 'google-plus'
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @google_plus_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "Pinterest" do
      @base_hash[:social] = :pinterest
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @pinterest_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "Tumblr" do
      @base_hash[:social] = :tumblr
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @tumblr_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end

    it "Blogger" do
      @base_hash[:social] = :blogger
      @url_generated = JustShare.on(@base_hash)
      expect(@url_generated).to be_equals @blogger_expected_url
      #expect(accessible?(@url_generated)).to be_truthy
    end
  end
end