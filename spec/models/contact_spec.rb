require 'rails_helper'

RSpec.describe Contact, :type => :model do
  it "is valid with a first name, last name and email" do
    contact = Contact.new(
      firstname: "Li Yi",
      lastname: "Yang",
      email: "yangliyi@example.com"
    )
    expect(contact).to be_valid
  end

  it "is invalid without a first name" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without a email address" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a duplicate email address" do
    Contact.create(
      firstname: "Li Yi",
      lastname: "Yang",
      email: "yangliyi@example.com"
    )
    contact = Contact.new(
      firstname: "Second",
      lastname: "Tester",
      email: "yangliyi@example.com"
    )
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "returns a contact's full name as a string" do
    contact = Contact.new(firstname: 'Li Yi', lastname: 'Yang',
    email: 'yangliyi@example.com')
    expect(contact.name).to eq 'Li Yi Yang'
  end

  describe "filter last name by letter" do
    before :each do
      @iron_man = Contact.create(
        firstname: "Tony",
        lastname: "Stark",
        email: "tonystark@example.com"
      )
      @spider_man = Contact.create(
        firstname: "Peter",
        lastname: "Parker",
        email: "peterparker@example.com"
      )
      @bat_man = Contact.create(
        firstname: "Bruce",
        lastname: "Wayne",
        email: "brunewayne@example.com"
      )
    end

    context "with matching letters" do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("W")).to eq [@bat_man]
      end
    end

    context "with non-matching letters" do
      it "omits results that do not match" do
        expect(Contact.by_letter("W")).not_to include [@spider_man, @iron_man]
      end
    end
  end

end
