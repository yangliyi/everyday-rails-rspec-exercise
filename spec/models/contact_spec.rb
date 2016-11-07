require 'rails_helper'

describe Contact do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it"has three phone numbers" do
    expect(create(:contact).phones.count).to eq 3
  end

  it "is invalid without a first name" do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    contact = build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without a email address" do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a duplicate email address" do
    create(:contact, email: "yangliyi@example.com")
    contact = build(:contact, email: "yangliyi@example.com")
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "returns a contact's full name as a string" do
    contact = build(
      :contact,
      firstname: 'Li Yi',
      lastname: 'Yang'
    )
    expect(contact.name).to eq 'Li Yi Yang'
  end

  describe "filter last name by letter" do
    before :each do
      @iron_man = create(
        :contact,
        firstname: "Tony",
        lastname: "Stark",
      )
      @spider_man = create(
        :contact,
        firstname: "Peter",
        lastname: "Parker",
      )
      @bat_man = create(
        :contact,
        firstname: "Bruce",
        lastname: "Wayne",
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
