require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:comment){build(:comment)}

  describe "associations" do
  	#  belongs_to :author
  	it { is_expected.to respond_to(:author) }

  	#  has_many :likes, as: :likable, dependent: :destroy
  	it { is_expected.to respond_to(:likes) }

  end

  describe "creating a comment" do
	  #  validates :author_id, :body, presence: true
  	it "should validate the presence of author_id" do
  		# expect(comment.author_id).to_be a_integers
  		expect(comment).to validate_presence_of :author_id
  	end

  	it "should validate the presence of author" do
  		comment.author_id = 999999
  		expect{ comment.save! }.to raise_error
  	end

  	it "should not allow a blank comment" do
	  	expect(comment).to validate_presence_of :body
	  end

  end
end