require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should validate_presence_of :title
  should validate_presence_of :code
  should validate_uniqueness_of :code

  should have_many :checkouts
  should have_many(:patrons).through(:checkouts)

  context "calculate available stock" do
    setup do
      @book = FactoryGirl.create(:book)
      @patron1 = FactoryGirl.create(:patron)
      @patron2 = FactoryGirl.create(:patron)
    end

    should "with no checkouts" do
      assert_equal 1, @book.available
    end

    should "with open checkouts" do
      @book.update_attributes(stock: 5)
      @book.checkouts.create(patron: @patron1)
      @book.checkouts.create(patron: @patron2)
      assert_equal 3, @book.available
    end

    should "with some open and closed checkouts" do
      @book.update_attributes(stock: 5)
      @book.checkouts.create(patron: @patron1)
      @book.checkouts.create(patron: @patron2, status: 'returned')
      assert_equal 4, @book.available
    end
  end
end
